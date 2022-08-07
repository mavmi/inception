FROM debian:buster

RUN apt-get update
RUN echo y | apt-get install wget php7.3 php-fpm mariadb-client php-mysqli

ADD https://wordpress.org/latest.tar.gz /var/www/html/latest.tar.gz
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
ADD ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
ADD ./tools/start.sh /start.sh

RUN mkdir -p /run/php

ENTRYPOINT chmod 777 /start.sh && /start.sh

