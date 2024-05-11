FROM debian:bookworm

COPY conf/script.sh /etc/script.sh

RUN apt update -y && \
	apt install php8.2 php8.2-fpm \ 
	php8.2-mysql mariadb-client curl -y 
RUN chmod +x /etc/script.sh && \
	mkdir -p /var/www/ && \
	mkdir -p /var/www/wordpress && \
	cd /var/www/wordpress 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

HEALTHCHECK --interval=5s --timeout=10s --start-period=10s --retries=3 CMD ["pidof", "php-fpm8.2"]

ENTRYPOINT [ "bash" , "/etc/script.sh"]
CMD ["php-fpm8.2", "-R", "-F"]
