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

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=yel-hadr.42.fr/UID=yel-hadr"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# copy the configuration file for nginx

COPY ./conf/index.html /var/www/html/index.html
# copy the index.html file

EXPOSE 443
# expose the port 8080 for the nginx server


CMD ["nginx", "-g", "daemon off;"]
# start the nginx server
