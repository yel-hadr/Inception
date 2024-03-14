FROM alpine:3.12

RUN apk update && apk add nginx

COPY ./conf/myNginx.conf /etc/nginx/conf.d/default.conf
COPY ./conf/index.html /var/www/index.html

RUN mkdir -p /run/nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

