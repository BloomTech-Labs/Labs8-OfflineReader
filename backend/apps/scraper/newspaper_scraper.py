from newspaper import Article
import requests
from django.http import HttpResponse, JsonResponse
from pages.serializers import ArticleSerializer
from decouple import config


def scrape_article(url, auth):
    headers = {"authorization": auth}
    a = Article(url)
    a.download()
    a.parse()
# Endpoint needs to be change for dev server
    r = requests.post('http://127.0.0.1:8000/pages/',
                      json={'title': a.title}, headers=headers)

    new_art = r.json()
    return JsonResponse(new_art, status=201)
