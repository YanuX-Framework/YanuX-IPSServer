FROM heroku/miniconda:3

RUN conda update conda
# The problem with dependencies comes from a lower python version I assume. In order to deploy all dependencies I have to stop
# brute forcing them by conda install and check first and foremost if python version can be updated to the current version on the local server
RUN conda install -c anaconda python=3.7.4
RUN python -V
RUN conda install python-snappy


# Grab requirements.txt.
ADD ./requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip install -r /tmp/requirements.txt

# Add our code
ADD . /opt/indoorlocationapp/
WORKDIR /opt/indoorlocationapp

CMD gunicorn --bind 0.0.0.0:$PORT Server.wsgi
