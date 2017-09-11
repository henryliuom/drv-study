from django.conf.urls import url
from views import *

urlpatterns = [
    url(r'^menus/$', menus, name=''),
    url(r'^menus/(?P<pk>[0-9]+)$', menus, name=''),
    url(r'^menumodify/(?P<pk>[0-9]+)$', menumodify, name=''),
    url(r'^secondmenus/$', secondmenus, name=''),
    url(r'^secondmenus/(?P<pk>[0-9]+)$', secondmenus, name=''),
    url(r'^secondmenumodify/(?P<pk>[0-9]+)$', secondmenumodify, name=''),
    url(r'^secondmenusearch/', secondmenusearch, name=''),
]