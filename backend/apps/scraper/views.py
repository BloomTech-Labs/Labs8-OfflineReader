from django.shortcuts import render
from django.http import HttpResponse
from rest_framework.views import APIView
from .newspaper_scraper import scrape_article


class Scrape(APIView):

    def post(self, request, *args, **kwargs):
        # print(request.data.get('url'))
        # print(request.data.get(key, default=None))
        url = request.data.get('url')
        print(url)
        scrape_article(request.data.get(str(url)))
        return HttpResponse()
