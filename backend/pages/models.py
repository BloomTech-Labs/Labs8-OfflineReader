from django.db import models
from django import forms
# from django.contrib.auth.models import AbstractUser
from django.utils import timezone
from users.models import CustomUser


class Article(models.Model):
    # django adds an auto incrementing id field by default - id = models.AutoField(primary_key=True)
    # #title and user are required fields
    # user became user_id in postgres.
    user_id = models.ForeignKey(CustomUser, db_column='user_id', on_delete=models.CASCADE)
    title = models.CharField(max_length=512)
    author = models.CharField(max_length=512, default='')
    normal_url = models.URLField(max_length=512, blank=True, null=True, default='')
    resolved_url = models.URLField(max_length=512, blank=True, null=True, default='')
    date_saved = models.DateTimeField(default=timezone.now) 
    date_published = models.TextField(blank=True, null=True, default='')
    # might not need excerpt field since list view currently generates some part of the text field. Unless we want to get rid of text later.
    excerpt = models.TextField(blank=True, null=True, default='')
    cover_image = models.TextField(blank=True, null=True, default='')
    # embedded url for videos and audios
    video = models.TextField(blank=True, null=True, default='')
    audio = models.TextField(blank=True, null=True, default='')
    html = models.TextField(blank=True, null=True, default='')
    images = models.TextField(blank=True, null=True, default='')
    text = models.TextField(blank=True, null=True)
