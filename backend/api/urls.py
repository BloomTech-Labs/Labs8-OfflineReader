from django.urls import include, path
from django.conf.urls import url, include

from . import views

urlpatterns = [
    path('users/', include('users.urls')),
    url(r'^rest-auth/', include('rest_auth.urls')),
    url(r'^rest-auth/registration/', include('rest_auth.registration.urls')),
    url(r'^rest-auth/facebook/$', views.FacebookLogin.as_view(), name='fb_login'),
]
