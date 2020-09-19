FROM heroku/miniconda

RUN python -V
RUN conda install python-snappy
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
# Grab requirements.txt.
ADD ./requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip install -qr /tmp/requirements.txt

# Add our code
ADD ./indoorlocationapp /opt/indoorlocationapp/
WORKDIR /opt/indoorlocationapp

CMD gunicorn --bind 0.0.0.0:$PORT wsgi