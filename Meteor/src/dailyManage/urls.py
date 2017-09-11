from django.conf.urls import url
from views import *

urlpatterns = [
    url(r'^dutysheets/$', dutysheets, name=''),
    url(r'^dutysheets/(?P<pk>[0-9]+)$', dutysheets, name=''),
    url(r'^dutysheetmodify/(?P<pk>[0-9]+)$', dutysheetmodify, name=''),
    url(r'^dutysheetsearch/', dutysheetsearch, name=''),
]