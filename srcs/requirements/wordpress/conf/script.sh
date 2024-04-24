#!/bin/bash
mkdir -p /var/www/
mkdir -p /var/www/wordpress

cd /var/www/wordpress

rm -rf *


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root

echo "--------------"
#cp /etc/wp-config.php /var/www/wordpress/wp-config.php
echo "----------------"
chown -R root:root /var/www/wordpress

#sed -i -r "s/database/$SQL_DATABASE/1"   wp-config.php
#sed -i -r "s/database_user/$SQL_USER/1"  wp-config.php
#sed -i -r "s/passwod/$SQL_PASSWORD/1"    wp-config.php

#sed -i -r "s/localhost/mariadb/1"    wp-config.php

wp config create --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" --dbhost="mariadb:3306" --allow-root

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

#wp theme install astra --activate --allow-root


#wp plugin install redis-cache --activate --allow-root


sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

mkdir -p /run/php

chmod +x /var/www/wordpress/*
#wp redis enable --allow-root

exec "$@"
