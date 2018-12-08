from bs4 import BeautifulSoup
import requests
import re

remove_classes = ["credit", "caption-wrap",
                  "enlargelink", "avatar", "avatar-image", "storytitle", "off-screen"]


def remove_content(content):
    content = remove_tags(content)
    content = remove_empty(content)
#     content = remove_whitespace(content)
    return content


# Remove unwanted tags by class
def remove_tags(content):
    for clss in remove_classes:
        for tag in content(attrs={"class": clss}):
            tag.decompose()

    return content


# Remove empty strings
def remove_empty(content):
    [x.decompose() for x in content.findAll(lambda tag: (not tag.contents or len(
        tag.get_text(strip=True)) <= 0) and not tag.name == 'br')]
    return content


# TODO: Remove and replace whitespace
def remove_whitespace(content):
    divs = content.find_all('div')
    for div in divs:
        content = ''.join([div.find('p').text.replace('\n', '')
                           for div in divs])
    print(content)
    return content
