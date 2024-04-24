FROM debian:bookworm

# Install MariaDB

RUN apt update -y && \
    apt install -y mariadb-server

# Copy the script that will create the database and the user
COPY conf/script.sh /etc/script.sh
RUN chmod 777 /etc/script.sh && \
	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 777 /run/mysqld
EXPOSE 3306

ENTRYPOINT ["bash" , "/etc/script.sh"]

# Set command to start MariaDB server
CMD [ "mariadbd" , "--user=root" , "--bind-address=0.0.0.0" , "--verbose" ]

