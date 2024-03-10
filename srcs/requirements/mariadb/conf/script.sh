#!/bin/bash

sed -i "s|skip-networking|# skip-networking|g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

sed -i '/\[client-server\]/a\
            port = 3306\n\
            # socket = /run/mysqld/mysqld.sock\n\
            \n\
            !includedir /etc/mysql/conf.d/\n\
            !includedir /etc/mysql/mariadb.conf.d/\n\
            \n\
            [mysqld]\n\
            user = root\n\
            \n\
            [server]\n\
            bind-address = 0.0.0.0' /etc/mysql/my.cnf

echo "CNF File Modified"

service mysql start

mysql -u root -e "CREATE DATABASE $WP_DATABASE;"
mysql -u root -e "CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $WP_DATABASE.* TO '$WP_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -e "CREATE USER '$WP_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $WP_DATABASE.* TO '$WP_ADMIN'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -e "CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';"
# mysql -u root -e "FLUSH PRIVILEGES";

echo "Database Setup Complete"

mysqladmin shutdown

mysqld --bind-address=0.0.0.0