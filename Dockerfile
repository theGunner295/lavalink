FROM amazoncorretto:17.0.8-alpine3.18
LABEL maintainer="Jack@RedshiftEnt.com"
LABEL version="4.0.4-a1"
LABEL description="Alpine Lavalink server"

ENV LAVALINK_VERSION=4.0.4-a1

# Update system
RUN apk update --no-cache
RUN apk add --no-cache wget ca-certificates nss mpg123
RUN apk add libgcc
RUN apk add libstdc++
RUN apk add ncurses-libs

#RUN ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2

# Run as non-root user
RUN addgroup -g 322 lavalink && \
    adduser -S -u 322 -G lavalink lavalink


WORKDIR /opt

RUN chown lavalink:lavalink /opt

RUN wget "https://repo.lavalink.dev/artifacts/lavalink/99bde32d/Lavalink.jar" -P /opt/Lavalink
#RUN wget "https://github.com/lavalink-devs/Lavalink/releases/download/${LAVALINK_VERSION}/Lavalink.jar" -P /app
#COPY Lavalink.jar /app/Lavalink.jar

RUN ln -s /opt/config/application.yml /opt/Lavalink/application.yml

USER root

RUN apk del wget ca-certificates

EXPOSE 2333

ENTRYPOINT "java" "-jar" "/opt/Lavalink/Lavalink.jar"