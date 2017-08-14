from django.conf.urls import url
from views import *

urlpatterns = [
    url(r'^payhosts/$', payhosts, name=''),
    url(r'^payhosts/(?P<pk>[0-9]+)$', payhosts, name=''),
    url(r'^payhostmodify/(?P<pk>[0-9]+)$', payhostmodify, name=''),
    url(r'^paydnses/$', paydnses, name=''),
    url(r'^paydnses/(?P<pk>[0-9]+)$', paydnses, name=''),
    url(r'^paydnsmodify/(?P<pk>[0-9]+)$', paydnsmodify, name=''),
]