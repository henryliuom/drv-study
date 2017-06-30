# -*- coding: utf-8 -*-
import re,os,json
from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.db import connection
from cmdb.api import *
from .models import *

from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import generics
from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from .serializers import *

# Create your views here.

@funmenu()
def iptables(request,menus):
    cursor = connection.cursor()
    if request.method == 'POST' and "descr" in request.POST:
        tables = request.POST.get('descr')
        sucess = 0
        arr = []
        dict = {}
        table = ''
        tableip = ''
        for line in tables.split('<br />'):
            if variable.reip.findall(line.split(' ')[0]) and line.split(' ')[2]=='SUCCESS':
                if table!='' and tableip!='':
                    dict["tableip"] = tableip
                    dict["table"] = table
                    hostip = tableip
                    arr.append(dict)
                    dict = {}
                table = ''
                tableip = line.split(' ')[0]
                sucess = 1
            elif variable.reip.findall(line.split(' ')[0]) and line.split(' ')[2]=='UNREACHABLE':
                if table!='' and tableip!='':
                    dict["tableip"] = tableip
                    dict["table"] = table
                    hostip = tableip
                    arr.append(dict)
                    dict = {}
                sucess = 0
                table = ''
                tableip = ''
            else:
                if sucess==1:
                    table = table + line + '&#10;'
        if table != '' and tableip != '':
            dict["tableip"] = tableip
            dict["table"] = table
            hostip = tableip
            arr.append(dict)
            dict = {}
        if len(arr)>1:
            hostip = 'all'
        for dict in arr:
            cursor.execute("select id from cmdb_servers where ip=%s",[dict['tableip']])
            host = cursor.fetchall()
            if host:
                cursor.execute("select id from cmdb_iptables where server_id=%s", [host[0][0]])
                iptable = cursor.fetchall()
                if iptable:
                    cursor.execute("update cmdb_iptables set iptable=%s where id=%s", [dict['table'],iptable[0][0]])
                else:
                    cursor.execute("insert into cmdb_iptables (server_id,iptable) value (%s,%s)", [host[0][0],dict['table']])
            else:
                cursor.execute("insert into cmdb_servers (ip) value (%s)", [dict['tableip']])
                cursor.execute("select id from cmdb_servers where ip=%s", [dict['tableip']])
                host = cursor.fetchall()
                cursor.execute("insert into cmdb_iptables (server_id,iptable) value (%s,%s)", [host[0][0],dict['table']])
        if len(arr)>1:
            cursor.execute("select h.ip,h.name,it.iptable from cmdb_servers h left JOIN cmdb_iptables it ON h.id=it.server_id")
        else:
            cursor.execute("select h.ip,h.name,it.iptable from cmdb_servers h left JOIN cmdb_iptables it ON h.id=it.server_id where h.ip=%s",[dict['tableip']])
        tablessql = cursor.fetchall()
        message = '保存成功'
    elif request.method == 'POST' and "hosts" in request.POST:
        hostip = request.POST.get('hosts')
        if hostip=='all':
            cursor.execute("select h.ip,h.name,it.iptable from cmdb_servers h left JOIN cmdb_iptables it ON h.id=it.server_id")
        else:
            cursor.execute("select h.ip,h.name,it.iptable from cmdb_servers h left JOIN cmdb_iptables it ON h.id=it.server_id where h.ip=%s",[hostip])
        tablessql = cursor.fetchall()
        tables = os.popen('ansible '+ hostip + ' -m shell -a "cat /etc/sysconfig/iptables | grep ^[^#]"').read()
        tables = tables.replace('\n',"<br />")
    cursor.execute("select id,name,ip from cmdb_servers")
    hosts = cursor.fetchall()
    cursor.close
    return render_to_response('service/iptables.html', locals(), request)

@funmenu()
def projects(request,menus):
    message = ''
    cursor = connection.cursor()
    if request.method == 'POST' and "search" in request.POST:
        cursor.execute("select id,staff_id,name,comment from cmdb_projects")
        projects = cursor.fetchall()
    cursor.execute("select id,name from cmdb_staffs")
    staffs = cursor.fetchall()
    cursor.close
    return render_to_response('service/projects.html', locals(), request)

@api_view([ 'PUT','DELETE','POST' ])
def Projectmodify(request, pk):
    try:
        project = Projects.objects.get(pk=pk)
    except Projects.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = ProjectSerializer(project)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        serializer = ProjectSerializer(project, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # 删除
    elif request.method == 'DELETE':
        project.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['PUT', 'POST'])
def Projectadd(request):
    # 添加纪录
    if request.method == 'POST':
        serializer = ProjectSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@funmenu()
def services(request,menus):
    message = ''
    cursor = connection.cursor()
    if request.method == 'POST' and "servicename" in request.POST and "id" not in request.POST and "add" in request.POST:
        projectid = request.POST.get('projectid')
        if projectid=='':
            projectid=None
        else:
            projectid = int(projectid)
        serverid = request.POST.get('serverid')
        if serverid=='':
            serverid=None
        else:
            serverid = int(serverid)
        staffid = request.POST.get('staffid')
        if staffid=='':
            staffid=None
        else:
            staffid = int(staffid)
        servicename = request.POST.get('servicename').replace(' ', '')
        type = request.POST.get('type').replace(' ', '')
        port = request.POST.get('port').replace(' ', '')
        tags = request.POST.get('tags').replace(' ', '')
        comment = request.POST.get('comment').replace(' ', '')
        if servicename!='':
            cursor.execute("select id from cmdb_services where name=%s",[servicename])
            row = cursor.fetchall()
            if not row:
                cursor.execute("insert into cmdb_services (project_id,server_id,staff_id,name,type,port,tags,comment) value (%s,%s,%s,%s,%s,%s,%s,%s)",[projectid,serverid,staffid,servicename,type,port,tags,comment])
                message = '添加成功！'
            else:
                message = '服务名称已存在，添加失败'
    elif request.method == 'POST' and "search" in request.POST:
        cursor.execute("select id,project_id,server_id,staff_id,name,type,port,tags,comment from cmdb_services")
        services = cursor.fetchall()
    if message == '添加成功！':
        cursor.execute("select id,project_id,server_id,staff_id,name,type,port,tags,comment from cmdb_services where name=%s",[servicename])
        services = cursor.fetchall()
    cursor.execute("select id,name from cmdb_projects")
    projects = cursor.fetchall()
    cursor.execute("select id,name from cmdb_servers")
    servers = cursor.fetchall()
    cursor.execute("select id,name from cmdb_staffs")
    staffs = cursor.fetchall()
    cursor.close
    return render_to_response('service/services.html', locals(), request)

@api_view([ 'PUT','DELETE' ])
def Servicemodify(request, pk):
    try:
        service = Services.objects.get(pk=pk)
    except Services.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = ServiceSerializer(service)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        serializer = ServiceSerializer(service, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # 删除
    elif request.method == 'DELETE':
        service.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['PUT', 'POST'])
def Serviceadd(request):
    # 添加纪录
    if request.method == 'POST':
        serializer = ServiceSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)