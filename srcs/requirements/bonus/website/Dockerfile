FROM alpine:3.14

# Install NGINX
RUN apk --no-cache add nginx && \
    rm -rf /etc/nginx/conf.d/* && \
    mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx && \
    mkdir -p /etc/nginx/sites-available && \
    mkdir -p /run/nginx

RUN mkdir -p /var/www/webapp && \
	chmod 777 /var/www/webapp

COPY /conf/nginx.conf /etc/nginx/nginx.conf
COPY app/ /var/www/webapp

HEALTHCHECK --start-period=10s --timeout=10s --interval=10s --retries=3 CMD ["pidof", "nginx"]



CMD ["nginx", "-g", "daemon off;"]