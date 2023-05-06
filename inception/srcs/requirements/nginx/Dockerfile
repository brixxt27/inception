FROM alpine:3.16

RUN  apk update && apk upgrade && apk add --no-cache nginx && \
     apk add openssl && \
     mkdir -p /etc/nginx/ssl && \
     openssl req -x509 -nodes \
     -days 365 \
     -newkey rsa:2048 \
     -keyout /etc/nginx/ssl/jayoon.42.fr.key \
     -out /etc/nginx/ssl/jayoon.42.fr.crt \
     -subj "/C=KR/ST=Seoul/O=42Seoul/OU=jayoon/CN=inception/" &&\
     chown nginx /etc/nginx/ssl/jayoon.42.fr.crt && \
     chown nginx /etc/nginx/ssl/jayoon.42.fr.key

EXPOSE 443

COPY ./requirements/nginx/conf/* /etc/nginx/http.d/

CMD ["nginx", "-g", "daemon off;"]
