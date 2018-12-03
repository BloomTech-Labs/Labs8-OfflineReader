from django.urls import include, path

urlpatterns = [
    path('users/', include('users.urls')),
    path('pages/', include('pages.urls')),
    path('payments/', include('payments.urls')),
    path('scrape/', include('apps.scraper.urls'))
]
