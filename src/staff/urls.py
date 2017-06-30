from django.conf.urls import include, url
from staff.views import *

urlpatterns = [
    url(r'^staffs/$', staffs, name=''),
    url(r'^staffmodify/$', Staffadd, name=''),
    url(r'^staffmodify/(?P<pk>[0-9]+)$', Staffmodify, name=''),
    url(r'^departments/$', departments, name=''),
    url(r'^departmentmodify/$', Departmentadd, name=''),
    url(r'^departmentmodify/(?P<pk>[0-9]+)$', Departmentmodify, name=''),
]