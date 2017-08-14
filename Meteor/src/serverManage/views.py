# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import render_to_response
from rest_framework import status
from classmate.api import Operaterecord
from models import *
from serializers import *
from django.core.files.base import ContentFile

# Create your views here.

@api_view([ 'POST', 'GET' ])
def projects(request):
    # 查询表格所有记录
    if request.method == 'GET':
        project = Projects.objects.all()
        serializer = ProjectsSearchSerializer(project,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        serializer = ProjectsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            ## 记录操作日志
            Operaterecord().saverecord(request, '', serializer.data, 'add')
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def projectmodify(request, pk):
    try:
        project = Projects.objects.get(pk=pk)
    except Projects.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = ProjectsSearchSerializer(project)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = ProjectsSerializer(project).data
        # print olddata['comment']
        serializer = ProjectsSerializer(project, data=request.data)
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
        olddata = ProjectsSerializer(project).data
        project.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view([ 'POST', 'GET' ])
def idcs(request):
    # 查询表格所有记录
    if request.method == 'GET':
        idc = Idcs.objects.all()
        serializer = IdcsSearchSerializer(idc,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        serializer = IdcsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            ## 记录操作日志
            Operaterecord().saverecord(request, '', serializer.data, 'add')
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def idcmodify(request, pk):
    try:
        idc = Idcs.objects.get(pk=pk)
    except Idcs.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = IdcsSearchSerializer(idc)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = IdcsSerializer(idc).data
        # print olddata['comment']
        serializer = IdcsSerializer(idc, data=request.data)
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
        olddata = IdcsSerializer(idc).data
        idc.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view([ 'POST', 'GET' ])
def servers(request):
    # 查询表格所有记录
    if request.method == 'GET':
        server = Servers.objects.all()
        serializer = ServersSearchSerializer(server,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        serializer = ServersSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            ## 记录操作日志
            Operaterecord().saverecord(request, '', serializer.data, 'add')
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def servermodify(request, pk):
    try:
        server = Servers.objects.get(pk=pk)
    except Servers.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = ServersSearchSerializer(server)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = ServersSerializer(server).data
        # print olddata['comment']
        serializer = ServersSerializer(server, data=request.data)
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
        olddata = ServersSerializer(server).data
        server.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view([ 'POST', 'GET' ])
def services(request):
    # 查询表格所有记录
    if request.method == 'GET':
        service = Services.objects.all()
        serializer = ServicesSearchSerializer(service,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        print request.data
        serializer = ServicesSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            ## 记录操作日志
            Operaterecord().saverecord(request, '', serializer.data, 'add')
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def servicemodify(request, pk):
    try:
        service = Services.objects.get(pk=pk)
    except Services.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = ServicesSearchSerializer(service)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = ServicesSerializer(service).data
        # print olddata['comment']
        serializer = ServicesSerializer(service, data=request.data)
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
        olddata = ServicesSerializer(service).data
        service.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)