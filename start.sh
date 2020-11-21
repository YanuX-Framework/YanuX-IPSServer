#!/bin/sh
crossbar start &
gunicorn Server.wsgi --bind 0.0.0.0:3100 --preload --worker-class=gthread --workers=2 --threads=2 --max-requests=250 --max-requests-jitter=50