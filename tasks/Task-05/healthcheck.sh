#!/bin/bash
URL="${1:-http://localhost}"

for path in /health /api/health; do
  code=$(curl -s -o /dev/null -w "%{http_code}" "$URL$path")
  if [ "$code" != "200" ]; then
    echo "FAIL: $URL$path returned $code"
    exit 1
  fi
  echo "OK: $URL$path"
done