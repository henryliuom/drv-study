from django.conf.urls import url
from views import *

urlpatterns = [
    url(r'^agents/$', agents, name=''),
    url(r'^agents/(?P<pk>[0-9]+)$', agents, name=''),
    url(r'^agentmodify/(?P<pk>[0-9]+)$', agentmodify, name=''),
    url(r'^areas/$', areas, name=''),
    url(r'^areas/(?P<pk>[0-9]+)$', areas, name=''),
    url(r'^areamodify/(?P<pk>[0-9]+)$', areamodify, name=''),
    url(r'^cdns/$', cdns, name=''),
    url(r'^cdns/(?P<pk>[0-9]+)$', cdns, name=''),
    url(r'^cdnmodify/(?P<pk>[0-9]+)$', cdnmodify, name=''),
    url(r'^domainnames/$', domainnames, name=''),
    url(r'^domainnames/(?P<pk>[0-9]+)$', domainnames, name=''),
    url(r'^domainnamemodify/(?P<pk>[0-9]+)$', domainnamemodify, name=''),
    url(r'^statuses/$', statuses, name=''),
    url(r'^statuses/(?P<pk>[0-9]+)$', statuses, name=''),
    url(r'^statusmodify/(?P<pk>[0-9]+)$', statusmodify, name=''),
    url(r'^upstreams/$', upstreams, name=''),
    url(r'^upstreams/(?P<pk>[0-9]+)$', upstreams, name=''),
    url(r'^upstreammodify/(?P<pk>[0-9]+)$', upstreammodify, name=''),
]