#!/bin/bash
set -e
cd "$(dirname "$0")"
source .env

BACKUP_DIR="./backups"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
FILE="$BACKUP_DIR/db_$TIMESTAMP.sql.gz"

mkdir -p "$BACKUP_DIR"

docker compose exec -T postgres pg_dump -U "$DB_USER" "$DB_NAME" | gzip > "$FILE"

# 7 din se purane backups delete
find "$BACKUP_DIR" -name "db_*.sql.gz" -mtime +7 -delete

echo "Backup done: $FILE"