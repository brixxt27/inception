COMPOSE = docker compose
PATH_COMPOSE = ./srcs/docker-compose.yml

all:
	mkdir -p ./srcs/volumes
	chown -R $(USER) ./srcs/volumes
	$(COMPOSE) -f $(PATH_COMPOSE) up
ps:
	$(COMPOSE) -f $(PATH_COMPOSE) ps
clean:
	$(COMPOSE) -f $(PATH_COMPOSE) down -v
	rm -rf ./srcs/volumes/
fclean:
	$(COMPOSE) -f $(PATH_COMPOSE) down --rmi all -v
	rm -rf ./srcs/volumes/
re:
	make fclean
	make all
fre:
	make fclean
	make all
.PHONY: all ps clean fclean re fre 