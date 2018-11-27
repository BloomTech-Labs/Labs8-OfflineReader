import requests
from bs4 import BeautifulSoup

url = "https://medium.com/front-end-hacking/the-power-of-redux-and-react-lazy-bdeb21028f43"

page = requests.get(url)

soup = BeautifulSoup(page.text, 'html.parser')

title_tag = soup.find("h1")
p_tags = soup.find_all("p")
title = title_tag.text

content = ""

for p_tag in p_tags:
    content += (p_tag.text + " ")

headers = {"authorization": "Token a8a5c3cc97a95105370c08b0dabd01be261e951c"}

r = requests.post('https://radiant-harbor-75417.herokuapp.com/api/users/pages/',
                  data={'title': title}, headers=headers)

# r = requests.post('http://127.0.0.1:8000/api/users/pages/',
#                   data={'title': title}, headers=headers)
