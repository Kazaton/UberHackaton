# Generated by Django 4.2.5 on 2023-09-30 11:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0007_rename_number_of_special_seats_bus_number_of_seats_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='SeatReason',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('reason', models.CharField(max_length=100)),
                ('priority', models.PositiveIntegerField()),
            ],
        ),
        migrations.AddField(
            model_name='userregistration',
            name='seat_reason',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='users.seatreason'),
        ),
    ]