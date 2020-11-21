FROM python:3.8

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PORT=3101
EXPOSE 3101

CMD gunicorn Server.wsgi --bind 0.0.0.0:3100 --preload --workers=1 --max-requests=250 --max-requests-jitter=50; crossbar start