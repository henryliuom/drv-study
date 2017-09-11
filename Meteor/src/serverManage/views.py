# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import render_to_response
from rest_framework import status
from meteor.api import *
from models import *
from serializers import *
from django.core.files.base import ContentFile

# Create your views here.

@login_required()
@permission_required()
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

@login_required()
@permission_required()
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

@login_required()
@permission_required()
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

@login_required()
@permission_required()
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

@login_required()
@permission_required()
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

@login_required()
@permission_required()
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

@login_required()
@permission_required()
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

@login_required()
@permission_required()
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

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def projectsearch(request):
    if request.method == 'GET':
        if 'fid' not in request.GET: return Response('fid不存在，请传fid参数')
        staff = request.GET['fid']
        staff = ''.join(staff.split(' '))
        if staff=='': return Response('员工ID不能为空')
        elif staff=='all':
            project=Projects.objects.select_related('staff').all()
            serializer = ProjectsSearchSerializer(project,many=True)
            return Response(serializer.data)
        else:
            project=Projects.objects.filter(staff=staff)
            serializer = ProjectsSearchSerializer(project,many=True)
            return Response(serializer.data)

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def idcsearch(request):
    if request.method == 'GET':
        if 'fid' not in request.GET: return Response('fid不存在，请传fid参数')
        staff = request.GET['fid']
        staff = ''.join(staff.split(' '))
        if staff=='': return Response('员工ID不能为空')
        elif staff=='all':
            idc=Idcs.objects.select_related('staff').all()
            serializer = IdcsSearchSerializer(idc,many=True)
            return Response(serializer.data)
        else:
            idc=Idcs.objects.filter(staff=staff)
            serializer = IdcsSearchSerializer(idc,many=True)
            return Response(serializer.data)

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def serversearch(request):
    if request.method == 'GET':
        if 'fid' not in request.GET: return Response('fid不存在，请传fid参数')
        fid = request.GET['fid']
        fid = eval(fid)
        if fid['name']=='staff':
            staff = fid['value']
            staff = ''.join(staff.split(' '))
            if staff=='': return Response('员工ID不能为空')
            if staff=='all':
                server=Servers.objects.all()
                serializer = ServersSearchSerializer(server,many=True)
                return Response(serializer.data)
            else:
                server=Servers.objects.filter(staff=staff)
                serializer = ServersSearchSerializer(server,many=True)
                return Response(serializer.data)
        elif fid['name']=='idc':
            idc = fid['value']
            idc = ''.join(idc.split(' '))
            if idc=='': return Response('IDC ID不能为空')
            if idc=='all':
                server=Servers.objects.all()
                serializer = ServersSearchSerializer(server,many=True)
                return Response(serializer.data)
            else:
                server=Servers.objects.filter(idc=idc)
                serializer = ServersSearchSerializer(server,many=True)
                return Response(serializer.data)
        elif fid['name']=='name':
            name = fid['value']
            name = name.strip()
            if name=='': return Response('服务器名称不能为空')
            if name=='all':
                server=Servers.objects.all()
                serializer = ServersSearchSerializer(server,many=True)
                return Response(serializer.data)
            else:
                server=Servers.objects.filter(name=name)
                serializer = ServersSearchSerializer(server,many=True)
                return Response(serializer.data)
        elif fid['name']=='publicip':
            publicip = fid['value']
            publicip = ''.join(publicip.split(' '))
            if publicip=='': return Response('外网IP不能为空')
            if publicip=='all':
                server=Servers.objects.all()
                serializer = ServersSearchSerializer(server,many=True)
                return Response(serializer.data)
            else:
                server=Servers.objects.filter(publicip=publicip)
                serializer = ServersSearchSerializer(server,many=True)
                return Response(serializer.data)
        elif fid['name']=='privateip':
            privateip = fid['value']
            privateip = ''.join(privateip.split(' '))
            if privateip=='': return Response('外网IP不能为空')
            if privateip=='all':
                server=Servers.objects.all()
                serializer = ServersSearchSerializer(server,many=True)
                return Response(serializer.data)
            else:
                server=Servers.objects.filter(privateip=privateip)
                serializer = ServersSearchSerializer(server,many=True)
                return Response(serializer.data)

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def servicesearch(request):
    if request.method == 'GET':
        if 'fid' not in request.GET: return Response('fid不存在，请传fid参数')
        project = request.GET['fid']
        project = ''.join(project.split(' '))
        if project=='': return Response('项目ID不能为空')
        elif project=='all':
            service=Services.objects.select_related('project').all()
            serializer = ServicesSearchSerializer(service,many=True)
            return Response(serializer.data)
        else:
            service=Services.objects.filter(project=project)
            serializer = ServicesSearchSerializer(service,many=True)
            return Response(serializer.data)
