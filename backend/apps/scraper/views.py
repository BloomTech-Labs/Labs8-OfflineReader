from django.shortcuts import render
from django.http import HttpResponse
from django.core.validators import URLValidator
from django.core.exceptions import ValidationError
from rest_framework.views import APIView
from .newspaper_scraper import scrape_article


class Scrape(APIView):
    # Invoked when POST at api/scrape endpoint
    def post(self, request, *args, **kwargs):
        # Pulls url off request
        url = request.data.get('url')
        val = URLValidator(verify_exists=True)
        # Validate URL
        try:
            val(url)
        except ValidationError:
            # Still needs to be updated
            print("error")
        # Gets token and sets header
        auth = "Token " + str(request.auth)

        scrape_article(url, auth)
        return HttpResponse()
