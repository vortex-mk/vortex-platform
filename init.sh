#!/bin/sh
set -eu

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<'SQL'
CREATE DATABASE guardian;
CREATE DATABASE vortex;
SQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname guardian <<'SQL'
CREATE EXTENSION IF NOT EXISTS pgcrypto;
SQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname vortex <<'SQL'
CREATE EXTENSION IF NOT EXISTS pgcrypto;
SQL
