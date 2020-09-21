FROM heroku/miniconda:3

RUN conda update python
RUN conda install python-snappy
RUN conda install psycopg2
RUN pip install --upgrade pip
RUN which -a pip
RUN conda install setuptools
RUN conda install gunicorn
# Grab requirements.txt.
ADD ./requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip install -qr /tmp/requirements.txt

# Add our code
ADD . /opt/indoorlocationapp/
WORKDIR /opt/indoorlocationapp
