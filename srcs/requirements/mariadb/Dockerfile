FROM alpine:3.16

ARG DB_NAME \
    DB_USER \
    DB_PASS \
    DB_ROOT

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client && \
    mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/docker.cnf; \
    # tee 는 표준입력으로 받은 것을 표준 출력과 파일로 보낼 수 있다.
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY requirements/mariadb/conf/create_db.sh .
RUN sh create_db.sh && rm create_db.sh
USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]
