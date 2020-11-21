#!/bin/sh
crossbar start &
gunicorn Server.wsgi --bind 0.0.0.0:3100 --preload --workers=2 --threads=1 --max-requests=500 --max-requests-jitter=100