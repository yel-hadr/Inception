all : up

up : 
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v
	@sudo docker system prune -af

stop : 
	@sudo docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@sudo docker-compose -f ./srcs/docker-compose.yml start

status : 
	@sudo docker ps
