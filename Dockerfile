# 실행할 이미지 이름을 입력한다.
FROM ubuntu:20.04
# 지정된 명령어를 실행한다.
RUN apt update && apt install -y python3
# 디렉토리를 생성하고, 사용자의 PWD(Present Working Directory)를 이 디렉토리로 바꾼다.
WORKDIR /var/www/html
# /var/www/html/ 에 index.html 을 작성, 그러나 이것보다 Host 에서 작성한 파일을 가져오는 게 접근성이 더 좋음
# RUN echo "Hello, <strong>Docker</strong>" > index.html
# Host 에 있는 index.html 을 컨테이너 현재 디렉토리 "."로 COPY 한다.
COPY ["index.html", "."]
# RUN 은 빌드가 되는 시점에서 실행되는 명령어, 이미지에 반영됨.
# CMD 는 컨테이너가 실행될 때 실행되는 명령어, 컨테이너에 반영됨.
CMD ["python3", "-u", "-m", "http.server"]