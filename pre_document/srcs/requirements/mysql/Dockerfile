FROM	alpine:3.16.5
RUN	    apk update && apk upgrade && \
		apk add --no-cache \
		bash \
		vim \
		openrc \
		mariadb mariadb-client
RUN		mkdir -p /run/mysqld
RUN		chown -R mysql:mysql /run/mysqld
#RUN		mkdir -p /var/lib/mysql
#RUN		chown -R mysql:mysql /var/lib/mysql
COPY	./conf/mariadb-server.conf /etc/my.cnf.d/mariadb-server.cnf
COPY	./tools/mysql.sh /tools/mysql.sh
EXPOSE	3306
CMD 	["/bin/sh", "/tools/mysql.sh"]

#RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN chmod +x wp-cli.phar
#RUN	mv wp-cli.phar /usr/bin/wp

#ADD config/wordpress.conf /etc/php8/php-fpm.d/www.conf