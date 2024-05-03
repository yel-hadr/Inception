# Use the penultimate stable version of Alpine
FROM alpine:3.14

# Install NGINX
RUN apk --no-cache add nginx && \
    apk --no-cache add openssl && \
    rm -rf /etc/nginx/conf.d/* && \
    mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx && \
    mkdir -p /etc/nginx/sites-available && \
    mkdir -p /run/nginx && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=MED/O=1337/OU=student/CN=yel-hadr.42.fr"

RUN mkdir -p /var/www/wordpress && \
	chmod 777 /var/www/wordpress

COPY /conf/nginx.conf /etc/nginx/nginx.conf

HEALTHCHECK --start-period=10s --timeout=10s --interval=10s --retries=3 CMD ["pidof", "nginx"]


CMD ["nginx", "-g", "daemon off;"]
