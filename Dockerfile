FROM ghcr.io/lavalink-devs/lavalink:4-alpine
LABEL maintainer="Jack@RedshiftEnt.com"
LABEL version="4.0.4-a1"
LABEL description="Alpine Lavalink server"

RUN ln -s /opt/config/application.yml /opt/Lavalink/application.yml
