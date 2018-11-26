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
`{ "title": ""}`
Currently returning a list of titles of all the articles that are in the database.
This will be updated once data structure is in place.

POST
`{ "title": ""}`
Adding an article.
This will be updated once data structure is in place.
