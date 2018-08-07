#!/bin/bash

curl "http://localhost:4741/forecasts" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --data '{
    "location": {
      "lat": "'"42.358430"'",
      "long": "'"-71.059770"'"
    }
  }'

echo
