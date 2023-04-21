FROM	alpine:3.16.5
RUN		apk update && \
		apk upgrade && \
		apk add --no-cache bash \
		nginx \
		openssl
ADD 	conf/default.conf /etc/nginx/http.d/default.conf
CMD		["chown", "-R", "nginx:nginx", "/etc/nginx/http.d"]
CMD		["chmod", "-R", "755", "/etc/nginx/http.d"]
CMD		["nginx", "-g", "daemon off;"]