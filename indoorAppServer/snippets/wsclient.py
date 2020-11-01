from os import environ

from twisted.internet import reactor
from twisted.internet.defer import inlineCallbacks
from autobahn.twisted.wamp import Application
from autobahn.wamp.types import SubscribeOptions
from autobahn.twisted.wamp import ApplicationSession, ApplicationRunner
import requests
'''
# We create the WAMP client.
app = Application('monitoring')

# This is my machine's public IP since
# this client must be able to reach my server
# from the outside. You should change this value
# to the IP of the machine you put Crossbar.io
# and Django.
SERVER_HEROKU = 'indoorlocationapp.herokuapp.com'
SERVER_LOCAL = '127.0.0.1:8080'


@app.signal('onjoined')
def called_on_joined():
    """ Loop sending the state of this machine using WAMP every x seconds.
        This function is executed when the client joins the router, which
        means it's connected and authenticated, ready to send WAMP messages.
    """
    print("Connected")


def onChallenge(self, challenge):
    if challenge.method == "ticket":
        print("WAMP-Ticket challenge received: {}".format(challenge))
        return "secretticket"
    else:
        raise Exception("Invalid authmethod {}".format(challenge.method))


# We subscribe to the "clientconfig" WAMP event.
@app.subscribe('onLocationUpdate')
def update_configuration(args):
    """ Update the client configuration when Django asks for it. """
    print("ARRIVED HERE WITH ARGS: " + str(args))


# We start our client.
if __name__ == '__main__':
    print("Principal '{}' using ticket '{}'".format("client1", "secretticket"))
    app.run(url=u"ws://%s/ws" % SERVER_LOCAL)
    # app.run(url='ws://{}:8080/ws'.format(SERVER))'''
import os
import sys

from twisted.internet import reactor
from twisted.internet.defer import inlineCallbacks

from autobahn.twisted.wamp import ApplicationSession
from autobahn.wamp.types import PublishOptions

# principal from command line, ticket from environment variable
PRINCIPAL = "client1"
PRINCIPAL_TICKET = "secretticket"

print("Principal '{}' using ticket '{}'".format(PRINCIPAL, PRINCIPAL_TICKET))


class ClientSession(ApplicationSession):

    def onConnect(self):
        print("Client session connected. Starting WAMP-Ticket authentication on realm '{}' as principal '{}' ..".format(self.config.realm, PRINCIPAL))
        self.join(self.config.realm, ["ticket"], PRINCIPAL)

    def onChallenge(self, challenge):
        if challenge.method == "ticket":
            print("WAMP-Ticket challenge received: {}".format(challenge))
            return PRINCIPAL_TICKET
        else:
            raise Exception("Invalid authmethod {}".format(challenge.method))

    @inlineCallbacks
    def onJoin(self, details):
        print("Client session joined: {}".format(details))
        print("\nHooray! We've been successfully authenticated with WAMP-Ticket using static configuration!\n")

        ## publish to a couple of topics we are allowed to publish to.
        ##

        self.leave()

    def onLeave(self, details):
        print("Client session left: {}".format(details))
        self.disconnect()

    def onDisconnect(self):
        print("Client session disconnected.")
        reactor.stop()


if __name__ == '__main__':

    from autobahn.twisted.wamp import ApplicationRunner

    runner = ApplicationRunner(url='ws://localhost:8080/ws', realm='realm1')
    runner.run(ClientSession)
