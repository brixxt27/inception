version: '3'

volumes:
    data: {}
services:
    mariadb:
        image: debian:buster
        restart: always
        expose:
            - "3306"
        networks:
            - intra
        tty: true
    nginx:
        image: debian:buster
        restart: always
        ports:
            - "443:443"
        volumes:
            - data:/var/www/html
        networks:
            - intra
        tty: true
    wordpress:
        image: debian:buster
        restart: always
        volumes:
            - data:/var/www/html
        expose: 
            - "9000"
        networks:
            - intra
        tty: true
networks:
    intra:
        driver: bridge