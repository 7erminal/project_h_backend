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

from .serializers import ProfileMenuSerializer
from .serializers import IdSerializer
from .serializers import UserSerializer
from .serializers import LanguageSerializer
from .serializers import ApplicationPropertySerializer
from .serializers import ServicesAndSubCategoriesSerializer
from .serializers import CurrenciesSerializer

from project_h_core.models import Services
from project_h_core.models import ProfileMenu
from project_h_core.models import Language
from project_h_core.models import ApplicationProperties
from project_h_core.models import Currencies


# Create your views here.

class getUserWithPhoneNumberViewSet(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        logger.info("About to get user details with phone number ... ")
        logger.info(request.query_params.get('id'))

        if serializer.is_valid(raise_exception=True):
            logger.info(serializer.data['id'])
            queryset_data = User.objects.filter(customers__mobile_number=serializer.data['id']).all()
            # queryset_data = User.objects.raw("""SELECT `auth_user`.`id`, `auth_user`.`password`, `auth_user`.`last_login`, `auth_user`.`is_superuser`, `auth_user`.`username`, 
            #     `auth_user`.`first_name`, `auth_user`.`last_name`, `auth_user`.`email`, `auth_user`.`is_staff`, `auth_user`.`is_active`, 
            #     `auth_user`.`date_joined`, `project_h_core_customers`.`customer_id`, `project_h_core_customers`.`user_id`, 
            #     `project_h_core_customers`.`customer_number`, `project_h_core_customers`.`dob`, `project_h_core_customers`.`active`, 
            #     `project_h_core_customers`.`is_verified`, `project_h_core_customers`.`ID_type_id`, `project_h_core_customers`.`id_image`, `project_h_core_customers`.`ID_number`, 
            #     `project_h_core_customers`.`language_id`, `project_h_core_customers`.`delivery_location`, `project_h_core_customers`.`profession`, `project_h_core_customers`.`mobile_number`, 
            #     `project_h_core_customers`.`gender`, `project_h_core_customers`.`picture`, `project_h_core_customers`.`other_names`, 
            #     `project_h_core_customers`.`address`, `project_h_core_customers`.`location`, `project_h_core_customers`.`nationality`, 
            #     `project_h_core_customers`.`dateTermsAndConditions`, `project_h_core_customers`.`datePrivacyPolicy`, `project_h_core_customers`.`is_host`, 
            #     `project_h_core_customers`.`created_by`, `project_h_core_customers`.`updated_by`, `project_h_core_customers`.`created_at`, 
            #     `project_h_core_customers`.`updated_at` FROM `auth_user` INNER JOIN `project_h_core_customers` 
            #     ON (`auth_user`.`id` = `project_h_core_customers`.`user_id`)
            #     LEFT JOIN `project_h_core_hostdetails`
            #     ON (`project_h_core_customers`.`customer_id` = `project_h_core_hostdetails`.`customer_id`) WHERE `project_h_core_customers`.`mobile_number` = %s""",[request.query_params.get('id')])

            logger.info(queryset_data)
            logger.info(UserSerializer(queryset_data, many=True).data)

            return Response(UserSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)

class getUserWithIDViewSet(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        logger.info("About to get user details ... ")
        logger.info(request.query_params.get('id'))

        if serializer.is_valid(raise_exception=True):
            logger.info(serializer.data['id'])
            queryset_data = User.objects.get(id=serializer.data['id'])
            # queryset_data = User.objects.raw("""SELECT `auth_user`.`id`, `auth_user`.`password`, `auth_user`.`last_login`, `auth_user`.`is_superuser`, `auth_user`.`username`, 
            #     `auth_user`.`first_name`, `auth_user`.`last_name`, `auth_user`.`email`, `auth_user`.`is_staff`, `auth_user`.`is_active`, 
            #     `auth_user`.`date_joined`, `project_h_core_customers`.`customer_id`, `project_h_core_customers`.`user_id`, 
            #     `project_h_core_customers`.`customer_number`, `project_h_core_customers`.`dob`, `project_h_core_customers`.`active`, 
            #     `project_h_core_customers`.`is_verified`, `project_h_core_customers`.`ID_type_id`, `project_h_core_customers`.`id_image`, `project_h_core_customers`.`ID_number`, 
            #     `project_h_core_customers`.`language_id`, `project_h_core_customers`.`delivery_location`, `project_h_core_customers`.`profession`, `project_h_core_customers`.`mobile_number`, 
            #     `project_h_core_customers`.`gender`, `project_h_core_customers`.`picture`, `project_h_core_customers`.`other_names`, 
            #     `project_h_core_customers`.`address`, `project_h_core_customers`.`location`, `project_h_core_customers`.`nationality`, 
            #     `project_h_core_customers`.`dateTermsAndConditions`, `project_h_core_customers`.`datePrivacyPolicy`, `project_h_core_customers`.`is_host`, 
            #     `project_h_core_customers`.`created_by`, `project_h_core_customers`.`updated_by`, `project_h_core_customers`.`created_at`, 
            #     `project_h_core_customers`.`updated_at` FROM `auth_user` INNER JOIN `project_h_core_customers` 
            #     ON (`auth_user`.`id` = `project_h_core_customers`.`user_id`)
            #     LEFT JOIN `project_h_core_hostdetails`
            #     ON (`project_h_core_customers`.`customer_id` = `project_h_core_hostdetails`.`customer_id`) WHERE `project_h_core_customers`.`mobile_number` = %s""",[request.query_params.get('id')])

            logger.info(queryset_data)
            logger.info(UserSerializer(queryset_data).data)

            return Response(UserSerializer(queryset_data).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)

class EssentialsViewSet(ObjectMultipleModelAPIView):
    querylist = [
        {'queryset': Services.objects.all(), 'serializer_class': ServicesAndSubCategoriesSerializer},
        {'queryset': Currencies.objects.all(), 'serializer_class': CurrenciesSerializer},
        {'queryset': ProfileMenu.objects.all(), 'serializer_class': ProfileMenuSerializer},
        {'queryset': Language.objects.all(), 'serializer_class': LanguageSerializer},
        {'queryset': ApplicationProperties.objects.all(), 'serializer_class': ApplicationPropertySerializer}
    ]