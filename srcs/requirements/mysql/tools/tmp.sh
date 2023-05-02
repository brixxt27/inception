mkdir -p /run/mysqld/
mysql_install_db --user=mysql --ldata=/var/lib/mysql

/usr/bin/mysqld --user=mysql --bootstrap << EOF

ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';

create database '$MYSQL_DATABASE';
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';

GRANT ALL PRIVILEGES ON '$MYSQL_DATABASE'.* TO '$MYSQL_USER'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

mysqld --user=root --port=3306

------------------------------------
#!/bin/sh
mkdir -p /auth_pam_tool_dir/auth_pam_tool
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

/usr/bin/mysqld --user=mysql --bootstrap << EOF
use mysql;
flush privileges;

alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';
flush privileges;

create database '$MYSQL_DATABASE';
create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';
grant all privileges on $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';

flush privileges;
EOF

echo this is endpoint!

exec /usr/bin/mysqld --user=mysql --console	