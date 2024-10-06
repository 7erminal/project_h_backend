from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import viewsets
from datetime import date, datetime, timedelta
from rest_framework.response import Response
from rest_framework import status
from drf_multiple_model.views import ObjectMultipleModelAPIView
import random, string
from django.contrib.auth.hashers import make_password

from django.contrib.auth import authenticate
import logging
logger = logging.getLogger("django")

from project_h_core.serializers import authenticationSerializer
from project_h_core.serializers import authenticationResponseSerializer
from project_h_core.serializers import ForgotPasswordSerializer

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
			message = "USER NOT AUTHENTICATED"
			status_=1002
			logger.info("Getting user details")

			userfound = True

			user = User()
			
			# logger.error(e)
			try:
				logger.info("checking user with mobile number")
				user = User.objects.get(customers__mobile_number=serializer.data['username'])
			except Exception as e:
				logger.info("ERROR...")
				logger.info("User not found going to check in email...")
				logger.error(e)
				try:
					message = "USER NOT FOUND"
					logger.info("About to check in users table with email "+serializer.data['username'])
					user = User.objects.get(email=serializer.data['username'])
				except Exception as e:
					logger.error("Error.....")
					logger.error(e)
					try:
						logger.info("About to go check with username which should surely be there")
						user = User.objects.get(username=serializer.data['username'])
					except Exception as ex:
						logger.error("ERROR.......User not found anythere")
						logger.error(ex)
						userfound = False
			
			# logger.info("User is ")
			# logger.info(user.password)
			# if user is None:
			# 	user = User.objects.get(email=serializer.data['username'])
			# if user is None:
			# 	user = User.objects.get(username=serializer.data['username'])
			# logger.info("User details are ")
			# logger.info(user)
			if userfound == False:
				logger.info("User was not found")
				status_ = 1002
				message = "USER NOT FOUND"
				user=User()
			else:
				checkPasswordResp = user.check_password(serializer.data['password'])
				logger.info("Check password response is ")
				logger.info(checkPasswordResp)
				if checkPasswordResp is True:
					if serializer.data['password'] == "123456":
						logger.info("Password is default passwords ")
						message = "USER EXISTS BUT AUTHENTICATION FAILED"
						status_ = 2002
					else:
						message = "USER AUTHENTICATED"
						status_=2000
				else:
					if user.password is None or user.password == "":
						logger.info("Password is blank ")
						message = "USER EXISTS BUT AUTHENTICATION FAILED"
						status_ = 2002
					else:
						message = "AUTHENTICATION FAILED. WRONG CREDENTIALS PROVIDED."
						status_ = 2003
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
		
class forgotPasswordViewSet(viewsets.ViewSet):
	def create(self, request):
		serializer = ForgotPasswordSerializer(data=request.data)

		if serializer.is_valid(raise_exception=True):
			user = User()
			userfound = True
			status_ = 2001
			message = "USER NOT FOUND"

			try:
				logger.info("checking user with mobile number")
				user = User.objects.get(customers__mobile_number=serializer.data['email'])
			except Exception as e:
				logger.info("ERROR...")
				logger.info("User not found going to check in email...")
				logger.error(e.__cause__)
				message = "USER NOT FOUND"
				try:
					logger.info("About to check in users table with email "+serializer.data['email'])
					user = User.objects.get(email=serializer.data['email'])
				except Exception as e:
					logger.error("Error getting user with email so checking with username.....")
					logger.error(e.__cause__)
					message = "USER NOT FOUND"
					try:
						logger.info("About to go check with username which should surely be there")
						user = User.objects.get(username=serializer.data['email'])
					except Exception as ex:
						message = "USER NOT FOUND"
						logger.error("ERROR.......User not found anywhere")
						logger.error(ex.__cause__)
						userfound = False
			
			if userfound == True:
				logger.info("USER FOUND!!!! Performing reset")
				password = "123456"
				user.password = make_password(password)
				user.save()
				status_ = 2000
				message = "Password reset done successfully"
			
			resp = Resp(message=message, status=status_, user=user)
			return Response(authenticationResponseSerializer(resp).data,status.HTTP_202_ACCEPTED)
		else:
			return Response("Request Failed", status=status.HTTP_400_BAD_REQUEST)