COMPOSE = docker compose
PATH_COMPOSE = ./srcs/docker-compose.yml

all:
	$(COMPOSE) -f $(PATH_COMPOSE) up -d
ps:
	$(COMPOSE) -f $(PATH_COMPOSE) ps
clean:
	$(COMPOSE) -f $(PATH_COMPOSE) down -v
	rm -rf ./srcs/db_data/ ./srcs/wp_data/
fclean:
	$(COMPOSE) -f $(PATH_COMPOSE) down --rmi all -v
	rm -rf ./srcs/db_data/ ./srcs/wp_data/
re:
	make fclean
	make all
fre:
	make fclean
	make all
.PHONY: all ps clean fclean re fre 