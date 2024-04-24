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
# Copy custom NGINX configuration
COPY /conf/nginx.conf /etc/nginx/nginx.conf
COPY index.html /var/www/wordpress/
# Expose port 443 for HTTPS
EXPOSE 443

# Set NGINX to run in the foreground
CMD ["nginx", "-g", "daemon off;"]
