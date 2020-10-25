#! /bin/bash

mkdir /var/www/html/nginx/
mkdir /var/www/html/Wordpress/
mkdir /var/www/html/phpMyAdmin/
mv var/www/html/index.nginx-debian.html /var/www/html/nginx/
rm /etc/nginx/sites-enabled/default
