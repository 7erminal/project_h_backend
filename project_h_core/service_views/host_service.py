from django.shortcuts import render
from django.contrib.auth.models import User
from django.db.models import FloatField
from django.db.models.expressions import RawSQL
from rest_framework import viewsets
from datetime import date, datetime, timedelta
from rest_framework.response import Response
from rest_framework import status
# from drf_multiple_model.views import ObjectMultipleModelAPIView
import random, string
# from django.contrib.auth.hashers import make_password
# from rest_framework.parsers import MultiPartParser, FormParser

from project_h_core.models import Hosted_service
from project_h_core.models import Service_images
from project_h_core.models import Services
from project_h_core.models import Service_reviews
from project_h_core.models import HostDetails
from project_h_core.models import Customers
from project_h_core.models import Currencies

from project_h_core.serializers import HostServiceSerializer
from project_h_core.serializers import HostedServicesSerializer
from project_h_core.serializers import AddReviewSerializer

from project_h_core.serializers import IdSerializer

import logging
logger = logging.getLogger("django")

class GetHostedServices(viewsets.ViewSet):
    def retrieve(self, request):
        logger.info("Get hosted services Request params are ")
        logger.info(request.query_params)
        latitude = request.query_params.get('latitude')
        longitude = request.query_params.get('longitude')

        serviceId = request.query_params.get('serviceId')

        base_queryset = Hosted_service.objects.all()
        if serviceId is not None and str(serviceId).strip() != "":
            base_queryset = base_queryset.filter(service_id=serviceId)

        queryset = base_queryset

        # Apply geo filtering only when both params are provided.
        if latitude and longitude:
            logger.info(f"Filtering hosted services by location: Latitude={latitude}, Longitude={longitude}")
            try:
                float(latitude)
                float(longitude)
            except (TypeError, ValueError):
                return Response(
                    {"detail": "Latitude and Longitude must be valid numbers."},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            try:
                radius_km = float(request.query_params.get('radius', 5))
            except (TypeError, ValueError):
                return Response(
                    {"detail": "radius must be a valid number."},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            if radius_km < 0:
                return Response(
                    {"detail": "radius must be greater than or equal to 0."},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            distance_sql = """
        6371 * acos(
            cos(radians(%s)) * cos(radians(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(location_cordinates, ',', 1), ',', -1) AS FLOAT)))
            * cos(radians(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(location_cordinates, ',', 2), ',', -1) AS FLOAT)) - radians(%s))
            + sin(radians(%s)) * sin(radians(CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(location_cordinates, ',', 1), ',', -1) AS FLOAT)))
        )
    """

            annotated_queryset = base_queryset.annotate(
                distance=RawSQL(distance_sql, [latitude, longitude, latitude], output_field=FloatField())
            ).order_by('distance')

            # Retry with larger radii (+5 each time) up to 3 increments.
            queryset = None
            for attempt in range(4):
                current_radius = radius_km + (attempt * 5)
                candidate_queryset = annotated_queryset.filter(distance__lte=current_radius)
                if candidate_queryset.exists():
                    queryset = candidate_queryset
                    break
                else:
                    logger.info(f"No services found within {current_radius} km. Retrying with a larger radius...")

            # If nothing found after all retries, return all services.
            if queryset is None:
                queryset = base_queryset
        elif latitude or longitude:
            return Response(
                {"detail": "Provide both latitude and longitude to apply location filtering."},
                status=status.HTTP_400_BAD_REQUEST,
            )

        # logger.info(hosted_service.values())

        return Response(HostedServicesSerializer(queryset, many=True).data,status.HTTP_202_ACCEPTED)

# Get Hosted Services by Category ID
class GetHostedServicesByCategory(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        logger.info("Params are ")
        logger.info(request.query_params)

        if serializer.is_valid(raise_exception=True):
            logger.info("Valid serializer")
            if serializer.data['id'] != '1':
                queryset_data = Hosted_service.objects.filter(service_id=serializer.data['id']).prefetch_related('hosted_service_images','hosted_service_reviews')
            else:
                queryset_data = Hosted_service.objects.prefetch_related('hosted_service_images','hosted_service_reviews')

            logger.info('data returned for hosted services is ')
            logger.info(HostedServicesSerializer(queryset_data, many=True).data)

            return Response(HostedServicesSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)

# Get Hosted Services by User
class GetHostedServicesByUser(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        if serializer.is_valid(raise_exception=True):
            queryset_data = Hosted_service.objects.filter(user=serializer.data['id'])
            
            logger.info('data returned for my hosted services is ')
            logger.info(HostedServicesSerializer(queryset_data, many=True).data)

            return Response(HostedServicesSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)

# Get Hosted Service Reviews
class GetHostedServiceReviews(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        if serializer.is_valid(raise_exception=True):
            queryset_data = Hosted_service.objects.filter(hosted_service_id=serializer.data['id']).prefetch_related('hosted_service_reviews')

            logger.info('data returned for service reviews is ')
            logger.info(HostedServicesSerializer(queryset_data, many=True).data)

            return Response(HostedServicesSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)

# Add Review
class AddReviewViewSet(viewsets.ViewSet):
    def create(self, request):
        serializer = AddReviewSerializer(data=request.data)

        if serializer.is_valid(raise_exception=True):
            hosted_service = Hosted_service.objects.get(hosted_service_id=serializer.data['hosted_service_id'])
            user = User.objects.get(id=serializer.data['user_id'])
           
            hosted_service_review = Service_reviews(
                    hosted_service=hosted_service,
                    review_by = user,
                    review=serializer.data['review'],
                    active=1,
                    created_by=serializer.data['user_id']
                )

            hosted_service_review.save()

            hosted_service = Hosted_service.objects.filter(hosted_service_id=serializer.data['hosted_service_id']).prefetch_related('hosted_service_reviews');

            logger.info("Hosted service reviews are/is .... ")
            logger.info(HostedServicesSerializer(hosted_service, many=True).data)

            return Response(HostedServicesSerializer(hosted_service, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)


# Add Hosted Service
class HostServiceViewSet(viewsets.ViewSet):
    def create(self, request):
        serializer = HostServiceSerializer(data=request.data)

        if serializer.is_valid(raise_exception=True):
            logger.info("About to save service ")
            logger.info(request.data)
            logger.info(serializer.data['parent_service'])
            logger.info(serializer.data)

            user_ = User.objects.get(id=serializer.data['id'])
            service_ = Services.objects.get(service_id=serializer.data['parent_service'])
            currency_ = Currencies.objects.get(currency_id=serializer.data['currency'])

            logger.info(serializer.data['process'])

            processed = serializer.data['process']

            customer_ = Customers.objects.get(user=user_)

            hostDetails = HostDetails.objects.get(customer=customer_)

            # if serializer.data['process'] != None:
            #     stri = ","
            #     processed = stri.join(processed)

            sub_service = ''

            if serializer.data['service_sub'] is not None:
                sub_service = serializer.data['service_sub']

                if serializer.data['selected_sub_fields'] is not None:
                    for sub_service_field in serializer.data['selected_sub_fields']:
                        logger.info("sub service")

            service_name = ''

            price = 0

            if hostDetails.host_name is not None or hostDetails.host_name != '':
                service_name = hostDetails.host_name
            elif serializer.data['service_name'] is not None:
                if serializer.data['service_name'] != "":
                    service_name = serializer.data['service_name']
                else:
                    service_name = serializer.data['description']
            else:
                service_name = serializer.data['description']
            
            if serializer.data['price'] != "":
                price = serializer.data['price']

            _hosted_service = Hosted_service(
                service=service_,
                service_name=service_name,
                description=serializer.data['description'],
                location=serializer.data['location'],
                location_cordinates=serializer.data['location_coordinates'],
                process=processed,
                expected_duration=serializer.data['duration'],
                price=price,
                user=user_,
                active=1,
                part_payment_allowed=0,
                charge_currency = currency_
            )

            _hosted_service.save()

            logger.info("service hosted. About to upload pictures")

            # images_ = Service_images(
            #             hosted_service=_hosted_service,
            #             image=request.FILES['pictures[0]']
            #         )
           

            # images_.save()

            logger.info(request.FILES.getlist('pictures'))

            i=1
            for picture in request.FILES:
                logger.info("Each image ...")
                logger.info(picture)
                i=i+1

                images_ = Service_images(
                        hosted_service=_hosted_service,
                        image=request.FILES[picture]
                    )
                images_.save()

            hosted_service = Hosted_service.objects.filter(hosted_service_id=_hosted_service.hosted_service_id).select_related()

            logger.info("Hosted service added is ")
            logger.info(hosted_service.values())

            return Response(HostedServicesSerializer(hosted_service, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)