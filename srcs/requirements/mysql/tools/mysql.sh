#!/bin/sh
mkdir -p /run/mysqld/
mysql_install_db --user=mysql --ldata=/var/lib/mysql
mysqld --user=root --port=3306