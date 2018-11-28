from newspaper import Article
import requests


def scrape_article(url="https://www.youtube.com/watch?v=SPAmbUZ9UKk", auth="Token 4e252ce5b05cb76e90dca3e450a8b917a14d61bf"):
    headers = {"authorization": auth}
    a = Article(url)

    a.download()
    a.parse()

    print(a.title)
    r = requests.post('http://127.0.0.1:8000/api/users/pages/',
                      data={'title': a.title}, headers=headers)

    return


scrape_article()
