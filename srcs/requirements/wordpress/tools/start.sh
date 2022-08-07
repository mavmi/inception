userdel www-data
useradd -u 82 www-data
chown -R www-data:www-data /var/www/html

if [ -d /var/www/html/wordpress ]; then
    rm -rf /var/www/html/wordpress
fi
    
tar -xzvf /var/www/html/latest.tar.gz -C /var/www/html > /dev/null

chmod 777 /usr/local/bin/wp
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --allow-root --path=/var/www/html/wordpress
wp core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root --path=/var/www/html/wordpress
wp user create $USERNAME $USER_EMAIL --role=subscriber --user_pass=$USER_PASSWORD --allow-root --path=/var/www/html/wordpress

/usr/sbin/php-fpm7.3 --nodaemonize
