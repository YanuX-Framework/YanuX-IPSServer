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
    requests.post("https://indoorlocationapp.herokuapp.com/notify",
                  json={
                      'topic': 'onLocationUpdate',
                      'args': [payload]
                  })