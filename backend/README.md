# Endpoints

### /admin

Admin Panel

### /auth/rest/login/

POST
`{ "username": "", "email": "", "password": "" }`
returns:
`{ "key": "some-string" }`

### /auth/rest/logout/

GET
Logouts current user

### /auth/rest/user/

GET
`{"pk": 1, "username": "", "email": "", "first_name": "", "last_name": ""}`
List the current logged in user

### /auth/rest/registration/

POST
`{ "username": "", "email": "", "password1": "", "password2": "" }`
registers and logins user
returns:
`{ "key": "some-string" }`

### /api/users/

GET
Returns list of users

### /api/pages/

GET
`[{ "id": 1, "title": "", "author": "", "normal_url": "", "resolved_url": "", "date_saved": "", "date_published": "", "excerpt": "", "cover_image": "", "video": "", "audio": "", "html":"", "images": "", "text": "", "user": 1 }]`
Returning a list of objects for each article that are in the database.
User is a foreign key indicating which user saves the article.

POST
`{ "id": 1, "title": "", "author": "", "normal_url": "", "resolved_url": "", "date_saved": "", "date_published": "", "excerpt": "", "cover_image": "", "video": "", "audio": "", "html":"", "images": "", "text": "", "user": 1 }`
Adding an article.

- `id` is auto generated.
- `title` and `user` are required fields.
- `date_saved` is default to today's date. No input necessary. Format is YYYY-MM-DDT00:00:00.000000Z.

### /api/pages/<int:id>/

`<int:id>` is an integer id number auto incremented by the database.
Actual url should look like this `/api/users/pages/1/`

GET
`{ "id": 1, "title": "", "author": "", "normal_url": "", "resolved_url": "", "date_saved": "", "date_published": "", "excerpt": "", "cover_image": "", "tags": "", "text": "" }`
Returning a detail object of the targeted article.

PUT
Edit an existing article. `title` is required.

DELETE
Delete and existing article.

### /api/payments/create-charge

Stripe payment endpoint.
