from django.conf.urls import url
from views import *

urlpatterns = [
    url(r'^serverinspections/$', serverinspections, name=''),
    url(r'^serverinspections/(?P<pk>[0-9]+)$', serverinspections, name=''),
    url(r'^serverinspectionmodify/(?P<pk>[0-9]+)$', serverinspectionmodify, name=''),
    url(r'^inspectionsearch/', inspectionsearch, name=''),
]