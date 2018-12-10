from rest_framework import serializers, viewsets
from .models import Article


class ArticleSerializer(serializers.ModelSerializer):

    class Meta:
        model = Article
        fields = '__all__'

        def create(self, validated_data):
            user = self.context['request'].user
            article = Article.objects.create(user_id=user, **validated_data)
            return article

class ArticleViewSet(viewsets.ModelViewSet):
    serializers_class = ArticleSerializer
    queryset = Article.objects.none()

