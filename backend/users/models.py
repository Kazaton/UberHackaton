from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.utils.translation import gettext_lazy as _


class UserManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, phone, password, **extra_fields):
        # Create and save user using password and phone
        if not phone:
            raise ValueError("The given phone number must be set")
        user = self.model(phone=phone, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, phone, password=None, **extra_fields):
        # Create default user with permissions
        extra_fields.setdefault("is_staff", False)
        extra_fields.setdefault("is_superuser", False)
        return self._create_user(phone, password, **extra_fields)

    def create_superuser(self, phone, password, **extra_fields):  # Create admin
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)

        if extra_fields.get("is_staff") is not True:
            raise ValueError("Superuser must have is_staff=True.")
        if extra_fields.get("is_superuser") is not True:
            raise ValueError("Superuser must have is_superuser=True.")

        return self._create_user(phone, password, **extra_fields)


class User(AbstractUser):
    phone = models.CharField(unique=True, max_length=30)
    username = None
    USERNAME_FIELD = (
        "phone"  # setting phone number as a username field when we login/register
    )
    REQUIRED_FIELDS = []
    objects = UserManager()


class BusType(models.Model):
    name = models.CharField(max_length=30)
    # Capacity of the bus' model
    number_of_people = models.PositiveIntegerField(default=0)
    number_of_seats = models.PositiveIntegerField(default=0)

    def __str__(self):
        return str(self.name)


class Bus(models.Model):
    name = models.CharField(max_length=5)
    # Number of people and special seats (for disabled individuals) in the bus currently
    number_of_people = models.PositiveIntegerField(default=0)
    number_of_seats = models.PositiveIntegerField(default=0)
    bus_type = models.ForeignKey(BusType, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.name)

class SeatReason(models.Model):
    reason = models.CharField(max_length=100)
    priority = models.PositiveIntegerField()

    def __str__(self):
        return self.reason

class UserRegistration(models.Model):
    # Linking user and bus within model
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    bus = models.ForeignKey(Bus, on_delete=models.CASCADE)
    seat_reason = models.ForeignKey(SeatReason, on_delete=models.SET_NULL, null=True, blank=True)
    
    def __str__(self):
        return f"{self.user.username} - {self.bus.name}"