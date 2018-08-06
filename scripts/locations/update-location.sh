#!/bin/bash

curl "http://localhost:4741/locations/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "location": {
      "name": "'"${NAME}"'",
      "default": "'"${DEFAULT}"'"
    }
  }'

echo
