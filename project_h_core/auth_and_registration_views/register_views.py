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
from project_h_core.models import HostDetails
from project_h_core.models import IDTypes

from project_h_core.serializers import RegisterCustomerSerializer
from project_h_core.serializers import UserSerializer
from project_h_core.serializers import IdSerializer
from project_h_core.serializers import ProfilePictureSerializer
from project_h_core.serializers import HostSerializer
from project_h_core.serializers import HostDetailsSerializer
from project_h_core.serializers import SetLanguageSerializer
from project_h_core.serializers import authenticationSerializer

class Resp:
	def __init__(self, message, user, status):
		self.message=message
		self.user=user
		self.status=status

# Register Customer
class RegisterCustomerViewSet(viewsets.ViewSet):
    def create(self, request):
        serializer = RegisterCustomerSerializer(data=request.data)

        if serializer.is_valid(raise_exception=True):
            logger.info("About to save user ")
            logger.info(request.data)
            # logger.info(serializer.data['dob'])
            logger.info(datetime.today)
            logger.info("image is ")

            password = serializer.data['password']

            save_user = User(
                first_name=serializer.data['first_name'],
                last_name=serializer.data['last_name'],
                username=serializer.data['first_name'].lower()+'.'+serializer.data['last_name'].lower(),
                email=serializer.data['email'],
                is_staff=0,
                is_superuser=0,
                is_active=1,
                date_joined=datetime.today().strftime('%Y-%m-%d'),
                last_login=datetime.today().strftime('%Y-%m-%d'),
                password=make_password(password)
            )

            save_user.save()

            # save_user.set_password(password)

            customer_number = datetime.today().strftime('%Y%m%d')+str(save_user.id)

            logger.info("About to save customer details ")
            logger.info(customer_number)

            if 'picture' in request.FILES:
                logger.info("Picture there ")
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
                logger.info("Picture not there ")
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

            logger.info("Customer saved ")

            queryset_data = User.objects.filter(id=save_user.id).select_related('customers')

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

            id_type_ = IDTypes.objects.get(IDType_id=serializer.data['id_type'])
            save_customer.ID_type=id_type_
            save_customer.ID_number=serializer.data['id_number']

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


class UpdateProfileImage(viewsets.ViewSet):
    def create(self, request):
        serializer = ProfilePictureSerializer(data=request.data)

        if serializer.is_valid(raise_exception=True):
            save_user = User.objects.get(id=serializer.data['id']) 

            save_customer = Customers.objects.get(user=save_user)

            save_customer.picture = request.FILES['picture']

            save_customer.save()

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

            return Response(UserSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)

        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)

# Update Customer Password
class UpdateCustomerPasswordViewSet(viewsets.ViewSet):
    def create(self, request):
        serializer = authenticationSerializer(data=request.data)

        if serializer.is_valid(raise_exception=True):
            logger.info("About to save user ")
            logger.info(request.data)
            logger.info(datetime.today)
            try:
                save_user = User.objects.get(customers__mobile_number=serializer.data['username'])
            except:
                logger.info("ERROR...")
                try:
                    logger.info("About to check in users table with email "+serializer.data['username'])
                    save_user = User.objects.get(email=serializer.data['username'])
                except Exception as e:
                    logger.error("Error....."+e)
                    try:
                        save_user = User.objects.get(username=serializer.data['username'])
                    except:
                        logger.error("ERROR.......")

            save_user.password=make_password(serializer.data['password'])

            save_user.save()

            queryset_data = User.objects.get(id=save_user.id)

            return Response(UserSerializer(queryset_data).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)


