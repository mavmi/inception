service nginx stop > /dev/null
ln -s /etc/nginx/sites-available/pmaryjo.42.fr.conf /etc/nginx/sites-enabled/pmaryjo.42.fr.conf

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt \
-subj "/CN=RU/C=RU/ST=Moscow/L=Moscow/O=ecole42/OU=ecole42" > /dev/null

nginx -g 'daemon off;'