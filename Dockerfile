FROM alpine:latest
LABEL maintainer="Jack@RedshiftEnt.com"
LABEL version="3.6.2"
LABEL description="This is a Lavalink server"

ARG DEBIAN_FRONTEND=noninteractive

RUN apk add libgcc
RUN apk add openjdk17

WORKDIR /app

EXPOSE 2333

COPY . .

ENTRYPOINT "java" "-jar" "/app/Lavalink.jar"