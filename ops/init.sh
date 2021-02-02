#!/bin/bash

if test -f ".env"; then
    echo "\033[1;31mThe project has already been initialized. Remove .env to reinitialize\033[0m"
    exit 1
fi

cp .env.dist .env

echo "Enter server name [mysite.com]: "
read serverName

echo "Enter your email [email@email.com]: "
read email

sed -i "s/SERVER_NAME=.*/SERVER_NAME=${serverName}/" .env
sed -i "s/EMAIL=.*/EMAIL=${serverName}/" .env


source ./.env
export PATH_TO_HOST_CONF=${PATH_TO_HOST_CONF}

if !test -f "default.conf"; then
    cp .env.dist .env
    echo "\033[1;31mPlease update default.conf file\033[0m"
    exit 1
fi


echo "\032[1;31mInitialization complete\032[0m"

exit 0
