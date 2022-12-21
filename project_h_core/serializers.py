from rest_framework import serializers
from project_h_core.models import One_time_pin
from django.contrib.auth.models import User
from project_h_core.models import Customers
from project_h_core.models import Service_images
from project_h_core.models import Hosted_service
from project_h_core.models import Service_reviews
from project_h_core.models import Payment_methods

class IdSerializer(serializers.Serializer):
    id = serializers.CharField(max_length=25)

class CustomerSerializer(serializers.ModelSerializer):
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
    # password = serializers.CharField(max_length=100)
    picture = serializers.ImageField(max_length=255, required=False)
    id_type = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    id_number = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    location = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    nationality = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    profession = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    is_verified = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    is_host = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)
    language = serializers.CharField(max_length=25, allow_null=True, allow_blank=True, required=False)

class HostServiceSerializer(serializers.Serializer):
    id = serializers.CharField(max_length=10, required=False)
    parent_service = serializers.CharField(max_length=40, allow_null=True, allow_blank=True, required=False)
    service_name = serializers.CharField(max_length=50)
    description = serializers.CharField(max_length=255, allow_null=True, allow_blank=True)
    location = serializers.CharField(max_length=100, allow_null=True, allow_blank=True, required=False)
    process = serializers.CharField(max_length=255, allow_null=True, allow_blank=True)
    duration = serializers.CharField(max_length=20, allow_null=True, allow_blank=True)
    price = serializers.CharField(allow_null=True, allow_blank=True)
    pictures = serializers.ListField(child=serializers.ImageField(required=False), required=False)
    # pictures = serializers.ImageField(widget=forms.ClearableFileInput(attrs={'multiple': True}), required=False)

class OTPSerializer(serializers.Serializer):
    number = serializers.CharField(max_length=25)
    otp_type = serializers.CharField(max_length=20, required=False)
    otp = serializers.CharField(max_length=8, required=False)

class OTPCheckSerializer(serializers.ModelSerializer):
    class Meta:
        model = One_time_pin
        fields = '__all__'

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

class HostedReviewsSerializer(serializers.ModelSerializer):
    review_by = UserSerializer()
    
    class Meta:
        model = Service_reviews
        fields = '__all__'

class HostedServicesSerializer(serializers.ModelSerializer):
    hosted_service_images = ImageSerializer(many=True)
    hosted_service_reviews = HostedReviewsSerializer(many=True)

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
    payment_method = serializers.CharField(max_length=255)
    expired = serializers.CharField(max_length=50, required=False)
    active = serializers.CharField(max_length=5)


