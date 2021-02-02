proxy:
	docker-compose exec proxy sh

start:
	docker-compose up -d

init:
	./ops/init.sh

get_ip:
	ifconfig | grep "docker"

