FROM alpine:3.16.5
# php8 설치
RUN apk update && apk upgrade && \
    apk add php8 && \
    apk add php8-fpm && \
    apk add php8-phar && \
    apk add php8-json && \
    apk add php8-exif && \
    apk add php8-mysqli && \
	apk add php8-mysqlnd && \
    apk add php8-openssl && \
    apk add mariadb-client && \
    apk add curl iputils
    
EXPOSE 9000

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/bin/wp

ADD config/www.conf /etc/php8/php-fpm.d/www.conf
ADD config/wp-config.php /tmp/wp-config.php
ADD script/wordpress.sh /tmp/wordpress.sh

CMD ["/bin/sh", "/tmp/wordpress.sh"]