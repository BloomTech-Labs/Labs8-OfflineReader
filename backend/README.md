# Endpoints

### /admin

Admin Panel

### /api/users/

GET
Returns list of users

### /api/rest-auth/login/

POST
`{ "username": "", "password": "" }`
returns:
`{ "key": "some-string" }`

### /api/rest-auth/logout/

Deletes token
POST
Header
Authorization: "Token key"

### /api/rest-auth/registration/

POST
`{ "username": "", "email": "", "password1": "", "password2": "" }`
registers and logins user
returns:
`{ "key": "some-string" }`

### /api/rest-auth/user/

GET
returns
`{ "pk": integer, "username": "", "email": "", "first_name": "", "last_name": "" }`

PUT
Header
Authorization: "Token key"
`{ "username": "", "first_name": "", "last_name": "" }`

### /api/rest-auth/password/change/

POST
Header
Authorization: "Token key"
`{ "new_password1": "", "new_password2": "" }`
Returns the success/fail message
Logout all sessions after password change. Need to look into keeping current session after password change.
