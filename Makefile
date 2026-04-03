.PHONY: help run build test lint up down clean fmt

help:
	@echo "=== c1m-websocket-gateway ==="
	@echo "make run      - запустить локально"
	@echo "make build    - собрать бинарник"
	@echo "make test     - запустить тесты"
	@echo "make lint     - проверить код"
	@echo "make up       - поднять Docker Compose"
	@echo "make down     - остановить Docker Compose"
	@echo "make clean    - полная очистка"

run:
	go run cmd/c1m-websocket-gateway/main.go

build:
	go build -o bin/gateway ./cmd/c1m-websocket-gateway

test:
	go test ./... -v

lint:
	golangci-lint run --fix

fmt:
	go fmt ./...

up:
	docker compose up -d --build

down:
	docker compose down

clean:
	rm -rf bin/
	docker compose down -v --remove-orphans