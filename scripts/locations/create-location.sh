#!/bin/bash

curl "http://localhost:4741/locations" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "location": {
      "name": "'"${NAME}"'",
      "lat": "'"${LAT}"'",
      "long": "'"${LONG}"'",
      "default": "'"${DEFAULT}"'"
    }
  }'

echo