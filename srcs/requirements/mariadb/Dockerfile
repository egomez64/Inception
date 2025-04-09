FROM debian:bullseye
RUN apt update
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
COPY /conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/start-service.sh /.
RUN chmod 777 /start-service.sh
ENTRYPOINT ["bash", "/start-service.sh"]