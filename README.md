# keycloak-theme
This keycloak theme is used for zgw apps.

To create a new version:
1. create feature branch
2. test locally
3. merge into main
4. create a git tag e.g. (v0.0.2)


This will trigger the pipeilne to create a github release and publish a new version based on git tag.

To test locally:
1. npm ci
2. npm run copy
3. docker run --name keycloak_test -p 8080:8080 \
    --mount type=bind,source=./denhaagtheme,target=/opt/keycloak/themes/denhaagtheme \
    -e KC_BOOTSTRAP_ADMIN_USERNAME=admin -e KC_BOOTSTRAP_ADMIN_PASSWORD=change_me \
    quay.io/keycloak/keycloak:26.3.1 \
    start-dev
4. import realm-export.json, this json is only for testing the theme. identity providers are all fake