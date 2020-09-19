FROM heroku/miniconda:3

RUN ls
RUN conda update python
RUN python -V
RUN conda install python-snappy
RUN conda install psycopg2
RUN conda install wheel
RUN conda install pip
RUN which -a pip
RUN conda install setuptools

# Grab requirements.txt.
ADD ./requirements.txt /tmp/requirements.txt

# Install dependencies
RUN /opt/conda/bin/pip install -qr /tmp/requirements.txt

# Add our code
ADD ./indoorlocationapp /opt/indoorlocationapp/
WORKDIR /opt/indoorlocationapp

CMD gunicorn --bind 0.0.0.0:$PORT wsgi