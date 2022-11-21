from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import viewsets
from datetime import date, datetime, timedelta
from rest_framework.response import Response
from rest_framework import status
from drf_multiple_model.views import ObjectMultipleModelAPIView
import random, string
from django.contrib.auth.hashers import make_password

from project_h_core.models import Hosted_service
from project_h_core.models import Service_images
from project_h_core.models import Services

from project_h_core.serializers import HostServiceSerializer
from project_h_core.serializers import HostedServicesSerializer

import logging
logger = logging.getLogger("django")

class GetHostedServices(viewsets.ViewSet):
    def retrieve(self, request):
        hosted_service = Hosted_service.objects.prefetch_related('hosted_service_images')

        logger.info(hosted_service.values())

        return Response(HostedServicesSerializer(hosted_service, many=True).data,status.HTTP_202_ACCEPTED)

# Register Customer
class HostServiceViewSet(viewsets.ViewSet):
    def create(self, request):
        serializer = HostServiceSerializer(data=request.data)

        if serializer.is_valid(raise_exception=True):
            logger.info("About to save service ")
            logger.info(request.data)
            logger.info(serializer.data['parent_service'])

            user_ = User.objects.get(id=serializer.data['id'])
            service_ = Services.objects.get(service_id=serializer.data['parent_service'])

            _hosted_service = Hosted_service(
                service=service_,
                service_name=serializer.data['service_name'],
                description=serializer.data['description'],
                location=serializer.data['location'],
                process=serializer.data['process'],
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