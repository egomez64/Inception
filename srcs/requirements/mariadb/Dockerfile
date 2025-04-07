FROM debian:bullseye
RUN apt update
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
COPY /conf/50-server.cnf /etc/mysql/mariadb.con.d/50-server.cnf
COPY ./tools/start-service.sh /start-service.sh
RUN chmod 777 /start-service.sh
RUN /start-service.sh
CMD [mysqld]