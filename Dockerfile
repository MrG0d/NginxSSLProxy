FROM nginx:1.19-alpine AS nginx

MAINTAINER ivan.kudryavsky@requestum.com

RUN apk add --no-cache certbot

COPY ./default.conf /etc/nginx/conf.d/default.conf
#RUN certbot certonly --standalone -d example.com,wwcdw.example.com --email YOUR_EMAIL -n --agree-tos --expand

#CMD /bin/sh -c "envsubst '\$SERVER_NAME' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf"
