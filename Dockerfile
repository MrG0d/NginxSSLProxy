FROM nginx:1.19-alpine AS nginx

MAINTAINER ivan.kudryavsky@requestum.com

ARG PATH_TO_HOST_CONF
WORKDIR /app

RUN apk add --no-cache certbot

RUN echo "$PATH_TO_HOST_CONF"
COPY "$PATH_TO_HOST_CONF" /etc/nginx/conf.d/default.template
#COPY ./nginx.conf /etc/nginx/nginx.conf
#RUN certbot certonly --standalone -d example.com,wwcdw.example.com --email YOUR_EMAIL -n --agree-tos --expand

#CMD /bin/sh -c "envsubst '\$SERVER_NAME' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf"
