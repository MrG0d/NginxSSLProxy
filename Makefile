proxy:
	docker-compose exec proxy sh

start:
	docker-compose up -d

init:


get_ip:
	ifconfig | grep "docker"

