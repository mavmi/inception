DOCKER_COMPOSE_FILE	= ./srcs/docker-compose.yml
DOCKER_COMPOSE		= docker compose -f $(DOCKER_COMPOSE_FILE)

all: build foreground

build:
	-mkdir -p ~/data/mariadb ~/data/wordpress
	-$(DOCKER_COMPOSE) build

background:
	-$(DOCKER_COMPOSE) up -d

foreground:
	-$(DOCKER_COMPOSE) up

stop:
	-$(DOCKER_COMPOSE) stop

re: rm build foreground

rm:
	docker system prune -af
	docker volume prune -f

.PHONE: build background foreground rm re
