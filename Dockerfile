FROM adoptopenjdk/openjdk14:alpine-jre
#FROM adoptopenjdk/openjdk16:alpine-jre
LABEL maintainer="Jack@RedshiftEnt.com"
LABEL version="3.6.2"
LABEL description="This is a Lavalink server"

ENV LAVALINK_VERSION=3.6.2

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


WORKDIR /app

RUN chown lavalink:lavalink /app

RUN wget "https://github.com/freyacodes/Lavalink/releases/download/${LAVALINK_VERSION}/Lavalink.jar" -P /app

RUN ln -s /app/config/application.yml /app/application.yml

USER root

RUN apk del wget ca-certificates

EXPOSE 2333

ENTRYPOINT "java" "-jar" "/app/Lavalink.jar"