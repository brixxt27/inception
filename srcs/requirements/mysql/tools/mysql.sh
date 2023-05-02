#!/bin/sh
mkdir -p /auth_pam_tool_dir/auth_pam_tool
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

/usr/bin/mysqld --user=mysql --console	