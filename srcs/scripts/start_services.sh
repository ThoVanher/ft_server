#!/bin/bash

service nginx start
service php7.3-fpm start
service mysql start
mariadb < app/create_database.sql
service nginx restart
service php7.3-fpm restart
tail -f /dev/null
