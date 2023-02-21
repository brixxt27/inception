# Inception
### Summary: This document is a System Administration related exercise. Version: 1.3
# 공부 자료
### 네트워크 및 docker 기본 (서말 참고: https://seomal.com/map/1/129)
- 생활코딩
  - 도커 입문 수업: https://www.youtube.com/playlist?list=PLuHgQVnccGMDeMJsGq2O-55Ymtx0IdKWf
  - 도커 : 이미지 만드는 법 - Dockerfile & build: https://www.youtube.com/watch?v=0kQC19w0gTI
  - Docker compose 를 이용해서 복잡한 도커 컨테이너를 제어하기: https://www.youtube.com/watch?v=EK6iYRCIjYs
### docker official web service
- docker hub: https://hub.docker.com/
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
