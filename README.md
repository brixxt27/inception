# Inception
### Summary: This document is a System Administration related exercise. Version: 1.3
# 공부 자료
### 네트워크 및 docker 기본 (서말 참고: https://seomal.com/map/1/129)
- 생활코딩
  - 도커 입문 수업: https://www.youtube.com/playlist?list=PLuHgQVnccGMDeMJsGq2O-55Ymtx0IdKWf
  - 도커 : 이미지 만드는 법 - Dockerfile & build: https://www.youtube.com/watch?v=0kQC19w0gTI
  - Docker compose 를 이용해서 복잡한 도커 컨테이너를 제어하기: https://www.youtube.com/watch?v=EK6iYRCIjYs
### docker official web service
- docker hub: https://hub.docker.com/0
- docker docs: https://docs.docker.com/engine/reference/run/
### process 및 docker
- 널널한 개발자
  - docker 전에 process부터!: https://www.youtube.com/watch?v=xewZYX1e5R8
  - 전공자 수준으로 docker 및 가상화 이해하기: https://www.youtube.com/watch?v=zh0OMXg2Kog&t=587s
### 추가 공부
- 생활코딩
  - Home server: https://www.youtube.com/watch?v=sQBXgccvE98&list=PLuHgQVnccGMA52uRBmSwqcvtI5IMoFclJ
- kakao tech(영상)
  - 이게 돼요? 도커 없이 컨테이너 만들기 / if(kakao)2022: https://www.youtube.com/watch?v=mSD88FuST80
