from newspaper import Article
from bs4 import BeautifulSoup
import requests
from django.http import JsonResponse
from project.settings import API_BASE_URL


# TODO Update how to grab HTML. Need to look into retrieving HTML loaded with JavaScript.
def scrape_youtube(url, auth, user_id):
    headers = {"authorization": auth}
    # creates embed link based off youtube URL. To be more robust see comment above.
    embed_link = url.replace("watch?v=", "embed/")
    a = Article(url)
    a.download()
    a.parse()
    # Grab title of youtube video
    title = a.title

    iframe = create_iframe_tag(embed_link)

    r = requests.post(API_BASE_URL + 'api/pages/',
                      json={'title': title, 'normal_url': url, 'video': embed_link, 'html': iframe, 'user_id': user_id}, headers=headers)
    new_art = r.json()
    return JsonResponse(new_art, status=201)


# See todo above. In future find iframe instead of create
def create_iframe_tag(embed_link):
    iframe = '<iframe width="560" height="315" src="%s" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>' % (
        embed_link)
    return iframe
