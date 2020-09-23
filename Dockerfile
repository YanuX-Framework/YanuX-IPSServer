FROM heroku/miniconda:3

RUN conda update python
RUN conda install python-snappy
RUN conda install psycopg2
RUN pip install --upgrade pip
RUN which -a pip
RUN conda install setuptools
RUN conda install six
RUN conda install pyasn1
RUN conda install psutil
RUN conda install pycparser
# Grab requirements.txt.
ADD ./requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip install -r /tmp/requirements.txt

# Add our code
ADD . /opt/indoorlocationapp/
WORKDIR /opt/indoorlocationapp

CMD gunicorn --bind 0.0.0.0:$PORT Server.wsgi