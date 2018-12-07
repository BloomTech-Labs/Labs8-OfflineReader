from django.shortcuts import render
from django.http import JsonResponse
from django.core.validators import URLValidator
from django.core.exceptions import ValidationError
from rest_framework.views import APIView
from .newspaper_scraper import scrape_article


class Scrape(APIView):
    # New
    def get_userid(self):
        user = self.request.user
        # print(user)
        if user.is_anonymous:
            # return Article.objects.none()
            return None
        else:
            # return Article.objects.filter(user_id=user)
            return user
    # End New

    # Invoked when POST at api/scrape endpoint
    def post(self, request, *args, **kwargs):
        # New
        get_user_id = get_userid()
        print(get_user_id)
        # End New

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
