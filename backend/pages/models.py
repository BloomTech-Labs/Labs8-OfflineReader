from django.db import models
import datetime


class Article(models.Model):
    # django adds an auto incrementing id field by default - id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=128, blank=True, null=True)
    author = models.CharField(max_length=128, blank=True, null=True)
    normal_url = models.TextField(blank=True, null=True)
    resolved_url = models.TextField(blank=True, null=True)
    date_saved = models.DateField(default=datetime.date.today)
    date_published = models.DateTimeField(blank=True, null=True)
    excerpt = models.TextField(blank=True, null=True)
    cover_image = models.TextField(blank=True, null=True)
    tags = models.CharField(max_length=128, blank=True, null=True)
    text = models.TextField(blank=True, null=True)
