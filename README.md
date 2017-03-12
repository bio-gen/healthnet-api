# Healthnet API [![Build Status](https://travis-ci.org/bio-gen/healthnet-api.svg?branch=master)](https://travis-ci.org/bio-gen/healthnet-api)

## Authenticating to the API

The API uses [JSON Web Tokens (JWT)](https://jwt.io/) for authentication. To authenticate to the API, send a request like the following:

`curl -X POST -d email="a@a.com" -d password="changeme" http://api.healthnet:3000/auth_user`

If successful, you will then receive a valid token to use in subsequent requests:

```
{"auth_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.po9twTrX99V7XgAk5mVskkiq8aa0lpYOue62ehubRY4","user":{"id":1,"email":"a@a.com"}}
```