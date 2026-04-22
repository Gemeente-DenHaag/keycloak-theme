#!/bin/sh

CONTAINER_NAME="keycloak_test"

if docker ps --format '{{.Names}}' | grep -Fx "$CONTAINER_NAME" >/dev/null 2>&1; then
  echo "Container $CONTAINER_NAME draait al."
elif docker ps -a --format '{{.Names}}' | grep -Fx "$CONTAINER_NAME" >/dev/null 2>&1; then
  echo "Container $CONTAINER_NAME bestaat al en wordt gestart."
  docker start "$CONTAINER_NAME"
else
  docker run --name "$CONTAINER_NAME" -p 8080:8080 \
    --mount type=bind,source=$(pwd)/denhaagtheme,target=/opt/keycloak/themes/denhaagtheme \
    --mount type=bind,source=$(pwd)/realm-export.json,target=/opt/keycloak/data/import/realm-export.json \
    -e KC_BOOTSTRAP_ADMIN_USERNAME=admin \
    -e KC_BOOTSTRAP_ADMIN_PASSWORD=change_me \
    quay.io/keycloak/keycloak:26.3.1 \
    start-dev --import-realm
fi