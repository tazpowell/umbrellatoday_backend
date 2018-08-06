#!/bin/bash

curl "http://localhost:4741/locations" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
