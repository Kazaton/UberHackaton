# Generated by Django 4.2.5 on 2023-09-19 17:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_bustype_bus'),
    ]

    operations = [
        migrations.AddField(
            model_name='bus',
            name='number_of_special_seats',
            field=models.PositiveIntegerField(default=0),
        ),
        migrations.AddField(
            model_name='bustype',
            name='number_of_special_seats',
            field=models.PositiveIntegerField(default=0),
        ),
    ]
