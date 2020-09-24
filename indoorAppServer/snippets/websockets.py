import requests
import os


def publish(username,position):
    print('Publishing new message')
    payload = {'username': username,'position':position}
    response = requests.post("http://127.0.0.1/notify",
                  json={
                      'topic': 'onLocationUpdate',
                      'args': [payload]
                  })
    print(response.elapsed.total_seconds())