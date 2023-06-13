# Generated by Django 3.1.6 on 2023-05-14 17:57

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('project_h_core', '0025_services_sub_categories_option_for'),
    ]

    operations = [
        migrations.CreateModel(
            name='RequestNotice',
            fields=[
                ('request_notice_id', models.AutoField(primary_key=True, serialize=False)),
                ('preferences', models.CharField(blank=True, max_length=255, null=True)),
                ('key_words', models.CharField(blank=True, max_length=255, null=True)),
                ('location', models.CharField(blank=True, max_length=100, null=True)),
                ('served', models.IntegerField(default=0)),
                ('active', models.BooleanField(default=1)),
                ('updated_by', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='request_notice_category', to='project_h_core.services')),
                ('created_by', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='request_notice_user', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
