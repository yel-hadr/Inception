FROM debian:buster

# Install MariaDB
RUN apt update -y && \
    apt install -y mariadb-server

# Copy configuration files
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copy the script that will create the database and the user
COPY conf/script.sh /etc/script.sh

RUN chmod +x /etc/script.sh
CMD ["sh", "/etc/script.sh"]
