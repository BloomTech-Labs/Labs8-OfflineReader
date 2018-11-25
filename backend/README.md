# Endpoints

### /admin

Admin Panel

### /api/users/

GET
Returns list of users

### /api/rest-auth/login/

POST
`{ "username": "", "email": "", "password": "" }`
returns:
`{ "key": "some-string" }`

### /api/rest-auth/logout/

GET
Logouts current user

### /api/rest-auth/registration/

POST
`{ "username": "", "email": "", "password1": "", "password2": "" }`
registers and logins user
returns:
`{ "key": "some-string" }`

### /api/users/pages/

GET
`{ "title": ""}
Returns a list of articles

POST
`{ "title": ""}
Adding an article
