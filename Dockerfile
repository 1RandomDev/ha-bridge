FROM ghcr.io/linuxserver/baseimage-alpine:3.15

# install packages
RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
     openjdk11-jre-headless && \
 echo "**** install ha-bridge ****"

COPY target/ha-bridge-*.jar /app/ha-bridge.jar

RUN \
 echo "**** cleanup ****" && \
 rm -rf \
  /tmp/* \
  /var/lib/apt/lists/* \
  /var/tmp/*

# copy local files
COPY docker-root/ /

# ports and volumes
EXPOSE 8080
VOLUME /config
