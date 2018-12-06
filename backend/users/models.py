from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils import timezone


class CustomUser(AbstractUser):
    name = models.CharField(blank=True, max_length=255)
    premium = models.DateTimeField(default='1970-01-01 00:00:00')

    def __str__(self):
        return self.email
