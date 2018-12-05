from django.db import models
from django import forms
import datetime # for DateField
# from django.contrib.auth.models import User - to add user as FK later


class Article(models.Model):
    # django adds an auto incrementing id field by default - id = models.AutoField(primary_key=True)
    #title is the only required field
    # TODO: user = models.ForeignKey(User)
    title = models.CharField(max_length=500)
    author = models.CharField(max_length=500, default='')
    normal_url = models.URLField(max_length=500, blank=True, null=True, default='')
    resolved_url = models.URLField(blank=True, null=True, default='')
    date_saved = models.DateField(default=datetime.date.today) 
    date_published = models.TextField(blank=True, null=True, default='')
    # might not need excerpt field since list view currently generates some part of the text field. Unless we want to get rid of text later.
    excerpt = models.TextField(blank=True, null=True, default='')
    cover_image = models.TextField(blank=True, null=True, default='')
    # embedded url for videos and audios
    video = models.TextField(blank=True, null=True, default='')
    audio = models.TextField(blank=True, null=True, default='')
    tags = models.CharField(max_length=128, blank=True, null=True, default='')
    text = models.TextField(blank=True, null=True)
