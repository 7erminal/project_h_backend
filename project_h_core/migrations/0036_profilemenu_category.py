# Generated by Django 3.1.6 on 2023-09-12 10:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('project_h_core', '0035_profilemenu_to_path'),
    ]

    operations = [
        migrations.AddField(
            model_name='profilemenu',
            name='category',
            field=models.CharField(blank=True, max_length=40, null=True),
        ),
    ]
