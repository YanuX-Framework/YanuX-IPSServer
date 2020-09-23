FROM heroku/miniconda:3

RUN conda update conda
RUN python -V
# The problem with dependencies comes from a lower python version I assume. In order to deploy all dependencies I have to stop
# brute forcing them by conda install and check first and foremost if python version can be updated to the current version on the local server
RUN conda install -c anaconda python=3.7.4
RUN python -V
RUN conda install python-snappy
RUN conda install psycopg2
#RUN pip install --upgrade pip
#RUN pip install setuptools --upgrade
#RUN conda install setuptools
#RUN conda install six
#RUN conda install pyasn1
#RUN conda install psutil
#RUN conda install pycparser
#RUN conda install setproctitle

# Grab requirements.txt.
ADD ./requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip install -r /tmp/requirements.txt

# Add code
ADD . /opt/indoorlocationapp/
WORKDIR /opt/indoorlocationapp

# Run app
CMD gunicorn --bind 0.0.0.0:$PORT Server.wsgi
