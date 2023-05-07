mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

/usr/bin/mysqld --user=mysql --bootstrap << EOF
use mysql;
flush privileges;

alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';
flush privileges;

create database $MYSQL_DATABASE;
create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';
grant all privileges on $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';

flush privileges;
EOF

echo this is endpoint!

exec /usr/bin/mysqld --user=mysql --console	
