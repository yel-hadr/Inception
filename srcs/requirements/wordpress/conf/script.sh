#!/bin/bash
sleep 10
cd /var/www/wordpress

WP_ADMIN_PWD=$(grep "WP_ADMIN_PWD=" /run/secrets/credentials | cut -d'=' -f2)
WP_PWD=$(grep "WP_PWD=" /run/secrets/credentials | cut -d'=' -f2)

echo "admin password: $WP_ADMIN_PWD"
echo "password: $WP_PWD"


echo "Starting PHP-FPM-----------"

if [ -f /var/www/wordpress/wp-config.php ]; then
	echo "File exists"
else
	echo "File does not exist"
	wp core download --allow-root
fi
chown -R root:root /var/www/wordpress

echo "wp core install and create config file -----"
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

echo "############# checking if wp-config.php exists ###############"
if [ -f /var/www/wordpress/wp-config.php ]; then
	echo "File exists"
else
	echo "File does not exist"
	wp config create --dbname="$SQL_DATABASE" --dbuser="$SQL_USER" --dbpass="$SQL_PASSWORD" --dbhost="$WP_DBHOST" --allow-root

fi
echo "############# wp-config.php created ###############"


echo "############# checking if user exists ###############"
wp user list --allow-root --path=/var/www/wordpress --field=user_login | grep -q ${WP_USR}
if [ $? != 0 ]; then
	wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
fi
echo "############# user created ###############"

wp option update uploads_use_yearmonth_folders 0 --allow-root
wp option update upload_path wp-content/uploads --allow-root
wp core verify-checksums --allow-root

echo "############# checking if theme exists ###############"
wp theme list --allow-root --path=/var/www/wordpress | grep -q astra
if [ $? != 0 ]; then
	wp theme install twentytwentythree --activate --allow-root
fi
echo "############# theme exists ###############"

# --------- The following code is for setting up redis cache ------------

echo "############# setting up redis ###############"
wp --allow-root config set WP_REDIS_PREFIX "$WP_REDIS_PREFIX"
wp --allow-root config set WP_REDIS_HOST "$WP_REDIS_HOST"
wp --allow-root config set WP_REDIS_PORT "$WP_REDIS_PORT"

wp --allow-root plugin install redis-cache
wp --allow-root plugin activate redis-cache
wp --allow-root redis update-dropin
echo "############# redis setup completed ###############"
# ------------------------------------------------------------------------

mkdir -p /var/www/wordpress/wp-content/uploads
chown -R www-data:www-data /var/www/wordpress/wp-content/uploads
chmod -R 755 /var/www/wordpress/wp-content/uploads

sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

mkdir -p /run/php

chmod +x /var/www/wordpress/*

echo "########### set up completed ###########"

exec "$@"
