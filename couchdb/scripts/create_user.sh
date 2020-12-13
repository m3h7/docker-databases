#!/usr/bin/env bash
# Creates an user, change password before execution!!

curl -X PUT http://admin:nimda@localhost:5984/_users/org.couchdb.user:user1 \
     -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -d '{"name": "user1", "password": "user1pw", "roles": [], "type": "user"}'
