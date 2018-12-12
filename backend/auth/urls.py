from django.urls import include, path
from . import views

urlpatterns = [
    path('rest/', include('rest_auth.urls')),
    path('rest/registration/', include('rest_auth.registration.urls')),
    path('social/', include('rest_framework_social_oauth2.urls')),
    path('convert_token/', views.convert.as_view()),
    path('revoke_token/', views.revoke.as_view())
]
