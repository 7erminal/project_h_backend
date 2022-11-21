from django.db import models
from django.contrib.auth.models import User
from datetime import date

# Create your models here.
class IDTypes(models.Model):
	IDType_id = models.AutoField(primary_key=True)
	IDType_name = models.CharField(max_length=40)
	active = models.SmallIntegerField(null=True, blank=True)

class Customers(models.Model):
	customer_id = models.AutoField(primary_key=True)
	user = models.OneToOneField(User, on_delete=models.CASCADE)
	customer_number = models.CharField(max_length=50, unique=True)
	dob = models.DateField(default=date.today)
	active = models.SmallIntegerField(null=True, blank=True)
	is_verified = models.SmallIntegerField(null=True, blank=True)
	ID_type = models.ForeignKey(IDTypes, null=True, blank=True, on_delete=models.CASCADE, related_name='customer_id_type')
	ID_number = models.IntegerField(null=True)
	language_id = models.IntegerField(null=True)
	profession = models.CharField(max_length=50, null=True, blank=True)
	mobile_number = models.CharField(max_length=50, null=True, unique=True)
	gender = models.CharField(max_length=6, default='n')
	picture = models.ImageField(upload_to='customer_images', null=True, blank=True)
	other_names = models.CharField(max_length=80, null=True, blank=True)
	address = models.CharField(max_length=80, null=True, blank=True)
	location = models.CharField(max_length=100, null=True, blank=True)
	nationality = models.IntegerField(null=True)
	dateTermsAndConditions = models.DateTimeField(null=True, blank=True)
	datePrivacyPolicy = models.DateTimeField(null=True, blank=True)
	is_host = models.SmallIntegerField(default=0)
	created_by = models.IntegerField(null=True, blank=True)
	updated_by = models.IntegerField(null=True, blank=True)
	created_at = models.DateTimeField(auto_now_add=True, blank=True)
	updated_at = models.DateTimeField(auto_now=True, blank=True)

class Services(models.Model):
	service_id = models.AutoField(primary_key=True)
	service_name = models.CharField(max_length=50, null=True)
	description = models.TextField(null=True, blank=True)
	service_icon = models.CharField(max_length=80, null=True, blank=True)
	active = models.SmallIntegerField(null=True, blank=True)
	created_by = models.IntegerField(null=True, blank=True)
	updated_by = models.IntegerField(null=True, blank=True)
	created_at = models.DateTimeField(auto_now_add=True, blank=True)
	updated_at = models.DateTimeField(auto_now=True, blank=True)

class Hosted_service(models.Model):
	hosted_service_id = models.AutoField(primary_key=True)
	service = models.ForeignKey(Services, null=True, blank=True, on_delete=models.CASCADE, related_name='hosted_service_service')
	service_name =  models.CharField(max_length=50, unique=True)
	description = models.TextField(null=True, blank=True)
	location = models.CharField(max_length=100, null=True, blank=True)
	location_cordinates = models.CharField(max_length=100, null=True, blank=True)
	process = models.TextField(null=True, blank=True)
	user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='hosted_service_user_id')
	active = models.SmallIntegerField(null=True, blank=True)
	expected_duration = models.CharField(max_length=20, null=True, blank=True)
	price = models.IntegerField(default=0)
	part_payment_allowed = models.SmallIntegerField(null=True, blank=True)
	created_by = models.IntegerField(null=True, blank=True)
	updated_by = models.IntegerField(null=True, blank=True)
	created_at = models.DateTimeField(auto_now_add=True, blank=True)
	updated_at = models.DateTimeField(auto_now=True, blank=True)

class Service_images(models.Model):
	service_image_id = models.AutoField(primary_key=True)
	hosted_service = models.ForeignKey(Hosted_service, on_delete=models.CASCADE, related_name='hosted_service_images')
	image = models.ImageField(upload_to='images')
	description = models.TextField(null=True, blank=True)
	created_by = models.IntegerField(null=True, blank=True)
	updated_by = models.IntegerField(null=True, blank=True)
	created_at = models.DateTimeField(auto_now_add=True, blank=True)
	updated_at = models.DateTimeField(auto_now=True, blank=True)

class Service_reviews(models.Model):
	service_review_id = models.AutoField(primary_key=True)
	hosted_service = models.ForeignKey(Hosted_service, on_delete=models.CASCADE, related_name='hosted_service_reviews')
	review_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name='service_review_user_id')
	review = models.TextField()
	active = models.IntegerField(null=True, blank=True, default=1)
	created_by = models.IntegerField(null=True, blank=True)
	updated_by = models.IntegerField(null=True, blank=True)
	created_at = models.DateTimeField(auto_now_add=True, blank=True)
	updated_at = models.DateTimeField(auto_now=True, blank=True)

class Countries(models.Model):
	country_id = models.AutoField(primary_key=True)
	country_name = models.CharField(max_length=50, unique=True)
	can_onboard = models.SmallIntegerField(null=True, blank=True)
	active = models.SmallIntegerField(null=True, blank=True)
	created_by = models.IntegerField(null=True, blank=True)
	updated_by = models.IntegerField(null=True, blank=True)
	created_at = models.DateTimeField(auto_now_add=True, blank=True)
	updated_at = models.DateTimeField(auto_now=True, blank=True)

class Payments(models.Model):
	payment_from = models.ForeignKey(User, on_delete=models.CASCADE, related_name='payment_for_user_id')
	payment_to = models.ForeignKey(User, on_delete=models.CASCADE, related_name='payment_to_user_id')
	payment_for = models.ForeignKey(Hosted_service, on_delete=models.CASCADE, related_name='payments_service')
	amount = models.CharField(max_length=12, default=0)
	amount_paid = models.CharField(max_length=12)
	payment_status = models.CharField(max_length=10, default='not_paid')
	active = models.BooleanField(default=1)
	created_by = models.IntegerField(null=True, blank=True)
	updated_by = models.IntegerField(null=True, blank=True)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)

class One_time_pin(models.Model):
	mobile_number = models.CharField(max_length=25)
	code = models.CharField(max_length=10)
	processed = models.SmallIntegerField(default=0)
	status = models.IntegerField(null=True, blank=True)
	otp_type = models.CharField(max_length=25, default="login")
	active = models.BooleanField(default=1)
	created_by = models.IntegerField(null=True, blank=True)
	updated_by = models.IntegerField(null=True, blank=True)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)



