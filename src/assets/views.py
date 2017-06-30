# -*- coding: utf-8 -*-
#from __future__ import unicode_literals
import json
from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.db import connection
from cmdb.api import *
from .models import *

from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.response import Response
from .serializers import *

@funmenu()
def serverlist(request,menus):
    message = ''
    cursor = connection.cursor()
    if request.method == 'POST' and "search" in request.POST:
        cursor.execute("select i.id,i.name,i.address,h.id,h.name,h.ip,h.cpu,h.mem,h.disktype,h.disksize,h.nic,h.manufactory,h.model,h.apply_date,h.expire_date,h.uuid,h.comment from cmdb_servers h left join cmdb_idcs i on h.idc_id=i.id")
        hosts = cursor.fetchall()
    cursor.execute("select id,name,address from cmdb_idcs")
    idcs = cursor.fetchall()
    cursor.close
    variables = funhtml()
    return render_to_response('assets/servers.html', locals(), request)

@api_view([ 'PUT','DELETE','POST' ])
def Servermodify(request, pk):
    try:
        Server = Servers.objects.get(pk=pk)
    except Servers.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = ServerSerializer(Server)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        serializer = ServerSerializer(Server, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # 删除
    elif request.method == 'DELETE':
        Server.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['PUT', 'POST'])
def Serveradd(request):
    # 添加纪录
    if request.method == 'POST':
        serializer = ServerSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@funmenu()
def idclist(request,menus):
    cursor = connection.cursor()
    cursor.execute("select id,name,address,comment from cmdb_idcs")
    idcs = cursor.fetchall()
    cursor.close
    return render_to_response('assets/idcs.html', locals(), request)

@api_view([ 'PUT','DELETE','POST' ])
def Idcmodify(request, pk):
    try:
        idc = Idcs.objects.get(pk=pk)
    except Idcs.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = IdcSerializer(idc)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        serializer = IdcSerializer(idc, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # 删除
    elif request.method == 'DELETE':
        idc.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['PUT', 'POST'])
def Idcadd(request):
    # 添加纪录
    if request.method == 'POST':
        serializer = IdcSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)