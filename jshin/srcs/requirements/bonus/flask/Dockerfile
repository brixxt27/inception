FROM python:alpine3.16

COPY ./requirements/bonus/flask/conf/requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY ./requirements/bonus/flask/tools/app.py /app/

WORKDIR /app

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
