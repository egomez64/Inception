FROM debian:bullseye
RUN apt update
RUN apt upgrade -y
RUN apt install wget -y
RUN apt install tar -y
RUN apt-get install php7.3 php-fpm php-mysql mariadb-client -y
RUN wget https://fr.wordpress.org/wordpress-6.7.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xvf wordpress-6.7.2-fr_FR.tar.gz && rm -f wordpress-6.7.2-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
WORKDIR /var/www/wordpress
COPY /conf/php.ini /etc/php/7.4/cli/php.ini
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./tools/auto_config.sh /
RUN chmod 755 /auto_config.sh
ENTRYPOINT [ "bash", "/auto_config.sh" ]
RUN mkdir -p /run/php
RUN chmod +x /run/php
CMD ["/usr/sbin/php-fpm7.3", "-F"]