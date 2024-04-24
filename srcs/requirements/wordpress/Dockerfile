FROM debian:bookworm

COPY conf/script.sh /etc/script.sh
COPY conf/wp-config.php /etc/wp-config.php

RUN apt update -y && \
	apt install php8.2 php8.2-fpm \ 
	php8.2-mysql mariadb-client -y && \
	apt install curl -y && \
	chmod +x /etc/script.sh


ENTRYPOINT [ "bash" , "/etc/script.sh"]
CMD ["php-fpm8.2", "-R", "-F"]
