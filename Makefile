all : up

volume :
	@mkdir -p /home/$(USER)/data/mariadb
	@mkdir -p /home/$(USER)/data/wordpress

delete :
	@sudo rm -rf /home/$(USER)/data/mariadb
	@sudo rm -rf /home/$(USER)/data/wordpress

up :
	@docker compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker compose -f ./srcs/docker-compose.yml down -v

stop : 
	@docker compose -f ./srcs/docker-compose.yml stop

start : 
	@docker compose -f ./srcs/docker-compose.yml start

env :
	@echo "DOMAIN_NAME=yel-hadr.42.fr" > ./srcs/.env
	@echo "SQL_ROOT_PASSWORD=1234" >> ./srcs/.env
	@echo "SQL_DATABASE=wordpress" >> ./srcs/.env
	@echo "SQL_USER=youssef" >> ./srcs/.env

	@echo "WP_TITLE=42" >> ./srcs/.env
	@echo "WP_ADMIN_USR=youssef" >> ./srcs/.env
	@echo "WP_ADMIN_PWD=1234" >> ./srcs/.env
	@echo "WP_ADMIN_EMAIL=ssefy1998@gmail.com" >> ./srcs/.env
	@echo "WP_USR=elhadraoui" >> ./srcs/.env
	@echo "WP_PWD=1234" >> ./srcs/.env
	@echo "WP_EMAIL=youssefelhadraoui99@gmail.com" >> ./srcs/.env
	@echo "WP_URL=https://yel-hadr.42.fr" >> ./srcs/.env
	@echo "WP_THEME=twentytwenty" >> ./srcs/.env
	@echo "WP_REDIS_HOST=redis" >> ./srcs/.env
	@echo "WP_REDIS_PORT=6379" >> ./srcs/.env
	@echo "WP_REDIS_PREFIX=wp_" >> ./srcs/.env
	@echo "WP_DBHOST=mariadb:3306" >> ./srcs/.env
	@echo "FTP_PASS=1234" >> ./src/.env
	@echo "CERTS_=/etc/ssl/certs/nginx-selfsigned.crt" >> ./srcs/.env
	@echo "KEYS_=/etc/ssl/private/nginx-selfsigned.key" >> ./srcs/.env



status : 
	@docker ps
