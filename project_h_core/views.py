from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import viewsets
from datetime import date, datetime, timedelta
from rest_framework.response import Response
from rest_framework import status
from drf_multiple_model.views import ObjectMultipleModelAPIView
import random, string
from django.contrib.auth.hashers import make_password
import logging
logger = logging.getLogger("django")

from .serializers import RegisterCustomerSerializer
from .serializers import IdSerializer
from .serializers import UserSerializer
from .serializers import ServiceSerializer

from project_h_core.models import Customers
from project_h_core.models import Services


# Create your views here.

class getUserWithPhoneNumberViewSet(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        logger.info("About to get game details ... ")
        logger.info(request.query_params.get('id'))

        if serializer.is_valid(raise_exception=True):
            queryset_data = User.objects.filter(customers__mobile_number=serializer.data['id']).select_related('customers');

            logger.info(queryset_data.query)
            logger.info(RegisterCustomerSerializer(queryset_data, many=True).data)

            return Response(UserSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)


class EssentialsViewSet(ObjectMultipleModelAPIView):
    querylist = [
        {'queryset': Services.objects.all(), 'serializer_class': ServiceSerializer}
    ]