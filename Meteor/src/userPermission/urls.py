from django.conf.urls import url
from views import *

urlpatterns = [
    url(r'^staffs/$', staffs, name=''),
    url(r'^staffs/(?P<pk>[0-9]+)$', staffs, name=''),
    url(r'^staffmodify/(?P<pk>[0-9]+)$', staffmodify, name=''),
    url(r'^groups/$', groups, name=''),
    url(r'^groups/(?P<pk>[0-9]+)$', groups, name=''),
    url(r'^groupmodify/(?P<pk>[0-9]+)$', groupmodify, name=''),
    url(r'^staffpermissions/$', staffpermissions, name=''),
    url(r'^staffpermissions/(?P<pk>[0-9]+)$', staffpermissions, name=''),
    url(r'^staffpermissionmodify/(?P<pk>[0-9]+)$', staffpermissionmodify, name=''),
    url(r'^roles/$', roles, name=''),
    url(r'^roles/(?P<pk>[0-9]+)$', roles, name=''),
    url(r'^rolemodify/(?P<pk>[0-9]+)$', rolemodify, name=''),
    url(r'^rolepermissions/$', rolepermissions, name=''),
    url(r'^rolepermissions/(?P<pk>[0-9]+)$', rolepermissions, name=''),
    url(r'^rolepermissionmodify/(?P<pk>[0-9]+)$', rolepermissionmodify, name=''),
    url(r'^staffroles/$', staffroles, name=''),
    url(r'^staffroles/(?P<pk>[0-9]+)$', staffroles, name=''),
    url(r'^staffrolemodify/(?P<pk>[0-9]+)$', staffrolemodify, name=''),
    url(r'^staffsearch/', staffsearch, name=''),
    url(r'^rolepermissionsearch/', rolepermissionsearch, name=''),
    url(r'^staffrolesearch/', staffrolesearch, name=''),
]