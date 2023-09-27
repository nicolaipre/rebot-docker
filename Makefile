.DEFAULT_GOAL := info

info:
	@echo "Makefile for REBot Docker."

build:
	docker compose up --build -d

despawn:
	docker compose down

shell:
	docker exec -it rebot /bin/bash

spawn:
	docker compose up -d

start:
	docker compose start

stop:
	docker compose stop
