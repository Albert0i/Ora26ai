# Ora26ai Project Makefile

cnf ?= .env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

COMPOSE = docker compose

.PHONY: help up down restart ps logs prune config exec

help:
	@echo
	@echo "Usage: make TARGET"
	@echo
	@echo "Oracle AI Database 26ai Free automation helper (linux)"
	@echo
	@echo "Targets:"
	@echo "  up         start all services"
	@echo "  down       stop all services"
	@echo "  restart    restart services"
	@echo "  ps         show running containers"
	@echo "  logs       show logs"
	@echo "  prune      clear logs"
	@echo "  config     edit configuration"
	@echo "  exec       open shell inside container"

up:
	$(COMPOSE) up -d --remove-orphans

down:
	$(COMPOSE) down -v

restart:
	$(COMPOSE) restart

ps:
	$(COMPOSE) ps

logs:
	$(COMPOSE) logs -f $(ORA26AI_CONTAINER)

prune:
	@echo "Clearing logs..."
	@rm -f $(DATA_DIR)/*.log || true

config:
	nano .env

exec:
	docker exec -it $(ORA26AI_CONTAINER) bash

#
# Oracle AI Database Free
# https://www.oracle.com/database/free/
# 
# Oracle AI Database 26ai Free
# https://container-registry.oracle.com/ords/f?p=113:4:113553405708517:::4:P4_REPOSITORY,AI_REPOSITORY,AI_REPOSITORY_NAME,P4_REPOSITORY_NAME,P4_EULA_ID,P4_BUSINESS_AREA_ID:1863,1863,Oracle%20Database%20Free,Oracle%20Database%20Free,1,0&cs=3ea8_uFC9OEGZCijqnYTJXxZKW9LTkTmxcTCpw6-j7o8ZdVKFKDajt4qj5YQExYKPjJPNJs3jewfdxtKUMH63AA
# 