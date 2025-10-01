ARG KC_VERSION=26.3.1

FROM quay.io/keycloak/keycloak:${KC_VERSION} as builder
WORKDIR /opt/keycloak

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_FEATURES=token-exchange,admin-fine-grained-authz
# ENV KC_DB=postgres
ENV KC_HTTP_RELATIVE_PATH=/

# needed because of readonlyrootfilesystem
# Temp disable for infinspan changes
# ADD --chown=keycloak:keycloak ./conf defaultconf/

# ADD --chown=keycloak:keycloak ./providers providers/
ADD --chown=keycloak:keycloak ./denhaagtheme/ themes/denhaagtheme/

RUN bin/kc.sh build

FROM quay.io/keycloak/keycloak:${KC_VERSION}
WORKDIR /opt/keycloak

COPY --chown=keycloak:keycloak --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["bin/kc.sh", "start-dev"]