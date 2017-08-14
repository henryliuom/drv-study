from django.conf.urls import url
from views import *

urlpatterns = [
    url(r'^staffs/$', staffs, name=''),
    url(r'^staffs/(?P<pk>[0-9]+)$', staffs, name=''),
    url(r'^staffmodify/(?P<pk>[0-9]+)$', staffmodify, name=''),
    url(r'^groups/$', groups, name=''),
    url(r'^groups/(?P<pk>[0-9]+)$', groups, name=''),
    url(r'^groupmodify/(?P<pk>[0-9]+)$', groupmodify, name=''),
]