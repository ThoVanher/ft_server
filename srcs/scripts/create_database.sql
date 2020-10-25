CREATE DATABASE mydatabase;

CREATE USER 'thvanher'@'localhost' IDENTIFIED BY 'motdepasse';

GRANT ALL PRIVILEGES ON mydatabase.* TO 'thvanher'@'localhost' IDENTIFIED BY 'motdepasse';

FLUSH PRIVILEGES;

quit
