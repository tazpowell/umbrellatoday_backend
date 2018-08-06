#!/bin/bash

curl "http://localhost:4741/locations/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}" \

echo
