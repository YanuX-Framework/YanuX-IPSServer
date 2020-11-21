web: crossbar start
django: gunicorn Server.wsgi --bind 0.0.0.0:3100 --preload --workers=1 --max-requests=250 --max-requests-jitter=50