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

from project_h_core.serializers import OTPCheckSerializer

from project_h_core.models import One_time_pin
from project_h_core.models import Customers

from project_h_core.serializers import OTPSerializer

# Generate OTP

class GenerateOTPViewSet(viewsets.ViewSet):
	def create(self, request):
		serializer = OTPSerializer(data=request.data)

		if serializer.is_valid(raise_exception=True):
			logger.info("Generating OTP ... ")

			# otp_generated = random.randint(1111,9999)
			otp_generated = 1111;

			logger.info(otp_generated)

			save_one_time_pin = One_time_pin(
					mobile_number=serializer.data['number'],
					code=otp_generated,
					otp_type=serializer.data['otp_type'],
					active=1,
					status=0,
					processed=0,
					created_by=0
				)

			save_one_time_pin.save()

			return Response("OTP Successfully Generated",status.HTTP_202_ACCEPTED)
		else:
			return Response("Request Failed", status=status.HTTP_201_CREATED)

class validateOTPViewSet(viewsets.ViewSet):
	def create(self, request):
		serializer = OTPSerializer(data=request.data)

		if serializer.is_valid(raise_exception=True):
			logger.info("About to validate OTP")

			logger.info(serializer.data['otp'])

			try:
				check_OTP = One_time_pin.objects.filter(mobile_number=serializer.data['number'], otp_type=serializer.data['otp_type'], code=serializer.data['otp'], active=1, processed=0).first()
			except One_time_pin.DoesNotExist:
				check_OTP = None

			message = "OTP NOT VALIDATED"

			if check_OTP:
				logger.info("OTP validation passed")
				check_OTP.processed = 1
				check_OTP.status = 1

				check_OTP.save()

				message = "OTP VALIDATED SUCCESSFULLY"
			else:
				message = "OTP VALIDATION FAILED"


			return Response(OTPCheckSerializer(check_OTP).data,status.HTTP_202_ACCEPTED)
		else:
			return Response("Request Failed", status=status.HTTP_201_CREATED)

