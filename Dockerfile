#FROM ghcr.io/lavalink-devs/lavalink:4-alpine
FROM ghcr.io/lavalink-devs/lavalink@sha256:e8e2eb96c314cc5f22750b591238eb5befb21e609b43416990a2da1382aae0c0
LABEL maintainer="Jack@RedshiftEnt.com"
LABEL version="4.0.4-a1"
LABEL description="Alpine Lavalink server"

RUN ln -s /opt/config/application.yml /opt/Lavalink/application.yml
