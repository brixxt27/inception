FROM ubuntu:20.04
RUN apt update && apt install -y python3
WORKDIR /var/www/html
COPY . /var/www/html/
# CMD ["python3", "-u", "-m", "http.server"]
RUN python3 -u -m http.server