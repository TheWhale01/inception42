SRCS_DIR=srcs/
COMPOSE_F=$(SRCS_DIR)docker-compose.yml
COMPOSE=docker compose -f $(COMPOSE_F)

all:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

status:
	docker ps -a

re: down all

.PHONY: all down re