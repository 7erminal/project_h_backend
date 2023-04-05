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
from project_h_core.models import Cards
from project_h_core.models import Services
from project_h_core.models import Requests
from project_h_core.models import Payment_methods
from project_h_core.models import Momo
from project_h_core.models import User_payment_methods

from project_h_core.serializers import RequestSerializer
from project_h_core.serializers import RequestsSerializer
from project_h_core.serializers import UserPaymentMethodSerializer

from project_h_core.serializers import IdSerializer

import logging
logger = logging.getLogger("django")

# Get all requests
class GetAllRequests(viewsets.ViewSet):
    def retrieve(self, request):
        requests = Reqiests.objects.all()

        logger.info(requests.values())

        return Response(RequestsSerializer(requests, many=True).data,status.HTTP_202_ACCEPTED)

# Get Requests by User ID
class GetRequestsByUserId(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        if serializer.is_valid(raise_exception=True):
            queryset_data = Requests.objects.filter(requester=serializer.data['id'])
 
            logger.info('data returned for service reviews is ')
            logger.info(RequestsSerializer(queryset_data, many=True).data)

            return Response(RequestsSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)


# Request a service
class RequestServiceViewSet(viewsets.ViewSet):
    def create(self, request):
        serializer = RequestSerializer(data=request.data)

        logger.info("Request data is ")
        logger.info(request.data)

        if serializer.is_valid(raise_exception=True):
            hosted_service = Hosted_service.objects.get(hosted_service_id=serializer.data['host_service_id'])
            requester = User.objects.get(id=serializer.data['requester_id'])
            host = User.objects.get(id=serializer.data['host'])
            payment_option = User_payment_methods.objects.get(id=serializer.data['payment_option'])
            logger.info("Payment options are ")
            logger.info(UserPaymentMethodSerializer(payment_option).data)
            logger.info(payment_option.payment_method)

            request = Requests(
                    host_service=hosted_service,
                    requester = requester,
                    choice=serializer.data['choices'],
                    preferences=serializer.data['preferences'],
                    host=host,
                    charge=serializer.data['charge'],
                    payment_method=payment_option.payment_method,
                    active=1,
                    created_by=serializer.data['requester_id'],
                    payment_option=payment_option
                )

            request.save()

            logger.info("Result after processing request")
            logger.info(RequestsSerializer(request).data)


            return Response(RequestsSerializer(request).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)

