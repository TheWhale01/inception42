SRCS_DIR=srcs/
COMPOSE_F=$(SRCS_DIR)docker-compose.yml
COMPOSE=docker compose -f $(COMPOSE_F)

all:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down
	docker rmi -f srcs-nginx
	docker rmi -f srcs-wordpress

status:
	docker ps -a
	docker network ls

re: down all

.PHONY: all down re