#!/bin/sh
export PORT=${VARIABLE:-3101}

crossbar start &
gunicorn Server.wsgi --bind 0.0.0.0:3100 --preload --workers=1 --threads=2 --max-requests=400 --max-requests-jitter=100