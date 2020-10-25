openssl req -x509 -nodes -days 200 -newkey rsa:2048 -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt -subj "/C=FR/ST=LILLE/L=LAMADELEINE/O=19school"
