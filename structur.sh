#/bin/bash

mkdir srcs
touch Makefile

mkdir srcs/requirements
touch srcs/.env
touch srcs/docker-compose.yml

mkdir srcs/requirements/bonus
mkdir srcs/requirements/mariadb
mkdir srcs/requirements/nginx
mkdir srcs/requirements/tools
mkdir srcs/requirements/wordpress

mkdir srcs/requirements/mariadb/conf
touch srcs/requirements/mariadb/Dockerfile
touch srcs/requirements/mariadb/.dockerignore
mkdir srcs/requirements/mariadb/tools

mkdir srcs/requirements/nginx/conf
touch srcs/requirements/nginx/Dockerfile
touch srcs/requirements/nginx/.dockerignore
mkdir srcs/requirements/nginx/tools

mkdir srcs/requirements/wordpress/conf
touch srcs/requirements/wordpress/Dockerfile
touch srcs/requirements/wordpress/.dockerignore
mkdir srcs/requirements/wordpress/tools

mkdir srcs/requirements/tools/conf
touch srcs/requirements/tools/Dockerfile
touch srcs/requirements/tools/.dockerignore
mkdir srcs/requirements/tools/tools

mkdir srcs/requirements/bonus/conf
touch srcs/requirements/bonus/Dockerfile
touch srcs/requirements/bonus/.dockerignore
mkdir srcs/requirements/bonus/tools

echo "DOMAIN_NAME=yel-hadr.42.fr
# certificates
CERTS_=0
# MYSQL SETUP
MYSQL_ROOT_PASSWORD=XXXXXXXXXXXX
MYSQL_USER=XXXXXXXXXXXX
MYSQL_PASSWORD=XXXXXXXXXXXX" > srcs/.env
