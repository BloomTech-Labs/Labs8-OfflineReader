from newspaper import Article
import requests
from django.http import JsonResponse
from project.settings import API_BASE_URL


def scrape_article(url, auth):
    headers = {"authorization": auth}
    a = Article(url)
    a.download()
    a.parse()
    # New: user_id
    r = requests.post(API_BASE_URL + 'api/pages/',
                      json={'title': a.title, 'cover_image': a.top_image, 'text': a.text, 'normal_url': url, 'user_id': 1}, headers=headers)

    new_art = r.json()
    return JsonResponse(new_art, status=201)
