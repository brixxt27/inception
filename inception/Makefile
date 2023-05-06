name = inception
all:
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/mariadb
	@printf "Launch configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@mkdir -p ~/data/wordpress
	@mkdir -p ~/data/mariadb
	@printf "Building configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down
	@printf "Rebuild configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data

.PHONY	: all build down re clean fclean
