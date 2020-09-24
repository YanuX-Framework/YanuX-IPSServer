import requests


def publish(username,position):
    print('Publishing new message')
    payload = {'username': username,'position':position}
    response = requests.post("http://indoorlocationapp.herokuapp.com/notify",
                  json={
                      'topic': 'onLocationUpdate',
                      'args': [payload]
                  })