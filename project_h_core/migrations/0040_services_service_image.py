# Generated by Django 3.1.6 on 2024-05-09 20:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project_h_core', '0039_auto_20240408_1303'),
    ]

    operations = [
        migrations.AddField(
            model_name='services',
            name='service_image',
            field=models.CharField(blank=True, max_length=255, null=True),
        ),
    ]
