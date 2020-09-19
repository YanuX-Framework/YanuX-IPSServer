FROM heroku/miniconda:3

RUN conda install python-snappy
RUN python -V
# Grab requirements.txt.
ADD ./requirements.txt /tmp/requirements.txt

RUN pip install --upgrade pip
RUN conda install --upgrade setuptools
# Install dependencies
RUN pip install -qr /tmp/requirements.txt

# Add our code
ADD ./indoorlocationapp /opt/indoorlocationapp/
WORKDIR /opt/indoorlocationapp

CMD gunicorn --bind 0.0.0.0:$PORT wsgi