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






--------------
mysql -u root -p"$MYSQL_ROOT_PASSWORD"<<-EOSQL
        CREATE DATABASE $MYSQL_DATABASE;
EOSQL


-----------------
mkdir -p /auth_pam_tool_dir/auth_pam_tool
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

/usr/bin/mysqld --user=mysql --console	
openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
------------------
#!/bin/sh
touch /run/openrc/softlevel
openrc

touch /auth_pam_tool_dir

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

mysql -u root << EOSQL
	alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';
	flush privileges;

	create database $MYSQL_DATABASE;
	create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';
	grant all privileges on $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';

	flush privileges;
EOSQL

echo "Hello MySQL!"
/usr/bin/mysqld --user=mysql --console	








------------------
#!/bin/sh
touch /run/openrc/softlevel
openrc

#mkdir -p /auth_pam_tool_dir/auth_pam_tool
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
#mysql_install_db --user=mysql --ldata=/var/lib/mysql

/usr/bin/mysqld --user=mysql --bootstrap << ESQL
use mysql;
flush privileges;

alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';
flush privileges;

create database $MYSQL_DATABASE;
create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';
grant all privileges on $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';

flush privileges;
ESQL

# demon 이 켜지지 않은 상태에서 mysql 을 실행하면 soket 이 생성되지 않는다.
# 그러면 mysql client 를 실행할 수 없다면서 에러가 발생한다.
#mysql -u root << EOSQL
#	alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';
#	flush privileges;

#	create database $MYSQL_DATABASE;
#	create user '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';
#	grant all privileges on $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';

#	flush privileges;
#EOSQL

echo "Hello MySQL!"
#/usr/bin/mysqld --user=mysql --console	
# mysql(-server) 를 데몬으로 실행함. 평소 내가 알고 있는 mysql 과 mariadb 를 실행하는 것은 client 로 실행하는 것이다.
# 아래를 실행해야 soket 이 생성되면서 mysql(mariadb) 를 실행할 수 있다.
/usr/bin/mysqld --user=mysql &