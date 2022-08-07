FROM debian:buster

RUN apt-get update
RUN echo y | apt-get install openssl nginx 

ADD ./conf/etc/nginx/sites-available/pmaryjo.42.fr.conf /etc/nginx/sites-available/pmaryjo.42.fr.conf
ADD ./tools/start.sh /start.sh

ENTRYPOINT chmod 777 /start.sh && /start.sh
