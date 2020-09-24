from autobahn.twisted import sleep
from autobahn.twisted.wamp import ApplicationSession
import requests

from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from twisted.internet.defer import inlineCallbacks
from autobahn.twisted.wamp import ApplicationSession, ApplicationRunner
from os import environ
import sys
import os


def publish(username,position):
    print('Publishing new message')
    payload = {'username': username,'position':position}
    print('Retrieving Port stated by heroku')

    ON_HEROKU = os.environ.get('ON_HEROKU')
    if ON_HEROKU:
        port = str(os.environ.get("PORT",9000))
    else:
        port = 8080
    print('Heroku post: ' + port)
    requests.post("http://127.0.0.1:"+port+"/notify",
                  json={
                      'topic': 'onLocationUpdate',
                      'args': [payload]
                  })