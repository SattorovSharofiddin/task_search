FROM python:3.11-alpine

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

#COPY ./compose/django/celery/worker/start /start-celeryworker
#RUN sed -i 's/\r$//g' /start-celeryworker
#RUN chmod +x /start-celeryworker
#
#COPY ./compose/django/celery/beat/start /start-celerybeat
#RUN sed -i 's/\r$//g' /start-celerybeat
#RUN chmod +x /start-celerybeat
#
#COPY ./compose/django/celery/flower/start /start-flower
#RUN sed -i 's/\r$//g' /start-flower
#RUN chmod +x /start-flower

WORKDIR /app
COPY . /app
RUN --mount=type=cache,id=custom-pip,target=/root/.cache/pip pip install -r /app/requirements.txt && pip install gunicorn


CMD python manage.py makemigrations && python manage.py migrate && python manage.py collectstatic --noinput && gunicorn root.wsgi:application --bind 0.0.0.0:8000