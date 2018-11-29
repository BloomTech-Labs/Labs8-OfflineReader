from newspaper import Article
import requests


def scrape_article(url, auth):
    headers = {"authorization": auth}
    a = Article(url)
    a.download()
    a.parse()
# Endpoint needs to be change for dev server
    r = requests.post('https://anywhere-reader-test.herokuapp.com/pages/',
                      data={'title': a.title, 'cover_image': a.top_image, 'text': a.text}, headers=headers)

    return