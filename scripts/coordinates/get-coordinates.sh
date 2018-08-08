#!/bin/bash

curl "http://localhost:4741/coordinates" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --data '{
    "query": {
      "name": "'"${NAME}"'",
      "region": "'"${REGION}"'"
    }
  }'

echo
