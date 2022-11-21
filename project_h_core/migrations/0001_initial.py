# Generated by Django 3.1.6 on 2022-11-08 10:24

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Countries',
            fields=[
                ('country_id', models.AutoField(primary_key=True, serialize=False)),
                ('country_name', models.CharField(max_length=50, unique=True)),
                ('can_onboard', models.SmallIntegerField(blank=True, null=True)),
                ('active', models.SmallIntegerField(blank=True, null=True)),
                ('created_by', models.IntegerField(blank=True, null=True)),
                ('updated_by', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Hosted_service',
            fields=[
                ('hosted_service_id', models.AutoField(primary_key=True, serialize=False)),
                ('service_name', models.CharField(max_length=50, unique=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('process', models.TextField(blank=True, null=True)),
                ('active', models.SmallIntegerField(blank=True, null=True)),
                ('location', models.CharField(blank=True, max_length=100, null=True)),
                ('expected_duration', models.CharField(blank=True, max_length=20, null=True)),
                ('price', models.IntegerField(default=0)),
                ('part_payment_allowed', models.SmallIntegerField(blank=True, null=True)),
                ('created_by', models.IntegerField(blank=True, null=True)),
                ('updated_by', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='hosted_service_user_id', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='IDTypes',
            fields=[
                ('IDType_id', models.AutoField(primary_key=True, serialize=False)),
                ('IDType_name', models.CharField(max_length=40)),
                ('active', models.SmallIntegerField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Services',
            fields=[
                ('service_id', models.AutoField(primary_key=True, serialize=False)),
                ('service_name', models.CharField(max_length=50, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('active', models.SmallIntegerField(blank=True, null=True)),
                ('created_by', models.IntegerField(blank=True, null=True)),
                ('updated_by', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Service_reviews',
            fields=[
                ('service_review_id', models.AutoField(primary_key=True, serialize=False)),
                ('review', models.TextField()),
                ('active', models.IntegerField(blank=True, default=1, null=True)),
                ('created_by', models.IntegerField(blank=True, null=True)),
                ('updated_by', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('hosted_service', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='hosted_service_reviews', to='project_h_core.hosted_service')),
                ('review_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='service_review_user_id', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Service_images',
            fields=[
                ('service_image_id', models.AutoField(primary_key=True, serialize=False)),
                ('image', models.ImageField(upload_to='')),
                ('description', models.TextField(blank=True, null=True)),
                ('created_by', models.IntegerField(blank=True, null=True)),
                ('updated_by', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('hosted_service', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='hosted_service_images', to='project_h_core.hosted_service')),
            ],
        ),
        migrations.CreateModel(
            name='Payments',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('amount', models.CharField(default=0, max_length=12)),
                ('amount_paid', models.CharField(max_length=12)),
                ('payment_status', models.CharField(default='not_paid', max_length=10)),
                ('active', models.BooleanField(default=1)),
                ('created_by', models.IntegerField(blank=True, null=True)),
                ('updated_by', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('payment_for', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='payments_service', to='project_h_core.hosted_service')),
                ('payment_from', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='payment_for_user_id', to=settings.AUTH_USER_MODEL)),
                ('payment_to', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='payment_to_user_id', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Customers',
            fields=[
                ('customer_id', models.AutoField(primary_key=True, serialize=False)),
                ('customer_number', models.CharField(max_length=50, unique=True)),
                ('dob', models.DateField(default=datetime.date.today)),
                ('active', models.SmallIntegerField(blank=True, null=True)),
                ('is_verified', models.SmallIntegerField(blank=True, null=True)),
                ('ID_number', models.IntegerField(max_length=50, null=True)),
                ('language_id', models.IntegerField(max_length=5, null=True)),
                ('profession', models.CharField(blank=True, max_length=50, null=True)),
                ('mobile_number', models.CharField(max_length=50, null=True, unique=True)),
                ('gender', models.CharField(default='n', max_length=6)),
                ('picture', models.ImageField(blank=True, null=True, upload_to='customer_images')),
                ('other_names', models.CharField(blank=True, max_length=80, null=True)),
                ('address', models.CharField(blank=True, max_length=80, null=True)),
                ('location', models.CharField(blank=True, max_length=100, null=True)),
                ('nationality', models.IntegerField(max_length=5, null=True)),
                ('dateTermsAndConditions', models.DateTimeField(blank=True, null=True)),
                ('datePrivacyPolicy', models.DateTimeField(blank=True, null=True)),
                ('created_by', models.IntegerField(blank=True, null=True)),
                ('updated_by', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('ID_type', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='customer_id_type', to='project_h_core.idtypes')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
