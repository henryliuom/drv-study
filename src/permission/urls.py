from django.conf.urls import include, url
from permission.views import *

urlpatterns = [
    url(r'^menuadd/$', menuadd, name=''),
    url(r'^submenuadd/$', submenuadd, name=''),
    url(r'^submenumodify/$', Secondmenuadd, name=''),
    url(r'^submenumodify/(?P<pk>[0-9]+)$', Secondmenumodify, name=''),
]