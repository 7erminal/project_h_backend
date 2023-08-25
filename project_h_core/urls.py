"""project_h URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path
from rest_framework import routers

from django.conf.urls.static import static
from django.conf import settings

from project_h_core.auth_and_registration_views import register_views
from project_h_core.views import getUserWithPhoneNumberViewSet
from project_h_core.auth_and_registration_views import one_time_pin
from project_h_core.service_views import host_service
from project_h_core.service_views import payment_view
from project_h_core.service_views import ImageUploader
from project_h_core.service_views import request_service
from project_h_core.views import EssentialsViewSet
from project_h_core.service_views import search

router = routers.DefaultRouter()
router.register(r'register-customer', register_views.RegisterCustomerViewSet, basename='register-customer')
router.register(r'generate-otp', one_time_pin.GenerateOTPViewSet, basename='generate-otp')
router.register(r'validate-otp', one_time_pin.validateOTPViewSet, basename='validate-otp')
router.register(r'host-service', host_service.HostServiceViewSet, basename='host-service')
router.register(r'add-service-review', host_service.AddReviewViewSet, basename='add-service-review')
router.register(r'add-user-payment-method', payment_view.AddUserPaymentMethod, basename='add-user-payment-view')
router.register(r'update-customer-details', register_views.UpdateCustomerViewSet, basename='update-customer-details')
router.register(r'upload_image', ImageUploader.ImageUploader, basename='upload_image')
router.register(r'update-customer-image', register_views.UpdateProfileImage, basename='update-customer-image')
router.register(r'update-host-details', register_views.UpdateHostDetails, basename='update-host-details')
router.register(r'request-service', request_service.RequestServiceViewSet, basename='request-service')
router.register(r'search', search.SearchViewSet, basename='search')
router.register(r'request-service-post', search.RequestServiceNoticeViewSet, basename='request-service-post')
router.register(r'respond-to-request', request_service.RespondToRequest, basename='respond-to-request')
router.register(r'respond-to-request-notice', request_service.RespondToRequestNotice, basename='respond-to-request-notice')
router.register(r'get-request-by-request', request_service.GetUserRequestsResponsesByRequestId, basename='get-request-conversation')
router.register(r'get-request-conversation', request_service.GetUserRequestsResponsesByRequestId, basename='get-request-conversation')
router.register(r'get-request-notice-conversation', request_service.GetUserPostedRequestsResponsesByConvo, basename='get-request-notice-conversation')


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('get-user-with-phone-number', getUserWithPhoneNumberViewSet.as_view({'get': 'retrieve'}), name='check-user-exist'),
    path('essentials/', EssentialsViewSet.as_view(), name='essentials'),
    path('hosted-services-by-category/', host_service.GetHostedServicesByCategory.as_view({'get': 'retrieve'}), name='get-hosted-services-by-category'),
    path('hosted-services-by-user/', host_service.GetHostedServicesByUser.as_view({'get': 'retrieve'}), name='get-hosted-services-by-user'),
    path('hosted-services/', host_service.GetHostedServices.as_view({'get': 'retrieve'}), name='get-hosted-services'),
    path('get-payment-methods/', payment_view.GetPaymentMethods.as_view({'get': 'retrieve'}), name='get-payment-methods'),
    path('get-user-payment-methods/', payment_view.GetUserPaymentMethods.as_view({'get': 'retrieve'}), name='get-user-payment-methods'),
    path('hosted-service-reviews/', host_service.GetHostedServiceReviews.as_view({'get': 'retrieve'}), name='get-hosted-service-reviews'),
    path('get-host-details/', register_views.GetHostDetails.as_view({'get': 'retrieve'}), name='get-host-details'),
    path('get-all-requests/', request_service.GetAllRequests.as_view({'get': 'retrieve'}), name='get-all-requests'),
    path('get-requests-by-user', request_service.GetRequestsByUserId.as_view({'get': 'retrieve'}), name='get-requests-by-user'),
    path('get-requests-for-artisan', request_service.GetRequestsForArtisan.as_view({'get': 'retrieve'}), name='get-requests-for-artisan'),
    # path('generate-otp', one_time_pin.GenerateOTPViewSet.as_view({'get': 'retrieve'}), name='generate-otp'),
    path('get-all-posted-requests/', request_service.GetAllPostedRequests.as_view({'get': 'retrieve'}), name='get-all-posted-requests'),
    path('get-all-active-posted-requests', request_service.GetAllActivePostedRequests.as_view({'get': 'retrieve'}), name='get-all-active-posted-requests'),
    path('get-all-posted-requests-by-category', request_service.GetPostedRequestsByCategory.as_view({'get': 'retrieve'}), name='get-all-posted-requests-by-category'),
    path('get-all-posted-requests-by-user', request_service.GetPostedRequestsByUser.as_view({'get': 'retrieve'}), name='get-all-posted-requests-by-user'),
    path('update-request-notice-view-count', request_service.updateRequestNoticeViewCount.as_view({'get': 'retrieve'}), name='update-request-notice-view-count'),
    path('get-user-requests-responses', request_service.GetUserRequestsResponses.as_view({'get': 'retrieve'}), name='get-user-requests-responses'),
    path('get-user-posted-requests-responses', request_service.GetUserPostedRequestsResponses.as_view({'get': 'retrieve'}), name='get-user-posted-requests-responses'),
    path('get-request-notice-conversation', request_service.GetUserPostedRequestsResponsesByConvo.as_view({'get': 'retrieve'}), name='get-request-notice-conversation'),
    path('get-request-notice-by-request', request_service.GetUserPostedRequestsResponsesByRequestId.as_view({'get': 'retrieve'}), name='get-request-notice-by-request'),

]

# urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)