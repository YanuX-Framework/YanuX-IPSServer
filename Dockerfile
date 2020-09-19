FROM heroku/miniconda

RUN conda install python-snappy

CMD gunicorn --bind 0.0.0.0:$PORT wsgi