#!/bin/sh
crossbar start &
gunicorn Server.wsgi --bind 0.0.0.0:3100 --preload --worker-class=gthread --workers=1 --threads=4 --max-requests=250 --max-requests-jitter=50