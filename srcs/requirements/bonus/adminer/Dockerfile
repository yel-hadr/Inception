FROM debian:bookworm

RUN apt update

RUN apt install -y apache2 php libapache2-mod-php adminer -y

RUN cd /usr/share/adminer/ && \
    ./compile.php && \
    mv adminer-*.php adminer.php && \
    echo "Alias /adminer.php /usr/share/adminer/adminer.php" | tee /etc/apache2/conf-available/adminer.conf && \
    a2enconf adminer.conf && \
    service apache2 restart



CMD [ "php", "-S", "0.0.0.0:9090", "-t", "/usr/share/adminer" ]

