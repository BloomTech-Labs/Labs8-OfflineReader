from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from pages import views

urlpatterns = [
    path('pages/', views.ArticleList.as_view()),
    path('pages/<int:pk>/', views.ArticleDetail.as_view()),
]

urlpatterns = format_suffix_patterns(urlpatterns)
