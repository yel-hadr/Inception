FROM alpine:3.12

RUN apk update && apk add nginx
# update the package list and install nginx

RUN apk add openssl
# install openssl to generate the ssl certificate
RUN mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx 

# Create the sites-available directory
RUN mkdir -p /etc/nginx/sites-available

# Create the PID file directory
RUN mkdir -p /run/nginx

COPY conf/execute.sh /
# copy the script that will start the nginx server

RUN chmod +x /execute.sh
# give the script the right permissions

CMD ["sh", "/execute.sh"]
