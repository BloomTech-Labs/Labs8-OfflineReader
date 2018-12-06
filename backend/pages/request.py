import requests
from project.settings import API_BASE_URL
from .models import Article
from django.http import JsonResponse
# from users.models import CustomUser

# def article_user(auth):
#   headers = {"authorization": auth}
#   r = requests.get(API_BASE_URL + 'auth/rest/user/', headers=headers)
#   return JsonResponse(r.json(), status=200)
# ^Returns the following:
# {
#     "pk": 1,
#     "username": "user1",
#     "email": "user1@test.com",
#     "first_name": "",
#     "last_name": ""
# }

def article_user(auth):
  headers = {"authorization": auth}
  r = requests.get(API_BASE_URL + 'auth/rest/user/', headers=headers)
  return JsonResponse(r.json(), status=200)


# def article_user(auth):
#   headers = {"authorization": auth}
#   r = requests.get(API_BASE_URL + 'auth/rest/user/', headers=headers)
#   userid = r['pk']
#   articleobj = Article.objects.values_list('user_id', flat=True).filter(user_id=userid)
#   return JsonResponse(articleobj.json(), status=200)

