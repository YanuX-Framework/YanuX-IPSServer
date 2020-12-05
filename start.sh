#!/bin/sh
if [ -z "$PORT" ]
then
    export PORT=3101
fi

crossbar start &
gunicorn Server.wsgi --bind 0.0.0.0:3100 --preload --workers=1 --threads=2 --max-requests=400 --max-requests-jitter=100