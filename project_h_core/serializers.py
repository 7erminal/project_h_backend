from rest_framework import serializers
from project_h_core.models import One_time_pin
from django.contrib.auth.models import User
from project_h_core.models import Customers
from project_h_core.models import Service_images
from project_h_core.models import Hosted_service
from project_h_core.models import Service_reviews
from project_h_core.models import Payment_methods
from project_h_core.models import Services_sub_categories
from project_h_core.models import Services
from project_h_core.models import HostDetails
from project_h_core.models import Services_sub_category_fields
from project_h_core.models import User_payment_methods
from project_h_core.models import Requests
from project_h_core.models import RequestNotice
from project_h_core.models import RequestResponses
from project_h_core.models import RequestNoticeResponses
from project_h_core.models import ServiceCategories
from project_h_core.models import ProfileMenu
from project_h_core.models import Language
from project_h_core.models import ApplicationProperties
from project_h_core.models import Currencies

class IdSerializer(serializers.Serializer):
    id = serializers.CharField(max_length=25)

class HostDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = HostDetails
        fields = '__all__'

class CustomerSerializer(serializers.ModelSerializer):
    hostdetails = HostDetailsSerializer()
    
    class Meta:
        model = Customers
        fields = '__all__'

class UserSerializer(serializers.ModelSerializer):
    customers = CustomerSerializer()

    class Meta:
        model = User
        fields = '__all__'


class RegisterCustomerSerializer(serializers.Serializer):
    id = serializers.CharField(max_length=10, required=False)
    first_name = serializers.CharField(max_length=50, allow_null=True)
    last_name = serializers.CharField(max_length=120, required=True)
    other_names = serializers.CharField(max_length=50, allow_null=True, allow_blank=True, required=False)
    dob = serializers.DateField(required=False)
    gender = serializers.CharField(max_length=100, allow_null=True, required=False)
    mobile_number = serializers.CharField(max_length=20, allow_null=True, required=False)
    email = serializers.CharField(max_length=50, allow_null=True, required=False)
    address = serializers.CharField(max_length=100, allow_null=True, allow_blank=True, required=False)
    password = serializers.CharField(max_length=100)
    picture = serializers.ImageField(max_length=255, required=False)
    id_type = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    id_number = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    location = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    nationality = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    profession = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    is_verified = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    is_host = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    language = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)

class HostSerializer(serializers.Serializer):
    id = serializers.CharField(max_length=10, required=False)
    host_name = serializers.CharField(max_length=100, required=False, allow_null=True)
    location_cordinates = serializers.CharField(max_length=50, required=False, allow_null=True, allow_blank=True)
    office_address = serializers.CharField(max_length=50, required=False, allow_null=True, allow_blank=True)
    service_coverage_zone = serializers.CharField(max_length=50, required=False, allow_null=True, allow_blank=True)
    official_certifications = serializers.CharField(max_length=50, required=False, allow_null=True, allow_blank=True)
    number_of_years_practice_speciality = serializers.CharField(max_length=50, required=False, allow_null=True, allow_blank=True)
    number_of_years_experience = serializers.CharField(max_length=50, required=False, allow_null=True, allow_blank=True)
    specializations = serializers.CharField(max_length=255, required=False, allow_null=True, allow_blank=True)
    audio_video = serializers.CharField(max_length=255, required=False, allow_null=True, allow_blank=True)
    languages_spoken = serializers.CharField(max_length=255, required=False, allow_null=True, allow_blank=True)
    referrals = serializers.CharField(max_length=255, required=False, allow_null=True, allow_blank=True)

