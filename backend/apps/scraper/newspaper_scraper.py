from newspaper import Article
import requests
from django.http import HttpResponse, JsonResponse
from pages.serializers import ArticleSerializer
from project.settings import API_BASE_URL


def scrape_article(url, auth):
    headers = {"authorization": auth}
    a = Article(url)
    a.download()
    a.parse()

    r = requests.post(API_BASE_URL + 'pages/',
                      json={'title': a.title}, headers=headers)

    new_art = r.json()
    return JsonResponse(new_art, status=201)
