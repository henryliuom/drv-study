"""classmate_new URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
# from django.contrib import admin
from views import *

urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    # url(r'^docs/$', docs, name=''),
    url(r'^dailymanage/', include('dailyManage.urls')),
    url(r'^inspectionmanage/', include('inspectionManage.urls')),
    url(r'^loganalysis/', include('logAnalysis.urls')),
    url(r'^menumanage/', include('menuManage.urls')),
    url(r'^servermanage/', include('serverManage.urls')),
    url(r'^thirdmanage/', include('thirdManage.urls')),
    url(r'^userpermission/', include('userPermission.urls')),
    url(r'^operaterecord/', include('operateRecord.urls')),
]
