FROM debian:buster


RUN apt update -y 

RUN apt install php-fpm php-mysql -y

RUN apt install curl -y

COPY conf/script.sh /etc/script.sh
COPY conf/wp-config.php /etc/wp-config.php
RUN chmod +x /etc/script.sh

CMD [ "sh", "/etc/script.sh" ]