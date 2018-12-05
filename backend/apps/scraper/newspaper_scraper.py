from newspaper import Article
import requests
from django.http import JsonResponse
from bs4 import BeautifulSoup
from .remove_list import remove_tags
from project.settings import API_BASE_URL


def insert_top_image(content, a):
    top_image = content.new_tag("img", src=a.top_image, alt="")
    # If h1 title tag is inside a p tag it will add the top_image after the p tag instead of inside the p tag
    if content.find('h1', text=a.title).parent.name == 'p':
        content.find(
            'h1', text=a.title).parent.insert_after(top_image)
    else:
        content.find('h1', text=a.title).insert_after(top_image)
    return content


def scrape_article(url, auth):
    headers = {"authorization": auth}
    a = Article(url, keep_article_html=True)
    a.download()
    a.parse()
    # This grabs the HTML of the body of the article using the Newspaper Library. Quickest fix versus trying to write own algorithm to find article body
    article_body = a.article_html

    # Parses the article_body so we can use with BeautifulSoup to manipulate
    page_content = BeautifulSoup(article_body, "html.parser")

    # Removes uneccessary tags with specific classes
    page_content = remove_tags(page_content)

    # If no images in article body it will attempt to find and insert top_image in appropriate place. This is a current solution to try and prevent duplicating an image from the article body as the top_image. Doing it this way because Top_img gives different src vs src of first image in article body. Can use improvement.
    if not page_content.find("img"):
        insert_top_image(page_content, a)

    # Turns beautifulsoup obj into a string
    content = str(page_content)

    # Makes request to endpoint
    r = requests.post(API_BASE_URL + 'pages/',
                      json={'title': a.title, 'cover_image': a.top_image, 'text': content, 'normal_url': url}, headers=headers)

    new_art = r.json()
    return JsonResponse(new_art, status=201)
