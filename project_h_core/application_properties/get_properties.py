from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import viewsets
from datetime import date, datetime, timedelta
from rest_framework.response import Response
from rest_framework import status
from drf_multiple_model.views import ObjectMultipleModelAPIView
from project_h_core.models import ServiceCategories
from project_h_core.models import ProfileMenu

from project_h_core.serializers import ServiceCategoriesResponseSerializer
from project_h_core.serializers import ProfileMenuResponseSerializer
from project_h_core.serializers import ProfileMenuSerializer
from project_h_core.serializers import ServiceCategoriesSerializer

import logging
logger = logging.getLogger("django")

class GetServiceCategories(viewsets.ViewSet):
    def retrieve(self, request):
        service_categories = ServiceCategories.objects.all()

        # logger.info(hosted_service.values())

        response_data = { 'response_code': "200", 'response_message': "Successful", 'service_categories': ServiceCategoriesSerializer(service_categories, many=True) }


        return Response(ServiceCategoriesResponseSerializer(response_data).data,status.HTTP_202_ACCEPTED)