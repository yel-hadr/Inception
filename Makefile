all : down up

volume :
	@sudo rm -rf /home/$(USER)/data/mariadb
	@sudo rm -rf /home/$(USER)/data/wordpress
	@mkdir -p /home/$(USER)/data/mariadb
	@mkdir -p /home/$(USER)/data/wordpress

up :
	@docker compose -f ./srcs/docker-compose.yml up --build

down : 
	@docker compose -f ./srcs/docker-compose.yml down -v

stop : 
	@docker compose -f ./srcs/docker-compose.yml stop

start : 
	@docker compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps
