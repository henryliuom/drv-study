# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render
from meteor.api import *
from models import *
from serializers import *
from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.response import Response

# Create your views here.

@login_required()
@permission_required()
@api_view([ 'POST', 'GET' ])
def serverinspections(request):
    # 查询表格所有记录
    if request.method == 'GET':
        serverinspection = Serverinspections.objects.all()
        serializer = ServerinspectionsSearchSerializer(serverinspection,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        serializer = ServerinspectionsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            ## 记录操作日志
            Operaterecord().saverecord(request, '', serializer.data, 'add')
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def serverinspectionmodify(request, pk):
    try:
        serverinspection = Serverinspections.objects.get(pk=pk)
    except Serverinspections.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = ServerinspectionsSearchSerializer(serverinspection)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = ServerinspectionsSerializer(serverinspection).data
        # print olddata['comment']
        serializer = ServerinspectionsSerializer(serverinspection, data=request.data)
        if serializer.is_valid():
            serializer.save()
            ## 记录操作日志
            Operaterecord().saverecord(request, olddata, serializer.data, 'modify')
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # 删除
    elif request.method == 'DELETE':
        ## 删除前记录
        olddata = ServerinspectionsSerializer(serverinspection).data
        serverinspection.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def inspectionsearch(request):
    if request.method == 'GET':
        if 'fid' not in request.GET: return Response('fid不存在，请传fid参数')
        server = request.GET['fid']
        if 'fdate' in request.GET: fdate = request.GET['fdate']
        else: fdate = ''
        if 'sdate' in request.GET: sdate = request.GET['sdate']
        else: sdate = ''
        server = ''.join(server.split(' '))
        if server=='': return Response('服务器ID不能为空')
        elif server=='all':
            if fdate=='' and sdate=='':
                serverinspection=Serverinspections.objects.select_related('server').all()
            elif fdate!='' and sdate=='':
                fdate = fdate+" 00:00:00"
                serverinspection=Serverinspections.objects.filter(inspectdate__gte=fdate)
            elif fdate=='' and sdate!='':
                sdate = sdate+" 23:59:59"
                serverinspection=Serverinspections.objects.filter(inspectdate__lte=sdate)
            else:
                fdate = fdate+" 00:00:00"
                sdate = sdate+" 23:59:59"
                serverinspection=Serverinspections.objects.filter(inspectdate__gte=fdate,inspectdate__lte=sdate)
            serializer = ServerinspectionsSearchSerializer(serverinspection,many=True)
            return Response(serializer.data)
        else:
            if fdate=='' and sdate=='':
                serverinspection=Serverinspections.objects.filter(server=server)
            elif fdate!='' and sdate=='':
                fdate = fdate+" 00:00:00"
                serverinspection=Serverinspections.objects.filter(server=server, inspectdate__gte=fdate)
            elif fdate=='' and sdate!='':
                sdate = sdate+" 23:59:59"
                serverinspection=Serverinspections.objects.filter(server=server, inspectdate__lte=sdate)
            else:
                fdate = fdate+" 00:00:00"
                sdate = sdate+" 23:59:59"
                serverinspection=Serverinspections.objects.filter(server=server, inspectdate__gte=fdate,inspectdate__lte=sdate)
            serializer = ServerinspectionsSearchSerializer(serverinspection,many=True)
            return Response(serializer.data)