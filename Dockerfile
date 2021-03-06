FROM nginx:1.19-alpine AS nginx

MAINTAINER ivan.kudryavsky@requestum.com

WORKDIR app

RUN apk add --no-cache certbot

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./ops/nginx.conf /etc/nginx/nginx.conf
COPY ./ops/crontab /app/crontab
COPY ./ops/entrypoint.sh /app/entrypoint.sh

ENTRYPOINT /app/entrypoint.sh
