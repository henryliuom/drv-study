# -*- coding: utf-8 -*-
import re,os,json
from django.db.models import Q
from django.http import *
from django.shortcuts import *
from django.db import connection
from cmdb.api import *

@funmenu()
def index(request,menus):
    request.session['mennus'] = menus
    return render_to_response('src/index.html', locals(), request)