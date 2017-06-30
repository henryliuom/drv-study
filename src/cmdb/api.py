# -*- coding: utf-8 -*-
from django.db import connection
import re

def funmenu():
    def _deco(func):
        def __deco(request, *args, **kwargs):
            cursor = connection.cursor()
            cursor.execute("select f.id,f.name,f.iconclass,s.name,s.url from cmdb_firstmenu f left join cmdb_secondmenu s on f.id=s.firstmenu_id where s.onshow='1' order by f.id")
            row = cursor.fetchall()
            menus = []
            fmenu = {}
            menu = []
            mu = []
            fmenu["fname"] = ''
            first = 0 ##第一次循环
            for line in row:
                if first==0:
                    fmenu["fname"] = line[1]
                    fmenu["ficonclass"] = line[2]
                    mu.append(line[3])
                    mu.append(line[4])
                    menu.append(mu)
                    mu = []
                    first = 1
                elif fmenu["fname"]==line[1]:
                    mu.append(line[3])
                    mu.append(line[4])
                    menu.append(mu)
                    mu = []
                else:
                    fmenu["menus"] = menu
                    menus.append(fmenu)
                    fmenu = {}
                    menu = []
                    fmenu["fname"] = line[1]
                    fmenu["ficonclass"] = line[2]
                    mu.append(line[3])
                    mu.append(line[4])
                    menu.append(mu)
                    mu = []
            fmenu["menus"] = menu
            menus.append(fmenu)
            return  func(request, menus)
        return __deco
    return _deco
def funhtml():
    lable = ['<label class="control-label col-md-2 col-sm-3 col-xs-12" for="name">','</label>']
    require = '<span class="required">*</span>'
    divform = ['<div class="item form-group">','</div>']
    div = ['<div class="col-md-6 col-sm-6 col-xs-12">','</div>']
    div2c = ['<div class="col-md-4 col-sm-6 col-xs-12 form-group has-feedback">','</div>']  ##2列div
    divform2c = ['<form class="form-horizontal form-label-left input_mask">','</div>']  ##2列form
    return locals()
class variable:
    reip = re.compile(r'(?<![\.\d])(?:\d{1,3}\.){3}\d{1,3}(?![\.\d])')