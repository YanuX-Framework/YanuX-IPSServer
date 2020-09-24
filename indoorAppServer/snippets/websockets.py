import requests


def publish(username,position):
    print('Publishing new message')
    payload = {'username': username,'position':position}
    response = requests.post("http://localhost:9055/notify",
                  json={
                      'topic': 'onLocationUpdate',
                      'args': [payload]
                  })
    print(str(response))
    return 200