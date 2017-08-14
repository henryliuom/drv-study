from django.conf.urls import url
from views import *

urlpatterns = [
    url(r'^operaterecords/$', operaterecords, name=''),
    # url(r'^operaterecords/(?P<pk>[0-9]+)$', operaterecords, name=''),
    url(r'^operaterecordmodify/(?P<pk>[0-9]+)$', operaterecordmodify, name=''),
]