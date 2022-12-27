FROM adoptopenjdk/openjdk16:alpine-jre
LABEL maintainer="Jack@RedshiftEnt.com"
LABEL version="3.6.2"
LABEL description="This is a Lavalink server"

ENV LAVALINK_VERSION=3.6.2

# Update system
RUN apk update --no-cache
RUN apk add --no-cache wget ca-certificates nss mpg123

# Run as non-root user
RUN addgroup -g 322 lavalink && \
    adduser -S -u 322 -G lavalink lavalink

WORKDIR /app

RUN chown lavalink:lavalink /app

USER lavalink

RUN wget "https://github.com/freyacodes/Lavalink/releases/download/${LAVALINK_VERSION}/Lavalink.jar" -P /app


USER root

RUN apk del wget ca-certificates

EXPOSE 2333

ENTRYPOINT "java" "-jar" "/app/Lavalink.jar"