SRCS_DIR=srcs/
COMPOSE_F=$(SRCS_DIR)docker-compose.yml
COMPOSE=docker compose -f $(COMPOSE_F)

all:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down
	docker system prune

status:
	docker ps -a
	docker network ls

re: down all

.PHONY: all down re