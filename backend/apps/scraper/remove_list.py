from bs4 import BeautifulSoup
import requests

remove_classes = ["credit", "caption-wrap",
                  "enlargelink", "avatar", "avatar-image"]


def remove_tags(content):
    for clss in remove_classes:
        for remove in content(attrs={"class": clss}):
            remove.decompose()

    return content
