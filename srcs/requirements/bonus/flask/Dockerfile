FROM python:alpine3.16

COPY ./requirements/bonus/flask/conf/requirements.txt requirements.txt

RUN pip install -r requirements.txt
# 특정 python 라이브러리 설치 명령어

COPY ./requirements/bonus/flask/tools/app.py /app/

WORKDIR /app

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
