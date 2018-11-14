from rest_framework import serializers, viewsets
from .models import Article


class ArticleSerializer(serializers.ModelSerializer):

    class Meta:
        model = Article
        fields = ('title')

class ArticleViewSet(viewsets.ModelViewSet):
    serializers_class = ArticleSerializer
    queryset = Article.objects.all()