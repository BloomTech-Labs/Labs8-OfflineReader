from newspaper import Article
import requests
from django.http import JsonResponse
from project.settings import API_BASE_URL


def scrape_article(url, auth):
    headers = {"authorization": auth}
    a = Article(url)
    a.download()
    a.parse()

    r = requests.post(API_BASE_URL + 'pages/',
                      json={'title': a.title, 'cover_image': a.top_image, 'text': a.text, 'normal_url': url, 'date_published': a.publish_date}, headers=headers)

    new_art = r.json()
    return JsonResponse(new_art, status=201)
