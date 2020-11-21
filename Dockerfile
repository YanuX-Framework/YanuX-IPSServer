FROM python:3.8

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN chmod +x /start.sh

ENV PORT=3101
EXPOSE 3101

CMD ["/start.sh"]