#!/bin/bash

curl "http://localhost:4741/forecasts" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --data '{
    "location": {
      "lat": "'"${LAT}"'",
      "long": "'"${LONG}"'"
    }
  }'

echo
