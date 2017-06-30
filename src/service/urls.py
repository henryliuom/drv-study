from django.conf.urls import include, url
from service.views import *

urlpatterns = [
    url(r'^iptables/$', iptables, name=''),
    url(r'^projects/$', projects, name=''),
    url(r'^projectmodify/$', Projectadd, name=''),
    url(r'^projectmodify/(?P<pk>[0-9]+)$', Projectmodify, name=''),
    url(r'^services/$', services, name=''),
    url(r'^servicemodify/(?P<pk>[0-9]+)$', Servicemodify, name=''),
]