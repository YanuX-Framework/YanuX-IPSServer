# Indoor Positioning Server
This is the server-side component of our __Indoor Positioning Solution__ for the [__YanuX Framework__](https://yanux-framework.github.io/).

It is built in [Python](https://www.python.org/) and uses [Django](https://www.djangoproject.com/) and the [Django REST Framework](https://www.django-rest-framework.org/) to provide a __REST API__ that the __Indoor Positioning Clients__ can use to submit scanning information.

Based on the information received by the clients it can then decide which positioning methods and techniques should be used to determine the absolute and/or relative position of the devices running those clients. 

The decision engine is built using __fuzzy logic__ using [__scikit-fuzzy__](https://github.com/scikit-fuzzy/scikit-fuzzy). Most of the employed data analysis and machine learning algorithms come from [__scikit-learn__](https://scikit-learn.org/).

### TODO:
- Provide additional documentation.

## License
This work is licensed under [__GNU Affero General Public License Version 3__](LICENSE)