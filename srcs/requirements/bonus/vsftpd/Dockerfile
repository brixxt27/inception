FROM alpine:3.16

ARG FTP_USR \
    FTP_PWD

RUN apk update && apk upgrade && \
    apk add --no-cache vsftpd && \
    adduser -h /var/www -s /bin/false -D ${FTP_USR} && \
    # -h: home directory 설정, -s: shell 사용하지 않음 설정, -D: user 생성 후 login 할 수 없도록 설정
    echo "${FTP_USR}:${FTP_PWD}" | /usr/sbin/chpasswd && \
    # user 생성 후 password 설정
    adduser ${FTP_USR} root && \
    sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g"  /etc/vsftpd/vsftpd.conf && \
    # chroot_local_user: 로그인한 사용자의 홈 디렉토리를 root 로 설정
    sed -i "s|#local_enable=YES|local_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
    # local_enable: 로컬 사용자의 로그인을 허용
    sed -i "s|#write_enable=YES|write_enable=YES|g"  /etc/vsftpd/vsftpd.conf && \
    # write_enable: 로컬 사용자의 파일 쓰기를 허용
    sed -i "s|#local_umask=022|local_umask=007|g"  /etc/vsftpd/vsftpd.conf && \
    # local_umask: 로컬 사용자의 파일 생성시 umask 설정
    echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf &&\
    # allow_writeable_chroot: chroot_local_user 설정시 write_enable 설정을 허용
    echo 'seccomp_sandbox=NO' >> /etc/vsftpd/vsftpd.conf && \
    # seccomp_sandbox: seccomp sandboxing 을 사용하지 않음. Seccomp-BPF는 시스템 콜을 필터링하여 vsftpd에 대한 공격 벡터를 최소화하는 보안 기능입니다.
    echo 'pasv_enable=YES' >> /etc/vsftpd/vsftpd.conf
    # pasv_enable: passive mode 사용
# 원하는 volume 으로 마운트 하고 싶다면 docker-compose.yml 에서 volume 을 설정해주면 된다.

WORKDIR /var/www

EXPOSE 21

CMD [ "/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf" ]
