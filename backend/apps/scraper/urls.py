from django.urls import path

from . import views

urlpatterns = [
    path('', views.Scrape.as_view()),
]
