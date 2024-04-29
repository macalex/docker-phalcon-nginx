#!/usr/bin/make -f
IMAGE := phalcon/docker

.PHONY: install-dev
install-dev:
	pwd && cp env .env && make build && make up && make logs

.PHONY: build
build:
	docker-compose build

.PHONY: up
up:
	docker-compose up -d

.PHONY: logs
logs:
	docker-compose logs $(filter-out $@,$(MAKECMDGOALS))

.PHONY: tail
tail:
	docker-compose logs -f

.PHONY: down
down:
	docker-compose down

.PHONY: composer-install
composer-install:
	composer install