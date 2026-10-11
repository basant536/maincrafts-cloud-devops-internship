#!/bin/bash
set -e
cd "$(dirname "$0")"

PREV_COMMIT=$(git rev-parse HEAD)

echo "Pulling latest code..."
git pull

echo "Taking backup before deploy..."
./backup.sh

echo "Building images..."
docker compose build

echo "Rolling restart..."
docker compose up -d --remove-orphans

echo "Waiting for services..."
sleep 20

if ./healthcheck.sh; then
  echo "Deployment successful"
else
  echo "Health check FAILED, rolling back to $PREV_COMMIT"
  git checkout "$PREV_COMMIT"
  docker compose up -d --build
  exit 1
fi