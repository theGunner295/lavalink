FROM adoptopenjdk/openjdk16:alpine-jre
LABEL maintainer="Jack@RedshiftEnt.com"
LABEL version="3.6.2"
LABEL description="This is a Lavalink server"

ENV LAVALINK_VERSION=3.6.2

# Update system
RUN apk update --no-cache
RUN apk add --no-cache wget ca-certificates nss mpg123

WORKDIR /app

RUN wget "https://github.com/freyacodes/Lavalink/releases/download/${LAVALINK_VERSION}/Lavalink.jar" -P /app

RUN apk del wget ca-certificates

COPY . .

EXPOSE 2333

ENTRYPOINT [ "/app/run.sh" ]
#ENTRYPOINT "java" "-jar" "/app/Lavalink.jar"