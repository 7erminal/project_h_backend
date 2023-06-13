from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import viewsets
from datetime import date, datetime, timedelta
from rest_framework.response import Response
from rest_framework import status
from drf_multiple_model.views import ObjectMultipleModelAPIView
import random, string
from django.contrib.auth.hashers import make_password
from rest_framework.parsers import MultiPartParser, FormParser

from project_h_core.models import Hosted_service
from project_h_core.models import Cards
from project_h_core.models import Services
from project_h_core.models import Requests
from project_h_core.models import Payment_methods
from project_h_core.models import Momo
from project_h_core.models import User_payment_methods
from project_h_core.models import RequestNotice
from project_h_core.models import RequestResponses
from project_h_core.models import RequestNoticeResponses

from project_h_core.serializers import RequestSerializer
from project_h_core.serializers import RequestsSerializer
from project_h_core.serializers import UserPaymentMethodSerializer

from project_h_core.serializers import IdSerializer
from project_h_core.serializers import RequestNoticeSerializer

from project_h_core.serializers import ResponseSerializer
from project_h_core.serializers import RequestResponseSerializer
from project_h_core.serializers import RequestNoticeResponseSerializer

import logging
logger = logging.getLogger("django")

# Get all requests
class GetAllRequests(viewsets.ViewSet):
    def retrieve(self, request):
        requests = Requests.objects.all()

        logger.info(requests.values())

        return Response(RequestsSerializer(requests, many=True).data,status.HTTP_202_ACCEPTED)

