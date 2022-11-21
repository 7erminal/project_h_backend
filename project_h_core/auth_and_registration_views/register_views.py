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

from project_h_core.models import Customers

from project_h_core.serializers import RegisterCustomerSerializer
from project_h_core.serializers import UserSerializer
from project_h_core.serializers import IdSerializer

# Register Customer
class RegisterCustomerViewSet(viewsets.ViewSet):
    def create(self, request):
        serializer = RegisterCustomerSerializer(data=request.data)

        if serializer.is_valid(raise_exception=True):
            logger.info("About to save user ")
            logger.info(request.data)
            logger.info(serializer.data['dob'])
            logger.info(datetime.today)
            logger.info("image is ")

            save_user = User(
                first_name=serializer.data['first_name'],
                last_name=serializer.data['last_name'],
                username=serializer.data['first_name'].lower()+'.'+serializer.data['last_name'].lower(),
                email=serializer.data['email'],
                is_staff=0,
                is_superuser=0,
                is_active=1,
                date_joined=datetime.today().strftime('%Y-%m-%d'),
                last_login=datetime.today().strftime('%Y-%m-%d')
            )

            save_user.save()

            customer_number = datetime.today().strftime('%Y%m%d')+str(save_user.id)

            logger.info("About to save customer details ")
            logger.info(customer_number)

            if 'picture' in request.FILES:
                save_customer = Customers(
                    user=save_user,
                    customer_number=customer_number,
                    dob=serializer.data['dob'],
                    gender=serializer.data['gender'],
                    # picture=serializer.data['picture'],
                    picture=request.FILES['picture'],
                    mobile_number=serializer.data['mobile_number'],
                    # address=serializer.data['address'],
                )
            else:
                save_customer = Customers(
                    user=save_user,
                    customer_number=customer_number,
                    dob=serializer.data['dob'],
                    gender=serializer.data['gender'],
                    # picture=serializer.data['picture'],
                    # picture=request.FILES['picture'],
                    mobile_number=serializer.data['mobile_number'],
                    # address=serializer.data['address'],
                )

            save_customer.save()

            queryset_data = User.objects.filter(id=save_user.id).select_related('customers');

            return Response(UserSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)

# Update Customer
class UpdateCustomerViewSet(viewsets.ViewSet):
    def create(self, request):
        serializer = RegisterMemberSerializer(data=request.data)

        if serializer.is_valid(raise_exception=True):
            logger.info("About to save user ")
            logger.info(request.data)
            logger.info(serializer.data['dob'])
            logger.info(datetime.today)
            logger.info("image is ")

            save_user = User.objects.get(id=serializer.data['id'])

            save_user.first_name=serializer.data['first_name']
            save_user.last_name=serializer.data['surname']
            save_user.email=serializer.data['email']
            save_user.is_staff=0
            save_user.is_superuser=0
            save_user.is_active=1


            save_user.save()

            customer_number = datetime.today().strftime('%Y%m%d')+str(save_user.id)

            logger.info("About to save customer details ")
            logger.info(customer_number)

            save_customer = Customers.objects.get(user_id=serializer.data['id'])

            save_customer.dob=serializer.data['dob']
            save_customer.gender=serializer.data['gender']
            # save_member.picture=serializer.data['picture']
            if 'picture' in request.FILES:
                save_customer.picture=request.FILES['picture']

            save_customer.mobile_number=serializer.data['mobile_number']
            save_customer.address=serializer.data['address']

            save_customer.save()

            return Response(RegisterCustomerSerializer(save_user).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)


