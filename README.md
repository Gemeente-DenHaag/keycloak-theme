# keycloak-theme

This keycloak theme is used for zgw apps.

To create a new version:

1. create feature branch
2. test locally
3. merge into main
4. create a git tag e.g. (v0.0.2)

This will trigger the pipeilne to create a github release and publish a new version based on git tag.

To test locally:

1. pnpm i
2. pnpm copy
3. pnpm dev
4. import realm-export.json, this json is only for testing the theme. identity providers are all fake
5. Go to localhost:8080, login with user user and password password (see run_script.sh)
6. To view the theme, go to realm zgw-publiek -> clients -> look for client account and click on Home url
7. FYI: the theme is only in one language (Dutch) and the messages are in denhaagtheme/login/messages/messages_en.properties.
