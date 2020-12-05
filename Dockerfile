FROM python:3.8

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN python -m pip install -U pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir -r requirements-extras.txt

COPY . .
RUN chmod +x start.sh && mkdir -p save

ENV PORT=3101
EXPOSE 3101

CMD ./start.sh