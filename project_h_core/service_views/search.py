from rest_framework import viewsets
from django.contrib.auth.models import User
from project_h_core.models import Hosted_service
from project_h_core.models import Services
from rest_framework.response import Response
from rest_framework import status

from project_h_core.serializers import IdSerializer
from project_h_core.serializers import SearchSerializer
from project_h_core.serializers import HostedServicesSerializer

import logging
logger = logging.getLogger("django")

# Request a service
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
				queryset_data = Hosted_service.objects.filter(description__icontains=serializer.data['search_words'][0]).prefetch_related('hosted_service_reviews')
				return Response(HostedServicesSerializer(queryset_data, many=True).data,status.HTTP_202_ACCEPTED)
			else:
				return Response("Request Failed", status=status.HTTP_201_CREATED)
		else:
			return Response("Request Failed", status=status.HTTP_201_CREATED)