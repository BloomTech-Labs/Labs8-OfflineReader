from django.shortcuts import render
from django.http import HttpResponse
from rest_framework.views import APIView
from .newspaper_scraper import scrape_article


class Scrape(APIView):
    # Invoked when POST at api/scrape endpoint
    def post(self, request, *args, **kwargs):
        # Pulls url off request
        url = request.data.get('url')
        # Gets token and sets header
        auth = "Token " + "e5f6efffdaf49d83381c94a7a322266e77013428"
        # auth = "Token " + str(request.auth)

        scrape_article(url, auth)
        return HttpResponse()
