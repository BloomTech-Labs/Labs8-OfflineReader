from newspaper import Article
import requests
from django.http import JsonResponse
from project.settings import API_BASE_URL


def scrape_youtube(url, auth=None):
        headers = {"authorization": auth}
        embed_link = url.replace("watch?v=", "embed/")
        a = Article(url)
        a.download()
        a.parse()
        title = a.title
        r = requests.post(API_BASE_URL + 'pages/',
                          json={'title': title, 'normal_url': url}, headers=headers)
        new_art = r.json()
        return JsonResponse(new_art, status=201)
