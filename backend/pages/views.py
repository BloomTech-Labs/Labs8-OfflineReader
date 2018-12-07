from django.shortcuts import render
from rest_framework import generics
from .models import Article
from .serializers import ArticleSerializer
# from django-rest-auth.views import UserDetailsView # new
# from rest_framework.views import APIView
# from .request import article_user
# from users.models import CustomUser # new

class ArticleList(generics.ListCreateAPIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer


class ArticleDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Article.objects.all()
    serializer_class = ArticleSerializer

# class CurrentUserArticle(APIView):
#     def get(self, request, *args, **kwargs):
#         auth = request.META.get('HTTP_AUTHORIZATION')
#         return article_user(auth)

# class UserArticleList(generics.ListCreateAPIView):
#     queryset = Article.objects.filter(user_id=CurrentUserArticle.objects.values(pk))
#     serializer_class = ArticleSerializer

# class UserArticleList(generics.ListCreateAPIView):
#     queryset = Article.objects.values_list('user_id', flat=True ).filter(user_id=CustomUser.objects.)
#     serializer_class = ArticleSerializer


# class UserArticleDetail(generics.RetrieveUpdateDestroyAPIView):
#     queryset = Article.objects.filter(user=CustomUser.objects.first())
#     serializer_class = ArticleSerializer
