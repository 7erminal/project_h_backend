from rest_framework import viewsets
from django.contrib.auth.models import User
from project_h_core.models import Hosted_service
from project_h_core.models import Services
from project_h_core.models import Services
from project_h_core.models import RequestNotice
from rest_framework import status
from rest_framework.response import Response

from project_h_core.serializers import IdSerializer
from project_h_core.serializers import SearchSerializer
from project_h_core.serializers import HostedServicesSerializer
from project_h_core.serializers import RequestNoticeSerializer

from django.db.models import Q

import logging
logger = logging.getLogger("django")

# Search a service
class SearchViewSet(viewsets.ViewSet):
	def create(self, request):
		serializer = SearchSerializer(data=request.data)

		if serializer.is_valid(raise_exception=True):
			list_len = len(serializer.data['search_words'])

			logger.info('data is ')
			logger.info(list_len)
			logger.info("and logger is ")
			logger.info(serializer.data['search_words'][0])

			if list_len > 0:
				queryset_data = Hosted_service.objects.filter(Q(description__icontains=serializer.data['search_words'][0]) | Q(service_name__icontains=serializer.data['search_words'][0]) | Q(process__icontains=serializer.data['search_words'][0]) | Q(location__icontains=serializer.data['search_words'][0]) ).prefetch_related('hosted_service_reviews')
				return Response(HostedServicesSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
			else:
				return Response("Request Failed", status=status.HTTP_201_CREATED)
		else:
			return Response("Request Failed", status=status.HTTP_201_CREATED)

# Request a service
class RequestServiceNoticeViewSet(viewsets.ViewSet):
	def create(self, request):
		serializer = SearchSerializer(data=request.data)

		logger.info("Request data is ")
		logger.info(request.data)

		if serializer.is_valid(raise_exception=True):			
			user = User.objects.get(id=serializer.data['user'])

			search_words = serializer.data['search_words'][0]
			list_len = len(serializer.data['search_words'])

			category = ''
			key_words = ''
			location = ''

			if serializer.data['category'] is not None:
				category = Services.objects.get(service_id=serializer.data['category'])

			if serializer.data['key_words'] is not None:
				key_words = serializer.data['key_words']

			if list_len > 0:
				request = RequestNotice(
					preferences=search_words,
					category = category,
					key_words=key_words,
					location=location,
					served=0,
					active=1,
					created_by=user
				)

				request.save()

				# queryset_data = Hosted_service.objects.filter(description__icontains=serializer.data['search_words'][0]).prefetch_related('hosted_service_reviews')

				return Response(RequestNoticeSerializer(request).data,status.HTTP_202_ACCEPTED)
			else:
				return Response("Request Failed", status=status.HTTP_201_CREATED)
		else:
			return Response("Request Failed", status=status.HTTP_201_CREATED)

