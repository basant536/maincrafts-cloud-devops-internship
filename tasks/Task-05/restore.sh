#!/bin/bash
set -e
cd "$(dirname "$0")"
source .env

if [ -z "$1" ]; then
  echo "Usage: ./restore.sh backups/db_YYYY-MM-DD_HH-MM-SS.sql.gz"
  exit 1
fi

gunzip -c "$1" | docker compose exec -T postgres psql -U "$DB_USER" -d "$DB_NAME"
echo "Restore complete from $1"