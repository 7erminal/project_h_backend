from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import viewsets
from datetime import date, datetime, timedelta
from rest_framework.response import Response
from rest_framework import status
from drf_multiple_model.views import ObjectMultipleModelAPIView
from django.contrib.auth.hashers import make_password
from project_h_core.models import ApplicationProperties, Customers
from django.core.mail import send_mail
import random

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

			languageid = serializer.data['language']

			logger.info("Language ID is ")
			logger.info(languageid)

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
					appProperties = ApplicationProperties.objects.filter(value="USER_NOT_FOUND").first()
					logger.info("About to check in users table with email "+serializer.data['username'])
					user = User.objects.get(email__iexact=serializer.data['username'])
				except Exception as e:
					logger.error("Error.....")
					logger.error(e)
					try:
						logger.info("About to go check with username which should surely be there")
						user = User.objects.get(username__iexact=serializer.data['username'])
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
				appProperties = ApplicationProperties.objects.filter(value="USER_NOT_FOUND").first()
				user=User()
			else:
				checkPasswordResp = user.check_password(serializer.data['password'])
				logger.info("Check password response is ")
				logger.info(checkPasswordResp)
				logger.info(user.id)
				
				if checkPasswordResp is True:
					customer = Customers.objects.get(user=user)
					if customer.password_status == 3:
						logger.info("Password is default passwords ")
						appProperties = ApplicationProperties.objects.filter(value="USER_EXISTS_AUTH_FAILED").first()
						status_ = 2002
					else:
						appProperties = ApplicationProperties.objects.filter(value="USER_AUTHENTICATED").first()
						status_=2000
				else:
					if user.password is None or user.password == "":
						logger.info("Password is blank ")
						appProperties = ApplicationProperties.objects.filter(value="PASSWORD_NOT_SET").first()
						status_ = 2002
					else:
						logger.info("User is ")
						logger.info(user)
						appProperties = ApplicationProperties.objects.filter(value="INVALID_CREDENTIALS").first()
						status_ = 2003
				# except Exception as e:
				# 	logger.info("ERROR:::")
				# 	logger.info(e)
				# 	user = None
				# resp = [("status", status), ("message", message)]
			if languageid == '1':	
				message = appProperties.application_property_name_ENGLISH
			if languageid == '2':	
				logger.info("Language is French")
				message = appProperties.application_property_name_FRENCH
				logger.info("Message is ")
				logger.info(message)
			if languageid == '3':	
				message = appProperties.application_property_name_SPANISH
			if languageid == '4':	
				message = appProperties.application_property_name_PORTUGUESE

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
				logger.info("user found is ")
				logger.info(user)
			except Exception as e:
				logger.info("ERROR...")
				logger.info("User not found going to check in email...")
				logger.error(e.__cause__)
				message = "USER NOT FOUND"
				try:
					logger.info("About to check in users table with email "+serializer.data['email'])
					# user = User.objects.get(email=serializer.data['email'])
					user = User.objects.get(email__iexact=serializer.data['email'])
					logger.info(user)
				except Exception as e:
					logger.error("Error getting user with email so checking with username.....")
					logger.error(e.__cause__)
					message = "USER NOT FOUND"
					try:
						logger.info("About to go check with username which should surely be there")
						user = User.objects.get(username__iexact=serializer.data['email'])
					except Exception as ex:
						message = "USER NOT FOUND"
						logger.error("ERROR.......User not found anywhere")
						logger.error(ex.__cause__)
						userfound = False
			
			if userfound == True:
				logger.info("USER FOUND!!!! Performing reset")
				logger.info(user)
				password = random.randint(1000,9999)
				logger.info("User::: "+user.email+" pin reset to "+str(password))
				user.password = make_password(str(password))

				customer = Customers.objects.get(user=user)
				customer.password_status = 3
				customer.save()
				user.save()
				

				receiverEmail = user.email

				send_mail(
					"Your secret password for Ayekooo",
					"Your pin has been reset successfully.\nPin is "+str(password)+".\n Do not share this with anyone.",
					"bede.abbe@gmail.com",
					[receiverEmail],
					fail_silently=False,
				)
				status_ = 2000
				message = "Password reset done successfully"
			
			resp = Resp(message=message, status=status_, user=user)
			return Response(authenticationResponseSerializer(resp).data,status.HTTP_202_ACCEPTED)
		else:
			return Response("Request Failed", status=status.HTTP_400_BAD_REQUEST)