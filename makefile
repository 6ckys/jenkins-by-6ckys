.PHONY: up down

up:
	docker-compose up -d
	sudo ufw allow 8080

down:
	docker-compose down
	sudo ufw delete allow 8080