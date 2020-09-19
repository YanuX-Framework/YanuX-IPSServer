FROM heroku/miniconda:3

RUN conda install python-snappy
RUN python -V
# Grab requirements.txt.
ADD ./requirements.txt /tmp/requirements.txt

RUN ls
RUN which -a pip
RUN conda install pip
RUN conda install setuptools
# Install dependencies
RUN /opt/conda/bin/pip install -qr /tmp/requirements.txt

# Add our code
ADD ./indoorlocationapp /opt/indoorlocationapp/
WORKDIR /opt/indoorlocationapp

CMD gunicorn --bind 0.0.0.0:$PORT wsgi