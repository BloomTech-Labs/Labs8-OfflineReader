from django.urls import path

from .views import checkout

urlpatterns = [
    path('create-charge/', checkout, name="cout"),

]
