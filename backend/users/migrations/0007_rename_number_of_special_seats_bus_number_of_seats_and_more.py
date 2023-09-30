# Generated by Django 4.2.5 on 2023-09-30 11:05

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0006_userregistration'),
    ]

    operations = [
        migrations.RenameField(
            model_name='bus',
            old_name='number_of_special_seats',
            new_name='number_of_seats',
        ),
        migrations.RenameField(
            model_name='bustype',
            old_name='number_of_special_seats',
            new_name='number_of_seats',
        ),
        migrations.RemoveField(
            model_name='user',
            name='is_disabled',
        ),
        migrations.RemoveField(
            model_name='userregistration',
            name='is_disabled',
        ),
    ]