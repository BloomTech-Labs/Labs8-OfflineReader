from django.shortcuts import render
from rest_framework import generics
from .models import Article
from .serializers import ArticleSerializer

class ArticleList(generics.ListCreateAPIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer

    def get_queryset(self):
        user = self.request.user
        if user.is_anonymous:
            return Article.objects.none()
        else:
            return Article.objects.filter(user_id=user)


class ArticleDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer
