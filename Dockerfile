FROM debian:buster

#Mise a jour des paquets et installations des commandes et outils nécessaires
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install sudo -y
RUN apt-get install vim -y
RUN apt-get install openssl -y

#Copie des différents scripts dans app
COPY srcs/scripts/. app/

#Installation du paquet Nginx
#Copie du fichier de configuration du serveur localhost et supression du fichier de configuration par defaut.
#Génération du certificat ssl
RUN apt-get install nginx -y
RUN sh app/org_folders.sh
COPY srcs/nginx/server etc/nginx/sites-enabled/
RUN sh app/gen_certificate.sh

#Installation des paquets MariaDb/Mysql 
RUN apt-get install mariadb-server mariadb-client -y

#Copie du paquet Wordpress avec son fichier de configuration depuis srcs
COPY srcs/Wordpress/. var/www/html/Wordpress/

#Installation des différents paquets PHP nécessaires et copie du Paquet phpMyAdmin avec son fichier de configuration depuis srcs
RUN apt-get install php-cgi php-fpm php-mbstring php-zip php-gd php-xml-util php-mysql -y
COPY srcs/phpMyAdmin/. var/www/html/phpMyAdmin/

#Propriété du dossier html donné à www-data
RUN sudo chown -R www-data:www-data /var/www/html/*

#Exposition des ports entre les containers qui seront créés depuis l'image et la machine hôte.
EXPOSE 80 443

#script de lancement des différents services avec un sous-script de création de la base de donné
CMD sh app/start_services.sh

