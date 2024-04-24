#/bin/sh



# Adjust MariaDB configuration (optional)
sed -i "s|bind-address           = 127.0.0.1|bind-address           = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf


if [ ! -d "/run/mysqld" ]; then
	mkdir /run/mysqld;
fi
	cat << EOF > /tmp/wp.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};
CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
EOF

mariadbd --user=root --bootstrap < /tmp/wp.sql;
rm -f /tmp/wp.sql;


exec "$@"
