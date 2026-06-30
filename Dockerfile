FROM python:3.14

WORKDIR /app

COPY . .

RUN pip install django==6.0.6

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
