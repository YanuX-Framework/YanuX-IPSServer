FROM heroku/miniconda:3

RUN conda install python-snappy
RUN python -V
# Grab requirements.txt.
ADD ./requirements.txt /tmp/requirements.txt

RUN ls
RUN conda install pip
RUN conda install setuptools
# Install dependencies
RUN conda/v install --upgrade -qr /tmp/requirements.txt

# Add our code
ADD ./indoorlocationapp /opt/indoorlocationapp/
WORKDIR /opt/indoorlocationapp

CMD gunicorn --bind 0.0.0.0:$PORT wsgi