FROM python:3.9

WORKDIR /usr/src/app

RUN apt update && apt install -y libsnappy-dev

COPY . .
RUN python -m pip install -U pip && \
    pip install --no-cache-dir -r requirements.txt && \
    chmod +x start.sh && \
    mkdir -p save

ENV PORT=3101
EXPOSE 3101

CMD ./start.sh
