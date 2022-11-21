from django.shortcuts import render
from rest_framework import viewsets
from project_h_core.serializers import ImageSerializer
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.response import Response
from django.contrib.auth.models import User
from rest_framework import status
from project_h_core.models import Service_images

import logging

logger = logging.getLogger("django")


class ImageUploader(viewsets.ViewSet):
    def create(self, request):
        parser_classes = (FormParser, MultiPartParser)

        image_serializer = ImageSerializer(data=request.data)
        # image_model_serializer = ImageSerializer(data=request.data)

        logger.info("Selected images are ")
        logger.info(request.data)

        if image_serializer.is_valid(raise_exception=True):
            # images = request.FILES.getlist['image']
            image_sav = Image()
            
            image_sav.hosted_service = image_serializer.data['hosted_service']
            image_sav.image = request.FILES['image']
            image_sav.save()

            return Response(ImageSerializer(image_sav).data, status=status.HTTP_201_CREATED)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        # image_serializer = Storage_facilitySerializer_serializer(request.data, many=True).data
        
        
   
    	