- kakao enterprise, tech(글)
  - 서비스 개발자를 위한 컨테이너 뽀개기: (a.k.a 컨테이너 인터널) https://tech.kakaoenterprise.com/150
  - [컨테이너 인터널 #1] 컨테이너 톺아보기: https://tech.kakaoenterprise.com/154?category=882488
  - [컨테이너 인터널 #2] 컨테이너 파일시스템: https://tech.kakaoenterprise.com/171?category=882488
# Chapter 1
## Preamble 
One container is not enough. We need to go deeper!

# Chapter 2
## Introduction
이번 과제는 Docker를 사용함으로써 시스템 관리의 지식을 넓히는 것이 목적입니다. 당신은 여러 도커 이미지를 가상화할 것이며, 그들을 새 개인적인 가상머신에 만들 것입니다.

# Chapter 3
## General guidelines
- 이번 과제는 가상 머신에서 진행되어야 합니다.
- 당신의 프로젝트의 구성을 위해 요구되는 모든 파일들은 srcs 디렉토리에 위치해야 합니다.
- Makefile 또한 요구 되고, 이는 당신의 root 디렉토리에 있어야 합니다. Makefile 은 당신의 전체적인 application 세팅을 해야 합니다. (다시 말해서 이는 docker-compose.yml 파일을 사용하여 Docker image 들을 빌드 해야 합니다.)
- 이 과제는 당신이 아직 배우지 않은 기반 지식에 대한 개념을 실제로 적용하는 것이 필요합니다. 그러므로 우리는 이 과제를 완료하기 위해 유용한 것들 뿐 아니라 도커 이용에 관련된 많은 문서들을 읽는 것에 망설이지 않길 바랍니다.

# Chapter 4
## Mandatory part
- 이번 프로젝트는 특정 규칙에 따라 다양한 서비스로 구성된 소규모 인프라를 설정하는 것으로 구성됩니다. 전체적인 프로젝트는 가상 머신에서 진행되어야 한다. docker-compose 를 사용하세요!
- 각 도커 이미지는 서비스의 이름과 동일한 이름을 가져야 한다. 각 서비스는 그 서비스만을 위한 전용 컨테이너에서 실행되어야 한다. (즉, 하나의 컨테이너에는 하나의 서비스만 돌아가야 한다)
- 작업의 기본 환경으로, 컨테이너는 끝에서 두 번째 stable version 의 Alpine 또는 Debian 중 하나로 빌드해야 한다. 선택은 당신의 것입니다.
- 당신은 또한 각 서비스를 위한 자신만의 Dockerfiles 를 작성해야 합니다. Dockerfiles 은 Makefile 에 의해 docker-compose.yml 파일 안에서 호출 되어야 합니다.
- 이는 당신이 프로젝트의 도커 이미지를 스스로 빌드해야 한다는 점을 의미합니다.

### page 5
It is then forbidden to pull ready-made Docker images, as well as using services such as DockerHub
(Alpine/Debian being excluded from this rule).
도커 허브와 같은 서비스를 사용하는 것뿐 아니라 이미 만들어져 있는 도커 이미지를 pull 하는 것은 금지 됩니다.

- You then have to set up:
- 당신은 아래와 같이 설정해야 한다.

- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
- NGINX 를 포함하는 도커 컨테이너는 TLSv1.2 or TLSv1.3 만을 사용해야 한다.

- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
- WordPress + php-fpm (설치와 설정이 되어야 한다) 을 포함하는 도커 컨테이너는 nginx 없이 독립적인 컨테이너로 있어야 한다.

- A Docker container that contains MariaDB only without nginx.
- MariaDB 를 포함하는 도커 컨테이너는 nginx 없이 있어야 한다.

- A volume that contains your WordPress database.
- 당신의 WordPress database 를 포함하는 volume 

- A second volume that contains your WordPress website files.
- 당신의 WordPress website files 를 포함하는 두 번째 volume

- A docker-network that establishes the connection between your containers.
- 당신의 컨테이너들 사이의 연결을 만드는 docker-network

- Your containers have to restart in case of a crash.
- 당신의 컨테이너는 crash 같은 상황에 restart 되어야 한다.

- A Docker container is not a virtual machine.
- 도커 컨테이너는 가상 머신이 아니다.

- Thus, it is not recommended to use any hacky patch based on ’tail -f’ and so forth when trying to run it.
-  그러므로 'tail -f' 등의 기반으로 된 hacky patch 를 사용하는 것은 추천되지 않습니다.

- Read about how daemons work and whether it’s a good idea to use them or not.
- daemons 이 어떻게 작동하는지와, 그것을 사용하는 것이 좋은 것인지 나쁜 것인지 읽어 보세요.

### page 6
- Of course, using network: host or --link or links: is forbidden.
- 네트워크 사용할 때 주의할 점: host or --link or links 는 금지된다.

- The network line must be present in your docker-compose.yml file.
- 네트워크 라인은 docker-compose.yml 파일에 있어야 한다.

- Your containers musn’t be started with a command running an infinite loop.
- 당신의 컨테이너들은 무한 루프로 실행되는 명령어로 실행되면 안 된다.

- Thus, this also applies to any command used as entrypoint, or used in entrypoint scripts.
- 따라서, 이것은 또한 시작점에서 사용되거나 진입점 스크립트에서 사용되는 모든 명령어에 적용됩니다.

- The following are a few prohibited hack patches: tail -f, bash, sleep infinity, while true.
- 다음에 나오는 것들은 몇가지 hack patches 입니다.: tail -f, bash, sleep infinity, while true.

- Read about PID 1 and the best practices for writing Dockerfiles.
- PID 1과 Dockerfile 을 작성하기 위한 최고의 방법에 대해 읽어보세요!

- In your WordPress database, there must be two users, one of them being the administrator.
- 당신의 WordPress 데이터 베이스에 두 개의 유저가 있어야 하고, 그들 중 하나는 관리자여야 한다.

- The administrator’s username can’t contain admin/Admin or administrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and so forth).
- 관리자의 유저명은 admin/Admin 또는 administrator/Administrator 를 포함할 수 없습니다. (예를 들어 admin, administrator, Administrator, admin-123 등이 있습니다.)

- Your volumes will be available in the /home/login/data folder of the host machine using Docker.
- 당신의 volumes 은 도커를 사용하는 host machine 의 /home/login/data 폴더 안에서 사용 가능하다.

- Of course, you have to replace the login with yours.
- 물론, 당신은 로그인을 당신의 것으로 교체해야 한다.

- To make things simpler, you have to configure your domain name so it points to your local IP address.
- 
This domain name must be login.42.fr. Again, you have to use your own login.
For example, if your login is wil, wil.42.fr will redirect to the IP address pointing to
wil’s website.
The latest tag is prohibited.
No password must be present in your Dockerfiles.
It is mandatory to use environment variables.
Also, it is strongly recommended to use a .env file to store
environment variables. The .env file should be located at the root
of the srcs directory.
Your NGINX container must be the only entrypoint into your
infrastructure via the port 443 only, using the TLSv1.2 or TLSv1.3
protocol.

### page 7
Here is an example diagram of the expected result:
<img width="918" alt="image" src="https://user-images.githubusercontent.com/83959536/223052106-b5bfb626-56ab-42f7-bfe2-babcf3f5b8fa.png">



- Below is an example of the expected directory structure:
- 아래는 완성했을 때 예상되는 디렉토리 구조 예시입니다.
```
$> ls -alR
total XX
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 .
drwxrwxrwt 17 wil wil 4096 avril 42 20:42 ..
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 Makefile
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 srcs
./srcs:
total XX
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 ..
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 docker-compose.yml
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 .env
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 requirements
./srcs/requirements:
total XX
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 ..
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 bonus
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 mariadb
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 nginx
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 tools
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 wordpress
./srcs/requirements/mariadb:
total XX
drwxrwxr-x 4 wil wil 4096 avril 42 20:45 .
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 ..
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 conf
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 Dockerfile
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 .dockerignore
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 tools
[...]
./srcs/requirements/nginx:
total XX
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 ..
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 conf
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 Dockerfile
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 .dockerignore
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 tools
[...]
$> cat srcs/.env
DOMAIN_NAME=wil.42.fr
# certificates
CERTS_=./XXXXXXXXXXXX
# MYSQL SETUP
MYSQL_ROOT_PASSWORD=XXXXXXXXXXXX
MYSQL_USER=XXXXXXXXXXXX
MYSQL_PASSWORD=XXXXXXXXXXXX
[...]
$>
```
- For obvious security reasons, any credentials, API keys, env variables etc... must be saved locally in a .env file and ignored by git.
- 명백한 보안적 이유로, 어떠한 증명서, API key, 환경변수 등등... .env 안에 로컬로 저장해야 하며, gitignore 을 이용해 무시해야 한다. 

- Publicly stored credentials will lead you directly to a failure of the project.
- 공개적으로 저장된 증명서는 당신을 프로젝트의 실패로 직접 데려갈겁니다.

# Chapter 5
## Bonus part
### page 9
For this project, the bonus part is aimed to be simple.
A Dockerfile must be written for each extra service. Thus, each one of them will run
inside its own container and will have, if necessary, its dedicated volume.
Bonus list:
- Set up redis cache for your WordPress website in order to properly manage the
cache.
- Set up a FTP server container pointing to the volume of your WordPress website.
- Create a simple static website in the language of your choice except PHP (Yes, PHP
is excluded!). For example, a showcase site or a site for presenting your resume.
- Set up Adminer.
- Set up a service of your choice that you think is useful. During the defense, you
will have to justify your choice.
To complete the bonus part, you have the possibility to set up extra
services. In this case, you may open more ports to suit your needs.
The bonus part will only be assessed if the mandatory part is
PERFECT. Perfect means the mandatory part has been integrally done
and works without malfunctioning. If you have not passed ALL the
mandatory requirements, your bonus part will not be evaluated at all.

# Chapter 6
## Submission and peer-evaluation
Turn in your assignment in your Git repository as usual. Only the work inside your
repository will be evaluated during the defense. Don’t hesitate to double check the
names of your folders and files to ensure they are correct.
