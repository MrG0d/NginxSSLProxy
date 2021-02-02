echo "/etc/letsencrypt/live/$SERVER_NAME/fullchain.pem"
if [ ! -f "/etc/letsencrypt/live/$SERVER_NAME/fullchain.pem" ]; then
    echo "Certificates  not found, trying to create"
    certbot certonly --standalone -d "$SERVER_NAME" --email "$EMAIL" -n --agree-tos --expand
fi


crontab /app/crontab

exec "$@"

tail -f

nginx -g 'daemon off;'
