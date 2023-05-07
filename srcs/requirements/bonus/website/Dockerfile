FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nginx && \
    echo "server {" > /etc/nginx/http.d/default.conf && \
    echo "listen 1000 default_server;" >> /etc/nginx/http.d/default.conf && \
    echo "listen [::]:1000 default_server;" >> /etc/nginx/http.d/default.conf && \
    echo "root    /var/www/html;" >> /etc/nginx/http.d/default.conf && \
    echo "location / {" >> /etc/nginx/http.d/default.conf && \
    echo "    try_files \$uri /index.html;" >> /etc/nginx/http.d/default.conf && \
    echo "}}" >> /etc/nginx/http.d/default.conf

COPY requirements/bonus/website/conf/* /var/www/html/

EXPOSE 1000

CMD ["nginx", "-g", "daemon off;"]
