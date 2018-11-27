import requests
from bs4 import BeautifulSoup

url = "https://medium.com/front-end-hacking/less-is-more-time-to-decorate-your-code-7c7ab670b509"

page = requests.get(url)

soup = BeautifulSoup(page.text, 'html.parser')

p_tags = soup.find_all("p")

content = ""

for p_tag in p_tags:
    content += (p_tag.text + " ")
