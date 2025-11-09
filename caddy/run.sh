#!/bin/bash
set -e

CADDY_ROOT="/caddy"
CADDY_DATA="${CADDY_ROOT}/caddy_data"

echo "[i] cleaning up old data..."
rm -rf "$CADDY_DATA"

echo "[i] creating caddy directories..."
mkdir -p "$CADDY_DATA"

echo "[i] preparing Caddyfile..."
cp /app/Caddyfile.template "$CADDY_DATA/Caddyfile"

echo "[i] copying docker-compose to caddy root..."
cp /app/docker-compose.yml "$CADDY_ROOT/docker-compose.yml"

cd "$CADDY_ROOT"

echo "[i] pulling images"
docker-compose pull
echo "[i] starting caddy proxy docker..."
docker-compose up
