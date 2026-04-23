# keycloak-theme

This keycloak theme is used for zgw apps.

To create a new version:

1. Create a feature branch
2. Test locally
3. Merge into main
4. Bump the `version` in `package.json` (e.g. `0.0.4` → `0.0.5`) and run the release script:
   ```sh
   pnpm run release
   ```
   The script automatically uses the version from `package.json` as the git tag (`v0.0.5`).

This pushes the git tag to origin, which triggers the Azure pipeline to build the theme, create a GitHub release, and upload the `.tar.gz` asset.

> **Note:** do **not** create the release manually via the GitHub UI. The CSS is copied from `node_modules` during the pipeline build. A manually created release will not contain the built theme files and Keycloak will fail to load the theme.

To test locally:

1. pnpm i
2. pnpm copy
3. pnpm dev
4. import realm-export.json, this json is only for testing the theme. identity providers are all fake
5. Go to localhost:8080, login with user user and password password (see run_script.sh)
6. To view the theme, go to realm zgw-publiek -> clients -> look for client account and click on Home url
7. FYI: the theme is only in one language (Dutch) and the messages are in denhaagtheme/login/messages/messages_en.properties.
