from django.db import models
from django import forms
import datetime


class Article(models.Model):
    # django adds an auto incrementing id field by default - id = models.AutoField(primary_key=True)
    #title is the only required field
    title = models.CharField(max_length=500)
    author = models.CharField(max_length=500, default='')
    normal_url = models.URLField(max_length=500, blank=True, null=True, default='')
    resolved_url = models.URLField(blank=True, null=True, default='')
    date_saved = models.TextField(blank=True, null=True, default='')
    # date_saved = models.DateField(auto_now_add=True, default=datetime.now) - in case this needs to be modified from a TextField to a DateField later.
    date_published = models.TextField(blank=True, null=True, default='')
    excerpt = models.TextField(blank=True, null=True, default='')
    cover_image = models.TextField(blank=True, null=True, default='')
    tags = models.CharField(max_length=128, blank=True, null=True, default='')
    text = models.TextField(blank=True, null=True)
