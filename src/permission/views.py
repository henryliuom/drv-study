# -*- coding: utf-8 -*-
import re,os,json
from django.db.models import Q
from django.http import *
from django.shortcuts import *
from django.db import connection
from cmdb.api import *
from .models import *

from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.response import Response
from .serializers import *

# Create your views here.
@funmenu()
def menuadd(request,menus):
    cursor = connection.cursor()
    if request.method == 'POST' and "menuname" in request.POST and "id" not in request.POST:
        menuname = request.POST.get('menuname').replace(' ', '')
        icontype = request.POST.get('icontype')
        comment = request.POST.get('comment').replace(' ', '')
        if menuname!='':
            cursor.execute("select id from cmdb_firstmenu where name=%s",[menuname])
            row = cursor.fetchall()
            if not row:
                cursor.execute("insert into cmdb_firstmenu (name,iconclass,comment) value (%s,%s,%s)",[menuname,icontype,comment])
                message = '添加成功！'
    elif request.method == 'POST' and "menuname" in request.POST and "id" in request.POST:
        id = request.POST.get('id')
        menuname = request.POST.get('menuname').replace(' ', '')
        icontype = request.POST.get('icontype')
        comment = request.POST.get('comment').replace(' ', '')
        cursor.execute("update cmdb_firstmenu set name=%s,iconclass=%s,comment=%s where id=%s",[menuname,icontype,comment,id])
        message = '修改成功！'
        return HttpResponse(json.dumps(message), content_type="application/json")
    elif request.method == 'POST' and "menuname" not in request.POST and "id" in request.POST:
        id = request.POST.get('id')
        cursor.execute("select s.id,s.firstmenu_id,f.name,s.name,s.url,s.onshow,s.comment from cmdb_secondmenu s left join cmdb_firstmenu f on f.id=s.firstmenu_id where f.id=%s",[id])
        row = cursor.fetchall()
        if not row:
            cursor.execute("delete from cmdb_firstmenu where id=%s",[id])
            message = '删除成功！'
        else:
            message = '此菜单含有子菜单，无法删除！请先删除对应的子菜单'
        return HttpResponse(json.dumps(message), content_type="application/json")
    cursor.execute("select id,name,iconclass,comment from cmdb_firstmenu")
    fistmenus = cursor.fetchall()
    icontypes = []
    dict = {}
    arry = [
        "book",
        "suitcase",
        "tree",
        "umbrella",
        "user",
        "sitemap",
        "folder-open",
        "desktop",
        "database",
        "cloud",
        "cogs",
        "fighter-jet"
    ]
    dict["name"] = "Web Application Icons"
    dict["value"] = arry
    icontypes.append(dict)
    dict = {}
    arry = [
        "file",
        "file-text"
    ]
    dict["name"] = "File Type Icons"
    dict["value"] = arry
    icontypes.append(dict)
    dict = {}
    arry = [
        "area-chart",
        "bar-chart",
        "line-chart",
        "pie-chart"
    ]
    dict["name"] = "Chart Icons"
    dict["value"] = arry
    icontypes.append(dict)
    dict = {}
    arry = [
        "ambulance",
        "hospital-o",
        "medkit",
        "user-md",
        "wheelchair"
    ]
    dict["name"] = "Medical Icons"
    dict["value"] = arry
    icontypes.append(dict)
    cursor.close
    return render_to_response('../templates/permission/menuadd.html', locals(), request)
@funmenu()
# 查询
def submenuadd(request,menus):
    message = ''
    cursor = connection.cursor()
    if request.method == 'POST' and "menuid" in request.POST and "search" in request.POST:
        menuid = int(request.POST.get('menuid'))
        cursor.execute("select s.id,s.firstmenu_id,f.name,s.name,s.url,s.onshow,s.comment from cmdb_firstmenu f left join cmdb_secondmenu s on f.id=s.firstmenu_id where f.id=%s",[menuid])
        submenus = cursor.fetchall()
    cursor.execute("select id,name from cmdb_firstmenu")
    fmenus = cursor.fetchall()
    cursor.close
    return render_to_response('../templates/permission/submenuadd.html', locals(), request)

@api_view([ 'PUT','DELETE' ])
def Secondmenumodify(request, pk):
    try:
        secondmenu = Secondmenu.objects.get(pk=pk)
    except Secondmenu.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = SecondmenuSerializer(secondmenu)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        serializer = SecondmenuSerializer(secondmenu, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # 删除
    elif request.method == 'DELETE':
        secondmenu.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['PUT', 'POST'])
def Secondmenuadd(request):
    # 添加纪录
    if request.method == 'POST':
        serializer = SecondmenuSerializer(data=request.data)
        print request.data
        print serializer
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)