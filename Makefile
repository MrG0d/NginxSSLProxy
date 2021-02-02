proxy:
	docker-compose exec proxy sh

start:
	docker-compose up -d

init:
	cp .env.dist .env \
	&& cp ops/default.conf.dist default.conf