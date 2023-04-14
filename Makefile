COMPOSE = docker compose
PATH_COMPOSE = ./srcs/docker-compose.yml

all:
	$(COMPOSE) -f $(PATH_COMPOSE) up
clean:
	$(COMPOSE) -f $(PATH_COMPOSE) down
	rm -rf ./srcs/DB ./srcs/WordPress
fclean:
	$(COMPOSE) -f $(PATH_COMPOSE) down -v --rmi all
	rm -rf ./srcs/DB ./srcs/WordPress
re:
	make clean
	make all
fre:
	make fclean
	make all
.PHONY: all clean fclean re fre