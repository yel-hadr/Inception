FROM alpine:3.12

RUN apk update && apk add nginx
# update the package list and install nginx

RUN mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx 
#create the directory for the pid file and give the right to the user nginx

RUN mkdir -p /var/www/html
# create the directory for the index.html file


RUN apk add openssl
# install openssl to generate the ssl certificate

RUN mkdir /etc/nginx/ssl
# create the directory for the ssl certificate

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=ft_services"

COPY ./conf/myNginx.conf /etc/nginx/conf.d/default.conf
# copy the configuration file for nginx

COPY ./conf/index.html /var/www/html/index.html
# copy the index.html file

EXPOSE 8080
# expose the port 8080 for the nginx server

CMD ["nginx", "-g", "daemon off;"]
# start the nginx server