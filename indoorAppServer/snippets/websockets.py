import requests
import os


def publish(username,position):
    print('Publishing new message')
    payload = {'username': username,'position':position}
    port = os.environ.get("PORT")
    print('Heroku port: ' + str(port))
    response = requests.post("ws://127.0.0.1:9000/notify",
                  json={
                      'topic': 'onLocationUpdate',
                      'args': [payload]
                  })
    print(response.elapsed.total_seconds())