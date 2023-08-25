from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import viewsets
from datetime import date, datetime, timedelta
from rest_framework.response import Response
from rest_framework import status
from drf_multiple_model.views import ObjectMultipleModelAPIView
import random, string
from django.contrib.auth.hashers import make_password
from rest_framework.parsers import MultiPartParser, FormParser

from project_h_core.models import Hosted_service
from project_h_core.models import Service_images
from project_h_core.models import Services
from project_h_core.models import Service_reviews
from project_h_core.models import HostDetails
from project_h_core.models import Customers

from project_h_core.serializers import HostServiceSerializer
from project_h_core.serializers import HostedServicesSerializer
from project_h_core.serializers import AddReviewSerializer

from project_h_core.serializers import IdSerializer

import logging
logger = logging.getLogger("django")

class GetHostedServices(viewsets.ViewSet):
    def retrieve(self, request):
        hosted_service = Hosted_service.objects.all()

        # logger.info(hosted_service.values())

        return Response(HostedServicesSerializer(hosted_service, many=True).data,status.HTTP_202_ACCEPTED)

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

            if hostDetails.host_name is not None or hostDetails.host_name != '':
                service_name = hostDetails.host_name
            elif serializer.data['service_name'] is not None:
                if serializer.data['service_name'] != "":
                    service_name = serializer.data['service_name']
                else:
                    service_name = serializer.data['description']
            else:
                service_name = serializer.data['description']

            _hosted_service = Hosted_service(
                service=service_,
                service_name=service_name,
                description=serializer.data['description'],
                location=serializer.data['location'],
                process=processed,
                expected_duration=serializer.data['duration'],
                price=serializer.data['price'],
                user=user_,
                active=1,
                part_payment_allowed=0,
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

            hosted_service = Hosted_service.objects.filter(hosted_service_id=_hosted_service.hosted_service_id).prefetch_related('hosted_service_images')

            logger.info("Hosted service added is ")
            logger.info(hosted_service.values())

            return Response(HostedServicesSerializer(hosted_service, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)