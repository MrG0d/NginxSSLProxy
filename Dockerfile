FROM nginx:1.19-alpine AS nginx

MAINTAINER ivan.kudryavsky@requestum.com

WORKDIR app

RUN apk add --no-cache certbot

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./ops/crontab /app/crontab
    #RUN certbot certonly --standalone -d online-exercise.evil-brain.net --email ivan.kudryavsky@requestum.com -n --agree-tos --expand


CMD tail -f
#CMD /bin/sh -c "envsubst '\$SERVER_NAME' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf"