class HostServiceSerializer(serializers.Serializer):
    id = serializers.CharField(max_length=10, required=False)
    parent_service = serializers.CharField(max_length=40, allow_null=True, allow_blank=True, required=False)
    service_name = serializers.CharField(max_length=50, required=False, allow_null=True, allow_blank=True)
    description = serializers.CharField(max_length=255, allow_null=True, allow_blank=True)
    location = serializers.CharField(max_length=100, allow_null=True, allow_blank=True, required=False)
    process = serializers.CharField(max_length=255, allow_null=True, allow_blank=True, required=False)
    duration = serializers.CharField(max_length=20, allow_null=True, allow_blank=True)
    price = serializers.CharField(allow_null=True, allow_blank=True)
    pictures = serializers.ListField(child=serializers.ImageField(required=False), required=False)
    service_sub = serializers.CharField(max_length=100, allow_null=True, allow_blank=True, required=False)
    selected_sub_fields = serializers.ListField(child=serializers.CharField(max_length=100, required=False, allow_null=True), required=False)
    # pictures = serializers.ImageField(widget=forms.ClearableFileInput(attrs={'multiple': True}), required=False)

class OTPSerializer(serializers.Serializer):
    number = serializers.CharField(max_length=25)
    otp_type = serializers.CharField(max_length=20, required=False)
    otp = serializers.CharField(max_length=8, required=False)

class OTPCheckSerializer(serializers.ModelSerializer):
    class Meta:
        model = One_time_pin
        fields = '__all__'

class authenticationSerializer(serializers.Serializer):
    username = serializers.CharField(max_length=255)
    password = serializers.CharField(max_length=255, required=True)

class authenticationResponseSerializer(serializers.Serializer):
    message = serializers.CharField(max_length=255)
    status = serializers.CharField(max_length=255)
    user = UserSerializer()

class ProfilePictureSerializer(serializers.Serializer):
    id = serializers.CharField(max_length=10, required=False)
    picture = serializers.ImageField(max_length=255, required=False)

class ImageSerializer(serializers.Serializer):
    service_image_id = serializers.CharField(max_length=10, required=False)
    image = serializers.ImageField(required=True)
    description = serializers.CharField(max_length=255, required=False)

    def create(self, validated_data):
        return Image(id=None, **validated_data)

class ServiceSerializer(serializers.Serializer):
    service_id = serializers.CharField(max_length=10, required=False)
    service_name = serializers.CharField(max_length=40)
    description = serializers.CharField(max_length=255, allow_null=True, allow_blank=True)
    service_icon = serializers.CharField(max_length=50, required=False, allow_null=True, allow_blank=True)

class ServiceSubCategoriesSubsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Services_sub_category_fields
        fields = '__all__'


class ServiceSubCategoriesSerializer(serializers.ModelSerializer):
    services_sub_category_field = ServiceSubCategoriesSubsSerializer(many=True)

    class Meta:
        model = Services_sub_categories
        fields = '__all__'

class ServicesAndSubCategoriesSerializer(serializers.ModelSerializer):
    service_sub_service = ServiceSubCategoriesSerializer(many=True)
    
    class Meta:
        model = Services
        fields = '__all__'

class HostedReviewsSerializer(serializers.ModelSerializer):
    review_by = UserSerializer()
    
    class Meta:
        model = Service_reviews
        fields = '__all__'

class CurrenciesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Currencies
        fields = '__all__'
        
class HostedServicesSerializer(serializers.ModelSerializer):
    hosted_service_images = ImageSerializer(many=True)
    hosted_service_reviews = HostedReviewsSerializer(many=True)
    user =  UserSerializer()
    charge_currency = CurrenciesSerializer()

    class Meta:
        model = Hosted_service
        fields = '__all__'

class AddReviewSerializer(serializers.Serializer):
    hosted_service_id = serializers.CharField(max_length=10, required=True)
    review = serializers.CharField(max_length=255, required=True)
    user_id = serializers.CharField(max_length=5, required=True)

class PaymentMethodsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Payment_methods
        fields = '__all__'

class userPaymentMethodsSerializer(serializers.Serializer):
    user_id = serializers.CharField(max_length=10, required=False)
    payment_method = serializers.CharField(max_length=255, required=False)
    expired = serializers.CharField(max_length=50, required=False)
    payment_method_number = serializers.CharField(max_length=50, required=False)
    active = serializers.CharField(max_length=5, required=False)

class UserPaymentMethodSerializer(serializers.ModelSerializer):
    class Meta:
        model = User_payment_methods
        fields = '__all__'

