from newspaper import Article
import requests


def scrape_article(url, auth):
    headers = {"authorization": auth}
    a = Article(url)
    a.download()
    a.parse()
# Endpoint needs to be change for dev server
    r = requests.post('http://127.0.0.1:8000/api/users/pages/',
                      data={'title': a.title}, headers=headers)

    return
