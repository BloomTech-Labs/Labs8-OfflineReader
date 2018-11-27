from django.db import models


class Article(models.Model):
    # django adds an auto incrementing id field by default - id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=128)
    author = models.CharField(max_length=128)
    normal_url = models.TextField()
    resolved_url = models.TextField(blank=True, null=True)
    date_saved = models.DateTimeField(auto_now_add=True)
    date_published = models.DateTimeField(blank=True, null=True)
    excerpt = models.TextField(blank=True, null=True)
    cover_image = models.TextField()
    tags = models.CharField(max_length=128)
    text = models.TextField()
