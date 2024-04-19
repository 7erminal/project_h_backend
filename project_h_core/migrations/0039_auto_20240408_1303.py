# Generated by Django 3.1.6 on 2024-04-08 13:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('project_h_core', '0038_applicationproperties'),
    ]

    operations = [
        migrations.CreateModel(
            name='Currencies',
            fields=[
                ('currency_id', models.AutoField(primary_key=True, serialize=False)),
                ('currency_name', models.CharField(max_length=150)),
                ('currency_symbol', models.CharField(max_length=5)),
                ('active', models.BooleanField(default=1)),
                ('created_by', models.IntegerField(blank=True, null=True)),
                ('updated_by', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.AddField(
            model_name='hosted_service',
            name='charge_currency',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='hosted_service_currency_id', to='project_h_core.currencies'),
        ),
    ]