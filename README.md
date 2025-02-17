# keycloak-theme
This keycloak theme is used for zgw apps.

To create a new version:
1. create feature branch
2. test locally
3. merge into main
4. create a git tag e.g. (v0.0.2)


This will trigger the pipeilne to create a github release and publish a new version based on git tag.

To test locally:
1. npm install
2. docker build . -t [tag]
3. docker run -d [tag]
