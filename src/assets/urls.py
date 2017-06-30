from django.conf.urls import include, url
from assets.views import *

urlpatterns = [
    url(r'^serveradd/$', serverlist, name=''),
    url(r'^servermodify/$', Serveradd, name=''),
    url(r'^servermodify/(?P<pk>[0-9]+)$', Servermodify, name=''),
    url(r'^idcadd/$', idclist, name=''),
    url(r'^idcmodify/$', Idcadd, name=''),
    url(r'^idcmodify/(?P<pk>[0-9]+)$', Idcmodify, name=''),
]