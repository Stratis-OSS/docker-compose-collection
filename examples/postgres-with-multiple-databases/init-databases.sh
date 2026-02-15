#!/usr/bin/env bash
set -e

# This script runs inside the official postgres docker image during first start
# (placed in /docker-entrypoint-initdb.d/)

if [ -z "$POSTGRES_MULTIPLE_DATABASES" ]; then
  echo "No additional databases requested → exiting"
  exit 0
fi

echo
echo "======================================================================"
echo "          Creating additional databases: $POSTGRES_MULTIPLE_DATABASES"
echo "======================================================================"
echo

IFS=',' read -ra DB_ARRAY <<< "$POSTGRES_MULTIPLE_DATABASES"

for db in "${DB_ARRAY[@]}"; do
  db=$(echo "$db" | xargs)  # trim whitespace
  if [[ -z "$db" ]]; then continue; fi

  echo "→ Creating database: $db"
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE "$db";
EOSQL

done

echo "All requested databases created."
echo
