from rest_framework.views import APIView
from django.http import JsonResponse
import requests
from project.settings import API_BASE_URL, DJANGO_AUTH_FACEBOOK_CLIENT_ID, DJANGO_AUTH_FACEBOOK_CLIENT_SECRET


class convert(APIView):
    permission_classes = ()

    def post(self, request, *args, **kwargs):
        access_token = request.data.get('token')
        return convert_token(access_token)


# FIXME: Calling this view generates a stacktrace with the error "ConnectionAbortedError: [WinError 10053] An established connection was aborted by the software in your host machine", but otherwise works as expected.
class revoke(APIView):
    permission_classes = ()

    def post(self, request, *args, **kwargs):
        access_token = request.data.get('token')
        return revoke_token(access_token)


def convert_token(access_token):
    r = requests.post(API_BASE_URL + 'auth/social/convert-token/', json={"grant_type": "convert_token", "client_id": DJANGO_AUTH_FACEBOOK_CLIENT_ID, "client_secret": DJANGO_AUTH_FACEBOOK_CLIENT_SECRET, "backend": "facebook", "token": access_token})

    return JsonResponse(r.json(), status=200)


def revoke_token(access_token):
    r = requests.post(API_BASE_URL + 'auth/social/revoke-token/', json={"client_id": DJANGO_AUTH_FACEBOOK_CLIENT_ID, "client_secret": DJANGO_AUTH_FACEBOOK_CLIENT_SECRET, "token": access_token})

    if r.status_code == 204:
        return JsonResponse({"message": "Successfully logged out!"}, status=200)
    else:
        return JsonResponse(r.json(), status=500)
