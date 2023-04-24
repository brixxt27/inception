FROM alpine:3.16.5
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    nginx \
    openssl \
	vim
ADD ./conf/default.conf /etc/nginx/http.d/default.conf
#RUN chown -R nginx:nginx /var/lib/nginx && \
#    chown -R nginx:nginx /var/log/nginx && \
#    chown -R nginx:nginx /etc/nginx && \
#    chmod -R 755 /var/lib/nginx && \
#    chmod -R 755 /var/log/nginx && \
#    chmod -R 755 /etc/nginx
COPY tools/nginx.sh /shellscript/nginx.sh
CMD ["/bin/sh", "/shellscript/nginx.sh"]