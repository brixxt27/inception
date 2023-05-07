FROM alpine:3.16

ARG PHP_VERSION=8 \
    DB_NAME \
    DB_USER \
    DB_PASS

RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-phar \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-mysqlnd \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-redis \
    php${PHP_VERSION}-ctype \
    wget \
    unzip \
    curl \
    iputils && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;clear_env = no|clear_env = no|g" \
      /etc/php8/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

WORKDIR /var/www/html


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/bin/wp

COPY ./requirements/wordpress/conf/wp-config-create.sh .
COPY ./requirements/wordpress/tools/script.sh .

RUN sh wp-config-create.sh && rm wp-config-create.sh
# RUN 명령은 빌드타임 명령어이다. 이미지 빌드 중 wp-config-create.sh를 실행하면서 wp-config.php 파일을 생성하기 때문에 ARG로 받은 DB_NAME, DB_USER, DB_PASS를 사용할 수 있다.

CMD ["/bin/sh", "/var/www/html/script.sh"]
