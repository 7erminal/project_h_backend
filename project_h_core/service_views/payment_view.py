from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import viewsets
from datetime import date, datetime, timedelta
from rest_framework.response import Response
from rest_framework import status
from drf_multiple_model.views import ObjectMultipleModelAPIView
import random, string
from django.contrib.auth.hashers import make_password

from project_h_core.models import User_payment_methods
from project_h_core.models import Payment_methods

from project_h_core.serializers import PaymentMethodsSerializer
from project_h_core.serializers import userPaymentMethodsSerializer

from project_h_core.serializers import IdSerializer

import logging
logger = logging.getLogger("django")

# Get Hosted Service Reviews
class GetPaymentMethods(viewsets.ViewSet):
	def retrieve(self, request):
		serializer = IdSerializer(data=request.query_params)

		if serializer.is_valid(raise_exception=True):
			queryset_data = Payment_methods.objects.get(payment_method_id=serializer.data['id'])
			return Response(PaymentMethodsSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
		else:
			return Response("Request Failed", status=status.HTTP_201_CREATED)

# Get Hosted Service Reviews
class GetUserPaymentMethods(viewsets.ViewSet):
	def retrieve(self, request):
		serializer = IdSerializer(data=request.query_params)

		if serializer.is_valid(raise_exception=True):
			queryset_data = User_payment_methods.objects.get(hosted_service_id=serializer.data['id'])

			return Response(userPaymentMethodsSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
		else:
			return Response("Request Failed", status=status.HTTP_201_CREATED)

# Add user payment method
class AddUserPaymentMethod(viewsets.ViewSet):
	def create(self, request):
		serializer = userPaymentMethodsSerializer(data=request.data)

		if serializer.is_valid(raise_exception=True):
			user = User.objects.get(id=serializer.data['user_id'])
			user_payment_methods = User_payment_methods(
				user_id=user,
				payment_method=serializer.data['payment_method'],
				expired=serializer.data['expired'],
				active=1
			)

			user_payment_methods.save()

			return Response(userPaymentMethodsSerializer(user_payment_methods).data,status.HTTP_202_ACCEPTED)
		else:
			return Response("Request Failed", status=status.HTTP_201_CREATED)