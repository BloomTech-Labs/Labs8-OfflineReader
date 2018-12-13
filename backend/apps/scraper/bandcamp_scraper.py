from newspaper import Article
from bs4 import BeautifulSoup
import requests
from django.http import JsonResponse
from project.settings import API_BASE_URL


# TODO Update how to grab HTML. Need to look into retrieving HTML loaded with JavaScript.
def scrape_bandcamp(url, auth, user_id):
    headers = {"authorization": auth}
    a = Article(url)
    a.download()
    a.parse()
    # Grab title of bandcamp audio
    title = a.title
    page = requests.get(url)
    soup = BeautifulSoup(page.text, 'html.parser')
    metas = soup.find_all('meta')
    for meta in metas:
        if 'https://bandcamp.com/EmbeddedPlayer/' in meta['content']:
            source = meta['content']
            break
        else:
            continue

    iframe = create_iframe_tag(source)

    r = requests.post(API_BASE_URL + 'api/pages/',
                      json={'title': title, 'normal_url': url, 'audio': source, 'html': iframe, 'user_id': user_id}, headers=headers)
    new_art = r.json()
    return JsonResponse(new_art, status=201)


# See todo above. In future find iframe instead of create
def create_iframe_tag(source):
    iframe = '<iframe src="%s" width="400" height="300" border="0" scrolling="no" frameborder="0" ></iframe>' % (
        source)
    return iframe
