from rest_framework import serializers, viewsets
from .models import Article


class ArticleSerializer(serializers.ModelSerializer):

    class Meta:
        model = Article
        fields = ('title')

class ArticleViewSet(viewsets.ModelViewSet):
    serializers_class = ArticleSerializer
    # filter result by user
    def get_queryset(self):
        user = self.request.user

        if user.is_anonymous:
            return Article.objects.none()
        else:
            return Article.objects.filter(user=user)