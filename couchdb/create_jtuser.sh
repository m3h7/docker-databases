#!/usr/bin/env bash
# Creates an user, change password before execution!!

curl -X PUT http://admin:adminpassword@localhost:5984/_users/org.couchdb.user:user \
     -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -d '{"name": "user", "password": "userpassword", "roles": [], "type": "user"}'
