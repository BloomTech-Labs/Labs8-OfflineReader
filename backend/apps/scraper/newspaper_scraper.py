from newspaper import Article
import requests
from django.http import JsonResponse
from bs4 import BeautifulSoup
from .remove_list import remove_content
from project.settings import API_BASE_URL


def scrape_article(url, auth):
    headers = {"authorization": auth}
    a = Article(url, keep_article_html=True)
    a.download()
    a.parse()
    # This grabs the HTML of the body of the article using the Newspaper Library. Quickest fix versus trying to write own algorithm to find article body
    article_body = a.article_html

    # Parses the article_body so we can use with BeautifulSoup to manipulate
    page_content = BeautifulSoup(article_body, "html.parser")

    # Removes uneccessary tags
    page_content = remove_content(page_content)

    # Get all images from body of article and return as delineated by comma string
    images = get_images(page_content)

    # If no images in article body it will attempt to find and insert top_image in appropriate place. This is a current solution to try and prevent duplicating an image from the article body as the top_image. Doing it this way because Top_img gives different src vs src of first image in article body. Can use improvement.
    if not page_content.find("img"):
        insert_top_image(page_content, a)

    # Get all text from beautifulsoup object
    text = page_content.get_text()
    # Turns beautifulsoup obj into a string
    html = str(page_content)

    # Makes request to endpoint
    r = requests.post(API_BASE_URL + 'api/users/pages/',
                      json={'title': a.title, 'cover_image': a.top_image, 'normal_url': url, 'html': html, 'text': text, 'images': images}, headers=headers)

    new_art = r.json()
    return JsonResponse(new_art, status=201)


def get_images(content):
    image_list = [x['src'] for x in content.findAll('img')]
    images = ",".join(image_list)
    return images


def insert_top_image(content, a):
    top_image = content.new_tag("img", src=a.top_image, alt="")
    content.insert(0, top_image)
    return content
