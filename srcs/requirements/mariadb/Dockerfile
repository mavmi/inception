FROM debian:buster

RUN apt-get update
RUN echo y | apt-get install mariadb-server

ADD ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
ADD ./tools/start.sh /start.sh

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE $MYSQL_DATABASE
ENV MYSQL_USER $MYSQL_USER
ENV MYSQL_PASSWORD $MYSQL_PASSWORD
ENV MYSQL_ROOT_PASSWORD $MYSQL_ROOT_PASSWORD

RUN chmod 777 /start.sh && /start.sh

ENTRYPOINT /usr/bin/mysqld_safe
