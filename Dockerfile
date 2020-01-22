FROM cortezaproject/corteza-server-corredor:2019.12.0 AS corredor
FROM cortezaproject/corteza-server:2019.12.0 AS server
FROM cortezaproject/corteza-webapp:2019.12.0 AS webapp
ENV VERSION=2019.12.0

WORKDIR /app

##### CORREDOR
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.11/main/ nodejs=12.14.0-r0
RUN apk add --update --no-cache npm yarn ca-certificates

COPY --from=corredor /corredor .

##### SERVER

RUN mkdir /data
ENV COMPOSE_STORAGE_PATH   /data/compose
ENV MESSAGING_STORAGE_PATH /data/messaging
ENV SYSTEM_STORAGE_PATH    /data/system
VOLUME /data
COPY --from=server /bin/corteza-server /bin/

##### WEBAPP (we are in)

COPY start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
