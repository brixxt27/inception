FROM alpine:3.16.5
# php8 설치
RUN	    apk update && apk upgrade && \
		apk add --no-cache \
		bash \
		vim \
		openrc \
		curl \
		mysql-client \
		php8 php8-fpm php8-mysqli php8-json php8-openssl php8-curl php8-zlib php8-xml php8-phar php8-intl php8-dom php8-xmlreader php8-ctype php8-mbstring php8-gd
EXPOSE	9000
COPY	./conf/www.conf /etc/php8/php-fpm.d/www.conf
# wp-config.php 파일을 cli 로 만들기 때문에 따로 복사할 필요가 없을 것이다.
#COPY	./conf/wp-config.php /
COPY    tools/wordpress.sh /tools/wordpress.sh
CMD		["/bin/sh", "/tools/wordpress.sh"]

#ADD config/wp-config.php /tmp/wp-config.php
#ADD script/wordpress.sh /tmp/wordpress.sh
#RUN		curl -o /tmp/wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz && \
#		tar -xzf /tmp/wordpress.tar.gz -C /tmp/ && \
#		cp -R /tmp/wordpress/* /var/www/html/ && \
#		ls -al /var/www/html/
#CMD		["php-fpm8", "-F"]

#CMD ["/bin/sh", "/tmp/wordpress.sh"]

#RUN apk update && apk upgrade && \
#    apk add php8 && \
#    apk add php8-fpm && \
#    apk add php8-phar && \
#    apk add php8-json && \
#    apk add php8-exif && \
#    apk add php8-mysqli && \
#	apk add php8-mysqlnd && \
#    apk add php8-openssl && \
#    apk add mariadb-client && \
#    apk add curl iputils