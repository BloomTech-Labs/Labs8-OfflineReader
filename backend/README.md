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

### /pages/

GET
`[{ "id": 1, "title": "", "author": "", "normal_url": "", "resolved_url": "", "date_saved": "", "date_published": "", "excerpt": "", "cover_image": "", "tags": "", "text": "" }]`
Returning a list of objects for each article that are in the database.

POST
`{ "id": 1, "title": "", "author": "", "normal_url": "", "resolved_url": "", "date_saved": "", "date_published": "", "excerpt": "", "cover_image": "", "tags": "", "text": "" },`
Adding an article. `id` is auto generated. Only `title` is required.

### /pages/<int:id>/

`<int:id>` is an integer id number auto incremented by the database.

GET
`{ "id": 1, "title": "", "author": "", "normal_url": "", "resolved_url": "", "date_saved": "", "date_published": "", "excerpt": "", "cover_image": "", "tags": "", "text": "" }`
Returning a detail object of the targeted article.

PUT
Edit an existing article. `title` is required.

DELETE
Delete and existing article.
