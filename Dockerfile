FROM ghcr.io/lavalink-devs/lavalink:4-alpine
LABEL maintainer="Jack@RedshiftEnt.com"
LABEL version="4.0.7"
LABEL description="Alpine Lavalink server"

#RUN apk update
#RUN apk add eudev-libs

RUN ln -s /opt/config/application.yml /opt/Lavalink/application.yml
#RUN rm /opt/Lavalink/Lavalink.jar
#RUN wget "https://github.com/lavalink-devs/Lavalink/releases/download/4.0.7/Lavalink.jar" -P /opt/Lavalink
