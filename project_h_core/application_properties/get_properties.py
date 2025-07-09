from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework import status
from drf_multiple_model.views import ObjectMultipleModelAPIView
from project_h_core.models import ServiceCategories
from project_h_core.models import IDTypes

from project_h_core.serializers import ServiceCategoriesResponseSerializer, IDTypesResponseSerializer
from project_h_core.serializers import IdTypeSerializer
from project_h_core.serializers import ServiceCategoriesSerializer

import logging
logger = logging.getLogger("django")

class GetServiceCategories(viewsets.ViewSet):
    def retrieve(self, request):
        service_categories = ServiceCategories.objects.all()

        # logger.info(hosted_service.values())

        response_data = { 'response_code': "200", 'response_message': "Successful", 'service_categories': ServiceCategoriesSerializer(service_categories, many=True) }


        return Response(ServiceCategoriesResponseSerializer(response_data).data,status.HTTP_202_ACCEPTED)

class GetIDTypes(viewsets.ViewSet):
    def retrieve(self, request):
        id_types = IDTypes.objects.all()

        logger.info(id_types.values())

        response_data = { 'response_code': "200", 'response_message': "Successful", 'id_types': id_types }


        return Response(IDTypesResponseSerializer(response_data).data,status.HTTP_202_ACCEPTED)