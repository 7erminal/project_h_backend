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
        serializer = RegisterCustomerSerializer(data=request.data)

        if serializer.is_valid(raise_exception=True):
            logger.info("About to save user ")
            logger.info(request.data)
            logger.info(serializer.data['id_number'])
            logger.info(datetime.today)
            logger.info("image is ")

            save_user = User.objects.get(id=serializer.data['id'])

            save_user.first_name=serializer.data['first_name']
            save_user.last_name=serializer.data['last_name']
            save_user.email=serializer.data['email']
            save_user.is_staff=0
            save_user.is_superuser=0
            save_user.is_active=1


            save_user.save()

            save_customer = Customers.objects.get(user_id=serializer.data['id'])

            save_customer.location=serializer.data['location']
            # save_customer.gender=serializer.data['gender']
            save_customer.profession=serializer.data['profession']
            # save_member.picture=serializer.data['picture']
            if 'picture' in request.FILES:
                save_customer.picture=request.FILES['picture']

            # save_customer.mobile_number=serializer.data['mobile_number']
            save_customer.address=serializer.data['address']

            logger.info("ID Number is ")
            logger.info(serializer.data['id_number'])
            logger.info(serializer.data['id_type'])

            save_customer.id_type=serializer.data['id_type']
            save_customer.id_number=serializer.data['id_number']

            save_customer.save()

            # queryset_data = User.objects.filter(customers__user_id=serializer.data['id']).select_related('customers')
            queryset_data = User.objects.raw("""SELECT `auth_user`.`id`, `auth_user`.`password`, `auth_user`.`last_login`, `auth_user`.`is_superuser`, `auth_user`.`username`, 
                `auth_user`.`first_name`, `auth_user`.`last_name`, `auth_user`.`email`, `auth_user`.`is_staff`, `auth_user`.`is_active`, 
                `auth_user`.`date_joined`, `project_h_core_customers`.`customer_id`, `project_h_core_customers`.`user_id`, 
                `project_h_core_customers`.`customer_number`, `project_h_core_customers`.`dob`, `project_h_core_customers`.`active`, 
                `project_h_core_customers`.`is_verified`, `project_h_core_customers`.`ID_type_id`, `project_h_core_customers`.`ID_number`, 
                `project_h_core_customers`.`language_id`, `project_h_core_customers`.`profession`, `project_h_core_customers`.`mobile_number`, 
                `project_h_core_customers`.`gender`, `project_h_core_customers`.`picture`, `project_h_core_customers`.`other_names`, 
                `project_h_core_customers`.`address`, `project_h_core_customers`.`location`, `project_h_core_customers`.`nationality`, 
                `project_h_core_customers`.`dateTermsAndConditions`, `project_h_core_customers`.`datePrivacyPolicy`, `project_h_core_customers`.`is_host`, 
                `project_h_core_customers`.`created_by`, `project_h_core_customers`.`updated_by`, `project_h_core_customers`.`created_at`, 
                `project_h_core_customers`.`updated_at` FROM `auth_user` INNER JOIN `project_h_core_customers` 
                ON (`auth_user`.`id` = `project_h_core_customers`.`user_id`) WHERE `project_h_core_customers`.`user_id` = %s""",[serializer.data['id']])

            logger.info(queryset_data.query)

            return Response(UserSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)