class RequestSerializer(serializers.Serializer):
    request_id = serializers.CharField(max_length=10, required=False)
    host_service_id = serializers.CharField(max_length=10, required=False, allow_null=True, allow_blank=True)
    requester_id = serializers.CharField(max_length=10, required=False, allow_null=True, allow_blank=True)
    choices = serializers.CharField(max_length=50, required=False, allow_null=True, allow_blank=True)
    preferences = serializers.CharField(max_length=255, required=False, allow_null=True, allow_blank=True)
    host = serializers.CharField(max_length=10, required=False, allow_null=True, allow_blank=True)
    charge = serializers.FloatField(required=False, allow_null=True)
    payment_option = serializers.CharField(max_length=10, required=False, allow_null=True, allow_blank=True)

class RequestsSerializer(serializers.ModelSerializer):
    host_service = HostedServicesSerializer()
    requester = UserSerializer()
    payment_method = PaymentMethodsSerializer()
    payment_option = UserPaymentMethodSerializer()

    class Meta:
        model = Requests
        fields = '__all__'

class SearchSerializer(serializers.Serializer):
    user = serializers.IntegerField(required=False, allow_null=True)
    search_words = serializers.ListField(child=serializers.CharField(max_length=255), required=True)
    category = serializers.CharField(max_length=50, required=False, allow_null=True, allow_blank=True)
    key_words = serializers.CharField(max_length=200, required=False, allow_null=True, allow_blank=True)
    location = serializers.CharField(max_length=100, required=False, allow_null=True, allow_blank=True)


class RequestNoticeSerializer(serializers.ModelSerializer):
    category = ServiceSerializer()
    created_by = UserSerializer()

    class Meta:
        model = RequestNotice
        fields = '__all__'

class ResponseSerializer(serializers.Serializer):
    request_id = serializers.CharField(required=True, max_length=50)
    response = serializers.CharField(max_length=250, required=False, allow_null=True, allow_blank=True)
    accepted = serializers.IntegerField(required=False, allow_null=True)
    is_first_response = serializers.BooleanField(required=False, allow_null=True)
    user = serializers.CharField(required=False, max_length=50)
    conversation_id = serializers.CharField(required=False, allow_null=True, allow_blank=True, max_length=50)

class ViewCountUpdateSerializer(serializers.Serializer):
    request_id = serializers.CharField(required=True, max_length=50)
    

class RequestNoticeResponseSerializer(serializers.ModelSerializer):
    request_notice = RequestNoticeSerializer()
    created_by = UserSerializer()

    class Meta:
        model = RequestNoticeResponses
        fields = '__all__'

class RequestResponseSerializer(serializers.ModelSerializer):
    request = RequestsSerializer()
    created_by = UserSerializer()

    class Meta:
        model = RequestResponses
        fields = '__all__'

class ConversationSerializer(serializers.Serializer):
    request_id = serializers.CharField(required=True, max_length=50)
    artisan_id = serializers.CharField(required=False, max_length=50)
    user_id = serializers.CharField(required=False, max_length=50)

class ServiceCategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = ServiceCategories
        fields = '__all__'

class ProfileMenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProfileMenu
        fields = '__all__'

class LanguageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Language
        fields = '__all__'

class ApplicationPropertySerializer(serializers.ModelSerializer):
    class Meta:
        model = ApplicationProperties
        fields = '__all__'

class ServiceCategoriesResponseSerializer(serializers.Serializer):
    response_code = serializers.CharField(required=True, max_length=20)
    response_message = serializers.CharField(required=True, max_length=100)
    service_categories = ServiceCategoriesSerializer()

class ProfileMenuResponseSerializer(serializers.Serializer):
    response_code = serializers.CharField(required=True, max_length=20)
    response_message = serializers.CharField(required=True, max_length=100)
    service_categories = ProfileMenuSerializer()

class SetLanguageSerializer(serializers.Serializer):
    userid = serializers.CharField(max_length=10, required=False)
    languageid = serializers.CharField(max_length=10, required=False)