FROM debian:bullseye
RUN apt update
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install curl -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=CM/L=Angouleme/O=42/OU=42/CN=egomez.42.fr/UID=egomez"
RUN mkdir -p /var/run/nginx
COPY ./conf/nginx.conf /etc/nginx/conf.d
RUN chmod 755 ./var/www/html;
RUN chown -R www-data:www-data ./var/www/html;
CMD ["nginx", "-g", "daemon off;"];