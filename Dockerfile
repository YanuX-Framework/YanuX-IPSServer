FROM python:3.10

WORKDIR /usr/src/app

RUN apt update && apt install -y libsnappy-dev

COPY . .
RUN python -m pip install -U pip && \
    pip install --no-cache-dir -r requirements.txt && \
    #NOTE: Probably not needed to be constantly run on production.
    #python manage.py makemigrations indoorAppServer \
    #python manage.py migrate indoorAppServer \
    chmod +x start.sh && \
    mkdir -p save

ENV PORT=3101
EXPOSE 3101

CMD ./start.sh
