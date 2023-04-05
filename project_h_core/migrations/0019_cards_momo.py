# Generated by Django 3.1.6 on 2023-03-29 19:14

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('project_h_core', '0018_requests'),
    ]

    operations = [
        migrations.CreateModel(
            name='Momo',
            fields=[
                ('momo_id', models.AutoField(primary_key=True, serialize=False)),
                ('number', models.CharField(max_length=30)),
                ('verified', models.BooleanField(default=1)),
                ('active', models.BooleanField(default=1)),
                ('created_by', models.IntegerField(blank=True, null=True)),
                ('updated_by', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='momo_user_id', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Cards',
            fields=[
                ('card_id', models.AutoField(primary_key=True, serialize=False)),
                ('card_number', models.CharField(blank=True, max_length=100, null=True)),
                ('expiry_date', models.CharField(blank=True, max_length=100, null=True)),
                ('active', models.BooleanField(default=1)),
                ('created_by', models.IntegerField(blank=True, null=True)),
                ('updated_by', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='cards_user_id', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
