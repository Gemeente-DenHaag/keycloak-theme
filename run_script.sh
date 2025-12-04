docker run --name keycloak_test -p 8080:8080 \
  --mount type=bind,source=$(pwd)/denhaagtheme,target=/opt/keycloak/themes/denhaagtheme \
  --mount type=bind,source=$(pwd)/realm-export.json,target=/opt/keycloak/data/import/realm-export.json \
  -e KC_BOOTSTRAP_ADMIN_USERNAME=admin \
  -e KC_BOOTSTRAP_ADMIN_PASSWORD=change_me \
  quay.io/keycloak/keycloak:26.3.1 \
  start-dev --import-realm