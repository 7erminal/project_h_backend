# Generated by Django 3.1.6 on 2023-03-21 23:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project_h_core', '0012_services_sub_categories_has_subs'),
    ]

    operations = [
        migrations.AddField(
            model_name='services_sub_categories',
            name='display_type',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='services_sub_category_fields',
            name='display_type',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]