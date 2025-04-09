NAME = inception
COMPOSE = srcs/docker-compose.yml
DC =  docker compose -p $(NAME) -f $(COMPOSE)

all: build up

build:
	@sudo mkdir -p /home/egomez/data/mariadb
	@sudo chmod 777 /home/egomez/data/mariadb
	@sudo mkdir -p /home/egomez/data/wordpress
	@sudo chmod 777 /home/egomez/data/wordpress
	@$(DC) build

up:
	@$(DC) up -d

down:
	@$(DC) down

re: clean all

clean: down
	@sudo rm -rf /home/egomez/data/mariadb
	@sudo rm -rf /home/egomez/data/wordpress
	@sudo docker volume rm inception_wordpress
	@sudo docker volume rm inception_mariadb
	@sudo docker rmi $$(docker images -a -q) -f
	@sudo docker system prune -f -a --volumes

stop:
	@$(DC) stop

.PHONY: all build up down re clean stop