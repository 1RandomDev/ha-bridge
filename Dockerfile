# Modified from https://github.com/linuxserver/docker-habridge

FROM ghcr.io/linuxserver/baseimage-ubuntu:bionic

ARG DEBIAN_FRONTEND="noninteractive"

# install packages
RUN \
 echo "**** install runtime packages ****" && \
 apt-get update && \
 apt-get install --no-install-recommends -y \
    libcap2-bin \
	openjdk-11-jre-headless && \
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