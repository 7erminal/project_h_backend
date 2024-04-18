from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import viewsets
from datetime import date, datetime, timedelta
from rest_framework.response import Response
from rest_framework import status
from drf_multiple_model.views import ObjectMultipleModelAPIView
import random, string

from django.contrib.auth import authenticate
import logging
logger = logging.getLogger("django")

from project_h_core.models import One_time_pin
from project_h_core.models import Customers

from project_h_core.serializers import authenticationSerializer
from project_h_core.serializers import authenticationResponseSerializer

class Resp:
	def __init__(self, message, user, status):
		self.message=message
		self.user=user
		self.status=status

class authenticationViewSet(viewsets.ViewSet):
	def create(self, request):
		serializer = authenticationSerializer(data=request.data)

		if serializer.is_valid(raise_exception=True):
			logger.info("About to validate user credentials")
			user=User()

			message = "USER NOT AUTHENTICATED"
			status_=1002
			logger.info("Getting user details")
			try:
				user = User.objects.get(customers__mobile_number=serializer.data['username'])
			except Exception as e:
				logger.info("ERROR...")
				logger.error(e)
				try:
					logger.info("About to check in users table with email "+serializer.data['username'])
					user = User.objects.get(email=serializer.data['username'])
				except Exception as e:
					logger.error("Error.....")
					logger.error(e)
					try:
						logger.info("About to go check with username which should surely be there")
						user = User.objects.get(username=serializer.data['username'])
					except Exception as ex:
						logger.error("ERROR.......")
						logger.error(ex)
			logger.info("User is ")
			logger.info(user.password)
			# if user is None:
			# 	user = User.objects.get(email=serializer.data['username'])
			# if user is None:
			# 	user = User.objects.get(username=serializer.data['username'])
			logger.info("User details are ")
			logger.info(user)
			checkPasswordResp = user.check_password(serializer.data['password'])
			logger.info("Check password response is ")
			logger.info(checkPasswordResp)
			if checkPasswordResp is True:
				message = "USER AUTHENTICATED"
				status_=2000
			else:
				if not user:
					logger.info("User was not found")
					user=User()
				else:
					if user.password is None or user.password == "":
						logger.info("Password is blank ")
						message = "USER EXISTS BUT AUTHENTICATION FAILED"
						status_ = 2002
			# except Exception as e:
			# 	logger.info("ERROR:::")
			# 	logger.info(e)
			# 	user = None
			# resp = [("status", status), ("message", message)]
			resp = Resp(message=message, status=status_, user=user)
			logger.info("About to send response")

			return Response(authenticationResponseSerializer(resp).data,status.HTTP_202_ACCEPTED)
		else:
			return Response("Request Failed", status=status.HTTP_201_CREATED)