class GetHostDetails(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        logger.info("request received is ")
        logger.info(request.query_params)

        if serializer.is_valid(raise_exception=True):
            save_user = User.objects.get(id=serializer.data['id']) 

            save_customer = Customers.objects.get(user=save_user)
            queryset_data = HostDetails.objects.filter(customer=save_customer)
            return Response(HostDetailsSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)


# Update Customer
class UpdateHostDetails(viewsets.ViewSet):
    def create(self, request):
        serializer = HostSerializer(data=request.data)
        
        if serializer.is_valid(raise_exception=True):
            logger.info("request received is ")
            logger.info(request.data)
            
            save_user = User.objects.get(id=serializer.data['id']) 

            save_customer = Customers.objects.get(user=save_user)

    
            host_name = ''

            if serializer.data['host_name'] != '' or serializer.data['host_name'] is not None:
                host_name = serializer.data['host_name']

            location_cordinates = ''

            if serializer.data['location_cordinates'] != '' or serializer.data['location_cordinates'] is not None:
                location_cordinates = serializer.data['location_cordinates']

            office_address = ''

            if serializer.data['office_address'] != '' or serializer.data['office_address'] is not None:
                office_address = serializer.data['office_address']

            service_coverage_zone = ''

            if serializer.data['service_coverage_zone'] != '' or serializer.data['service_coverage_zone'] is not None:
                service_coverage_zone = serializer.data['service_coverage_zone']

            official_certifications = ''

            if serializer.data['official_certifications'] != '' or serializer.data['official_certifications'] is not None:
                official_certifications = serializer.data['official_certifications']

            number_of_years_practice_speciality = ''

            if serializer.data['number_of_years_practice_speciality'] != '' or serializer.data['number_of_years_practice_speciality'] is not None:
                number_of_years_practice_speciality = serializer.data['number_of_years_practice_speciality']

            number_of_years_experience = ''

            if serializer.data['number_of_years_experience'] != '' or serializer.data['number_of_years_experience'] is not None:
                number_of_years_experience = serializer.data['number_of_years_experience']

            specializations = ''

            if serializer.data['specializations'] != '' or serializer.data['specializations'] is not None:
                specializations = serializer.data['specializations']


            languages_spoken = ''

            if serializer.data['languages_spoken'] != '' or serializer.data['languages_spoken'] is not None:
                languages_spoken = serializer.data['languages_spoken']

            referrals = ''

            if serializer.data['referrals'] != '' or serializer.data['referrals'] is not None:
                referrals = serializer.data['referrals']

            queryset_data = HostDetails.objects.filter(customer=save_customer)

            if not queryset_data:
                if 'audio_video' in request.FILES:
                    save_host_details = HostDetails(
                            customer=save_customer,
                            host_name=host_name,
                            location_cordinates=location_cordinates,
                            office_address=office_address,
                            service_coverage_zone=service_coverage_zone,
                            official_certifications=official_certifications,
                            number_of_years_practice_speciality=number_of_years_practice_speciality,
                            number_of_years_experience=number_of_years_experience,
                            specializations=specializations,
                            languages_spoken=languages_spoken,
                            audio_video=request.FILES['audio_video'],
                            referrals=referrals
                        )
                else:
                    save_host_details = HostDetails(
                            host_name=host_name,
                            customer=save_customer,
                            location_cordinates=location_cordinates,
                            office_address=office_address,
                            service_coverage_zone=service_coverage_zone,
                            official_certifications=official_certifications,
                            number_of_years_practice_speciality=number_of_years_practice_speciality,
                            number_of_years_experience=number_of_years_experience,
                            specializations=specializations,
                            languages_spoken=languages_spoken,
                            referrals=referrals
                            # audio_video=request.FILES['audio_video'],
                        )


                save_host_details.save()

                save_customer.is_host = 1

                save_customer.save()

                logger.info(queryset_data.query)
            else:
                save_host_details = HostDetails.objects.get(customer=save_customer)

                save_host_details.host_name = host_name
                save_host_details.customer = save_customer
                save_host_details.location_cordinates = location_cordinates
                save_host_details.office_address = office_address
                save_host_details.service_coverage_zone = service_coverage_zone
                save_host_details.official_certifications = official_certifications
                save_host_details.number_of_years_practice_speciality = number_of_years_practice_speciality
                save_host_details.number_of_years_experience = number_of_years_experience
                save_host_details.specializations = specializations
                save_host_details.languages_spoken = languages_spoken
                save_host_details.referrals = referrals

                if 'audio_video' in request.FILES:
                    save_host_details.audio_video = request.FILES['audio_video']

                save_host_details.save()

                save_customer.is_host = 1

                save_customer.save()

            queryset_data = HostDetails.objects.filter(host_details_id=save_host_details.host_details_id).select_related('customer')
            # queryset_data = HostDetails.objects.get(host_details_id=save_host_details.host_details_id)

            return Response(HostDetailsSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)

#update language
class updateLanguage(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = SetLanguageSerializer(data=request.query_params)

        if serializer.is_valid(raise_exception=True):
            # user = User.objects.get(id=serializer.data['userid'])
            logger.info("parameters received is ")
            logger.info(serializer)
            customer = Customers.objects.get(user__id=int(serializer.data['userid']))

            customer.language_id = serializer.data['languageid']

            customer.save()
 
            # logger.info(RequestsSerializer(queryset_data, many=True).data)

            queryset_data = User.objects.filter(id=serializer.data['userid']).select_related('customers')

            return Response(UserSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)