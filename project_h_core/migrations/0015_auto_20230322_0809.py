# Generated by Django 3.1.6 on 2023-03-22 08:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project_h_core', '0014_auto_20230321_2341'),
    ]

    operations = [
        migrations.AddField(
            model_name='hosted_service',
            name='service_sub',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='hosted_service',
            name='service_sub_selected_fields',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
