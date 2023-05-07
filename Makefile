all:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	mkdir -p ~/data/wordpress
	mkdir -p ~/data/mariadb
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	docker system prune -a

fclean:
	docker stop $$(docker ps -qa)
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	sudo rm -rf ~/data

.PHONY	: all build down re clean fclean
