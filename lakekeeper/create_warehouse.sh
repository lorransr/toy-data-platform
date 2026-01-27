#!/bin/sh
set -eux

for fname in raw trusted refined; do
  echo "POSTING ${fname}.json"
  curl -w "%{http_code}" -X POST -v \
    http://lakekeeper:8181/management/v1/warehouse \
    -H "Content-Type: application/json" \
    --data "@/home/curl_user/${fname}.json" \
    -o /dev/null
done
