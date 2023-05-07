FROM        alpine:3.16

RUN         apk update && apk upgrade && \
            apk add --no-cache \
            openrc \
            vim \
            bash \
            mysql mysql-client \
            curl

EXPOSE      3306

RUN			mkdir -p /run/mysqld
RUN			chown -R mysql:mysql /run/mysqld

RUN			mkdir -p /var/lib/mysql
RUN			chown -R mysql:mysql /var/lib/mysql

COPY        /script/mariadb.sh  /tmp/mariadb.sh
ADD         ./config/mariadb-server.conf /etc/my.cnf.d/mariadb-server.cnf

CMD         ["sh", "tmp/mariadb.sh"]
