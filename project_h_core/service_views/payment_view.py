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
from project_h_core.models import Cards
from project_h_core.models import Momo

from project_h_core.serializers import PaymentMethodsSerializer
from project_h_core.serializers import UserPaymentMethodSerializer
from project_h_core.serializers import userPaymentMethodsSerializer

from project_h_core.serializers import IdSerializer

from django.db import connection

import logging
logger = logging.getLogger("django")

# Get Hosted Service Reviews
class GetPaymentMethods(viewsets.ViewSet):
	def retrieve(self, request):
		serializer = IdSerializer(data=request.query_params)

		if serializer.is_valid(raise_exception=True):
			queryset_data = Payment_methods.objects.all()
			
			return Response(PaymentMethodsSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
		else:
			return Response("Request Failed", status=status.HTTP_201_CREATED)

# Get Hosted Service Reviews
class GetUserPaymentMethods(viewsets.ViewSet):
	def retrieve(self, request):
		serializer = IdSerializer(data=request.query_params)

		if serializer.is_valid(raise_exception=True):
			try:
				user_ = User.objects.get(id=serializer.data['id'])
				logger.info("user is ")
				logger.info(user_)
				queryset_data = User_payment_methods.objects.filter(user_id=serializer.data['id'])

				# queryset_data = User_payment_methods.objects.raw("""SELECT `project_h_core_user_payment_methods`.`id`, `project_h_core_user_payment_methods`.`user_id_id` AS `user_id`, `project_h_core_user_payment_methods`.`payment_method_id` AS `payment_method`, `project_h_core_user_payment_methods`.`expired`, `project_h_core_momo`.`number` AS `payment_method_number`, `project_h_core_user_payment_methods`.`active` 
                #  FROM `project_h_core_user_payment_methods` INNER JOIN `project_h_core_momo` 
                # ON (`project_h_core_user_payment_methods`.`payment_method_table_key` = `project_h_core_momo`.`momo_id`) WHERE `project_h_core_user_payment_methods`.`user_id_id` = %s""",[user_.id])

				# logger.info(queryset_data.query)
				# logger.info("Results is ")
				# logger.debug(userPaymentMethodsSerializer(queryset_data, many=True).data)

				# cursor = connection.cursor()
				# cursor.execute("""SELECT `project_h_core_user_payment_methods`.`id`, `project_h_core_user_payment_methods`.`user_id_id` AS `user_id`, `project_h_core_user_payment_methods`.`payment_method_id` AS `payment_method`, `project_h_core_user_payment_methods`.`expired`, `project_h_core_momo`.`number` AS `payment_method_number`, `project_h_core_user_payment_methods`.`active` 
                #  FROM `project_h_core_user_payment_methods` INNER JOIN `project_h_core_momo` 
                # ON (`project_h_core_user_payment_methods`.`payment_method_table_key` = `project_h_core_momo`.`momo_id`) WHERE `project_h_core_user_payment_methods`.`user_id_id` = %s""",[user_.id])
				# result = cursor.fetchall()
				# # logger.debug(queryset_data.values())

				# return Response(result,status.HTTP_202_ACCEPTED)
				return Response(UserPaymentMethodSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
			except NameError:
				logger.info(NameError)
				return Response(0, status=status.HTTP_202_ACCEPTED)
		else:
			return Response("Request Failed", status=status.HTTP_201_CREATED)

# Add user payment method
class AddUserPaymentMethod(viewsets.ViewSet):
	def create(self, request):
		serializer = userPaymentMethodsSerializer(data=request.data)

		if serializer.is_valid(raise_exception=True):
			user = User.objects.get(id=serializer.data['user_id'])

			passed_validation = False

			payment_method = Payment_methods.objects.get(payment_method_id=serializer.data['payment_method'])

			table_key = 0
			if serializer.data['payment_method'] == "1":
				cards = Cards(
						user_id=user,
						card_number=serializer.data['payment_method_number'],
						expiry_date=serializer.data['expired'],
						active=1,
						created_by=serializer.data['user_id']
					)

				cards.save()

				table_key = cards.card_id

				passed_validation = True

			if serializer.data['payment_method'] == '2':
				if not Momo.objects.filter(number=serializer.data['payment_method_number'], created_by=serializer.data['user_id']):
					momo = Momo(
							user_id=user,
							number=serializer.data['payment_method_number'],
							verified=0,
							active=1,
							created_by=serializer.data['user_id']
						)

					momo.save()

					table_key = momo.momo_id

					passed_validation = True
				else:
					passed_validation = False

			if (passed_validation == True):
				user_payment_methods = User_payment_methods(
					user_id=user,
					payment_method=payment_method,
					expired=serializer.data['expired'],
					active=1,
					payment_method_table_key=table_key,
					number=serializer.data['payment_method_number']
				)

				user_payment_methods.save()

				logger.info("Method saved is ")
				logger.info(user_payment_methods.id)

				queryset_data = User_payment_methods.objects.filter(id=user_payment_methods.id)
			else:
				queryset_data = User_payment_methods.objects.filter(user_id=serializer.data['user_id'], payment_method=payment_method)

			return Response(UserPaymentMethodSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
		else:
			return Response("Request Failed", status=status.HTTP_201_CREATED)







