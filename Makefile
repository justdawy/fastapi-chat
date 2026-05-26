# Variables
COMPOSE_FILE := docker-compose.yaml
APP_SERVICE := fastapi-chat-web-1

.PHONY: up down build logs ps shell clean restart

# Start all containers in the background
up:
	docker compose -f $(COMPOSE_FILE) up -d

# Stop and remove all containers, networks, and volumes
down:
	docker compose -f $(COMPOSE_FILE) down -v

# Force rebuild all images
build:
	docker compose -f $(COMPOSE_FILE) build

# Restart a
restart: down up

# View real-time logs for all containers
logs:
	docker compose -f $(COMPOSE_FILE) logs -f

# Check the status of running containers
ps:
	docker compose -f $(COMPOSE_FILE) ps

# Open a shell inside the main application container
shell:
	docker compose -f $(COMPOSE_FILE) exec $(APP_SERVICE) sh
