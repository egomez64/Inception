FROM debian:bullseye
RUN apt update
RUN apt upgrade -y
RUN apt install wget -y
RUN apt-get install php7.3 php-fpm php-mysql mariadb-client -y
RUN wget https://fr.wordpress.org/wordpress-6.7.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar wordpress-6.7.2-fr_FR.tar.gz && rm wordpress-6.7.2-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress
COPY /conf/php.ini /etc/php/7.4/cli/php.ini
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN sudo mv wp-cli.phar /usr/local/bin/wp