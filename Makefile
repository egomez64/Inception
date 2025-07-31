COMPOSE = docker compose -f srcs/docker-compose.yml

DATA_DIRS = /home/$(USER)/data/wordpress /home/$(USER)/data/mariadb

all: 
	@mkdir -p $(DATA_DIRS)
	$(COMPOSE) up --build -d

down:
	$(COMPOSE) down -v

clean: down

fclean: clean
	@sudo rm -rf $(DATA_DIRS)

re: fclean all

.PHONY: all build up down clean fclean re