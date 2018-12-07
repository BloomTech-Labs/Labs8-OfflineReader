from django.shortcuts import render
from django.http import JsonResponse
from django.core.validators import URLValidator
from django.core.exceptions import ValidationError
from rest_framework.views import APIView
from .newspaper_scraper import scrape_article


class Scrape(APIView):
    # Invoked when POST at api/scrape endpoint
    def post(self, request, *args, **kwargs):
        # Pulls url off request
        url = request.data.get('url')
        val = URLValidator()
        # Validate URL
        try:
            val(url)
        except ValidationError as e:

            # Turns error into string that can be put into JSON
            error = ''.join(e)
            # Return JSON response back to client with message
            return JsonResponse({"message": error}, status=422)
        # Gets token and sets header
        # auth = "Token " + str(request.auth)
        # Switch auth to this for JWT
        auth = request.META.get('HTTP_AUTHORIZATION')

        return scrape_article(url, auth)