# Get Requests by User ID
class GetRequestsByUserId(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        if serializer.is_valid(raise_exception=True):
            user = User.objects.get(id=serializer.data['id'])
            queryset_data = Requests.objects.filter(requester=user)
 
            logger.info('data returned for service reviews is ')
            logger.info(RequestsSerializer(queryset_data, many=True).data)

            return Response(RequestsSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)


# Get Requests for User
class GetRequestsForArtisan(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        if serializer.is_valid(raise_exception=True):
            user = User.objects.get(id=serializer.data['id'])
            queryset_data = Requests.objects.filter(host_service__user=user)
 
            logger.info('data returned for service reviews is ')
            logger.info(RequestsSerializer(queryset_data, many=True).data)

            return Response(RequestsSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)

# Request a service
class RequestServiceViewSet(viewsets.ViewSet):
    def create(self, request):
        serializer = RequestSerializer(data=request.data)

        logger.info("Request data is ")
        logger.info(request.data)

        if serializer.is_valid(raise_exception=True):
            hosted_service = Hosted_service.objects.get(hosted_service_id=serializer.data['host_service_id'])
            requester = User.objects.get(id=serializer.data['requester_id'])
            host = User.objects.get(id=serializer.data['host'])
            # payment_option = User_payment_methods.objects.get(id=serializer.data['payment_option'])
            payment_option = User_payment_methods.objects.get(id=serializer.data['payment_option'])
            
            logger.info("Payment options are ")
            # logger.info(UserPaymentMethodSerializer(payment_option).data)
            # logger.info(payment_option.payment_method)

            request = Requests(
                    host_service=hosted_service,
                    requester = requester,
                    choice=serializer.data['choices'],
                    preferences=serializer.data['preferences'],
                    host=host,
                    charge=serializer.data['charge'],
                    payment_method=payment_option.payment_method,
                    active=1,
                    created_by=serializer.data['requester_id'],
                    payment_option=payment_option
                )

            request.save()

            logger.info("Result after processing request")
            logger.info(RequestsSerializer(request).data)


            return Response(RequestsSerializer(request).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)





# Posted Requests

# Get all posted requests
class GetAllPostedRequests(viewsets.ViewSet):
    def retrieve(self, request):
        requests = RequestNotice.objects.all()

        logger.info(requests.values())

        return Response(RequestsSerializer(requests, many=True).data,status.HTTP_202_ACCEPTED)


# Get all active posted requests
class GetAllActivePostedRequests(viewsets.ViewSet):
    def retrieve(self, request):
        requests = RequestNotice.objects.filter(active=1, served=0)
        # requests = RequestNotice.objects.all()

        logger.info("About to go get request Notices")

        logger.info(requests.values())

        return Response(RequestNoticeSerializer(requests, many=True).data,status.HTTP_202_ACCEPTED)


# Get Posted Requests by category
class GetPostedRequestsByCategory(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        if serializer.is_valid(raise_exception=True):
            service = Services.objects.get(id=serializer.data['id'])
            queryset_data = RequestNotice.objects.filter(category=service, active=1)
 
            logger.info('data returned for requests is ')
            logger.info(RequestNoticeSerializer(queryset_data, many=True).data)

            return Response(RequestNoticeSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)


# Get Posted Requests by User ID
class GetPostedRequestsByUser(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        if serializer.is_valid(raise_exception=True):
            user = User.objects.get(id=serializer.data['id'])
            queryset_data = RequestNotice.objects.filter(created_by=user)
 
            logger.info('data returned for requests is ')
            logger.info(RequestNoticeSerializer(queryset_data, many=True).data)

            return Response(RequestNoticeSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)




# Respond to request
class RespondToRequest(viewsets.ViewSet):
    def create(self, request):
        serializer = ResponseSerializer(data=request.data)

        logger.info('Request received for response ')

        if serializer.is_valid(raise_exception=True):
            user = User.objects.get(id=serializer.data['user'])
            request = Requests.objects.get(request_id=serializer.data['request_id'])
            
            accepted = 0

            logger.info("About to check for accepted status")

            if serializer.data['accepted'] is not None:
                accepted = serializer.data['accepted']

            is_first_response = 0

            if serializer.data['is_first_response'] is not None:
                is_first_response = serializer.data['is_first_response']

            response = serializer.data['response']

            response = RequestResponses(
                    request=request,
                    response = response,
                    accepted=accepted,
                    is_first_response=is_first_response,
                    active=1,
                    created_by=user
                )

            response.save()

            request.active = 2
            request.save()

            return Response(RequestResponseSerializer(response).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)


# Respond to request
class RespondToRequestNotice(viewsets.ViewSet):
    def create(self, request):
        serializer = ResponseSerializer(data=request.data)

        logger.info('Request received for response ')
        logger.info(request.data)

        if serializer.is_valid(raise_exception=True):
            user = User.objects.get(id=serializer.data['user'])
            request = RequestNotice.objects.get(request_notice_id=serializer.data['request_id'])
            
            accepted = 0

            logger.info("Request Notice")

            logger.info("About to check for accepted status")

            if serializer.data['accepted'] is not None:
                logger.info("Accepted is not none")
                logger.info(serializer.data['accepted'])
                accepted = serializer.data['accepted']

            is_first_response = 0

            logger.info("About to check for first response status")

            if serializer.data['is_first_response'] is not None:
                is_first_response = serializer.data['is_first_response']

            response = serializer.data['response']

            response = RequestNoticeResponses(
                    request_notice=request,
                    response = response,
                    accepted=accepted,
                    is_first_response=is_first_response,
                    active=1,
                    created_by=user
                )

            response.save()

            return Response(RequestNoticeResponseSerializer(response).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)


# update view count for request Notice

class updateRequestNoticeViewCount(viewsets.ViewSet):
    def retrieve(self, request):
        serializer = IdSerializer(data=request.query_params)

        logger.info("Request params are")
        logger.info(request.query_params)

        if serializer.is_valid(raise_exception=True):
            requestNoticeObject = RequestNotice.objects.get(request_notice_id=serializer.data['id'])
 
            # logger.info(requestNoticeObject.values())
            logger.info(requestNoticeObject.view_count)
            requestNoticeObject.view_count = requestNoticeObject.view_count + 1
            requestNoticeObject.save()

            logger.info('data returned for requests is ')
            logger.info(RequestNoticeSerializer(requestNoticeObject).data)

            return Response(RequestNoticeSerializer(requestNoticeObject).data,status.HTTP_202_ACCEPTED)
        else:
            return Response("Request Failed", status=status.HTTP_201_CREATED)

