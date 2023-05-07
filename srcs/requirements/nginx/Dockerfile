FROM alpine:3.16
RUN  apk update && apk upgrade && apk add --no-cache nginx && \
     apk add openssl && \
     mkdir -p /etc/nginx/ssl && \
     openssl req -x509 -nodes \
     # openSSL 을 사용하여 SSL 인증서 생성, X.509 란 인증서를 생성하고 관리하는 데 사용되는 표준, -nodes 는 인증서를 암호화하지 않고 생성하겠다는 의미
     -days 365 \
     # 생성된 인증서의 유효기간을 365일로 설생
     -newkey rsa:2048 \
     # RSA 알고리즘을 사용하여 2048비트의 개인키를 생성
     -keyout /etc/nginx/ssl/jayoon.42.fr.key \
     # 생성된 개인키를 특정 경로에 저장
     -out /etc/nginx/ssl/jayoon.42.fr.crt \
     # 생성된 공개 키를 특정 경로에 저를
     -subj "/C=KR/ST=Seoul/O=42Seoul/OU=jayoon/CN=inception/" &&\
     # 인증서에 포함될 정보 설정 국가(C), 지역(ST), 조직(O), 부서(OU), 일반 이름(CN)
     chown nginx /etc/nginx/ssl/jayoon.42.fr.crt && \
     chown nginx /etc/nginx/ssl/jayoon.42.fr.key
EXPOSE 443
COPY ./requirements/nginx/conf/default.conf /etc/nginx/http.d/default.conf
# 443 포트로만 열려 있게 하기 위해선 기존 default.conf 파일을 삭제하고 새로운 default.conf 파일을 복사해야 함
CMD ["nginx", "-g", "daemon off;"]
