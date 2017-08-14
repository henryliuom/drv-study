from django.conf.urls import url
from views import *

urlpatterns = [
    url(r'^projects/$', projects, name=''),
    url(r'^projects/(?P<pk>[0-9]+)$', projects, name=''),
    url(r'^projectmodify/(?P<pk>[0-9]+)$', projectmodify, name=''),
    url(r'^idcs/$', idcs, name=''),
    url(r'^idcs/(?P<pk>[0-9]+)$', idcs, name=''),
    url(r'^idcmodify/(?P<pk>[0-9]+)$', idcmodify, name=''),
    url(r'^servers/$', servers, name=''),
    url(r'^servers/(?P<pk>[0-9]+)$', servers, name=''),
    url(r'^servermodify/(?P<pk>[0-9]+)$', servermodify, name=''),
    url(r'^services/$', services, name=''),
    url(r'^services/(?P<pk>[0-9]+)$', services, name=''),
    url(r'^servicemodify/(?P<pk>[0-9]+)$', servicemodify, name=''),
]