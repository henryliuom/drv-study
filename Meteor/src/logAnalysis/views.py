# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import render_to_response
from rest_framework import status
from models import *
from serializers import *
from meteor.api import *
from django.core.files.base import ContentFile

# Create your views here.

@login_required()
@permission_required()
@api_view([ 'POST', 'GET' ])
def agents(request):
    # 查询表格所有记录
    if request.method == 'GET':
        agent = Loganalysis_agent.objects.all()
        serializer = Loganalysis_agentSearchSerializer(agent,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        ## 改写用户传过来的数据
        # if request.data["logservice"] == '2':
        #     dict = request.data
        #     dict["service"] = 2
        # serializer = Loganalysis_agentSerializer(data=dict)
        serializer = Loganalysis_agentSerializer(data=request.data)
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
def agentmodify(request, pk):
    try:
        agent = Loganalysis_agent.objects.get(pk=pk)
    except Loganalysis_agent.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = Loganalysis_agentSearchSerializer(agent)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = Loganalysis_agentSerializer(agent).data
        serializer = Loganalysis_agentSerializer(agent, data=request.data)
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
        olddata = Loganalysis_agentSerializer(agent).data
        agent.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@login_required()
@permission_required()
@api_view([ 'POST', 'GET' ])
def areas(request):
    # 查询表格所有记录
    if request.method == 'GET':
        area = Loganalysis_area.objects.all()
        serializer = Loganalysis_areaSearchSerializer(area,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        serializer = Loganalysis_areaSerializer(data=request.data)
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
def areamodify(request, pk):
    try:
        area = Loganalysis_area.objects.get(pk=pk)
    except Loganalysis_area.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = Loganalysis_areaSearchSerializer(area)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = Loganalysis_areaSerializer(area).data
        # print olddata['comment']
        serializer = Loganalysis_areaSerializer(area, data=request.data)
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
        olddata = Loganalysis_areaSerializer(area).data
        area.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@login_required()
@permission_required()
@api_view([ 'POST', 'GET' ])
def cdns(request):
    # 查询表格所有记录
    if request.method == 'GET':
        cdn = Loganalysis_cdn.objects.all()
        serializer = Loganalysis_cdnSearchSerializer(cdn,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        serializer = Loganalysis_cdnSerializer(data=request.data)
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
def cdnmodify(request, pk):
    try:
        cdn = Loganalysis_cdn.objects.get(pk=pk)
    except Loganalysis_cdn.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = Loganalysis_cdnSearchSerializer(cdn)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = Loganalysis_cdnSerializer(cdn).data
        # print olddata['comment']
        serializer = Loganalysis_cdnSerializer(cdn, data=request.data)
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
        olddata = Loganalysis_cdnSerializer(cdn).data
        cdn.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@login_required()
@permission_required()
@api_view([ 'POST', 'GET' ])
def domainnames(request):
    # 查询表格所有记录
    if request.method == 'GET':
        http = Loganalysis_http.objects.all()
        serializer = Loganalysis_httpSearchSerializer(http,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        serializer = Loganalysis_httpSerializer(data=request.data)
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
def domainnamemodify(request, pk):
    try:
        http = Loganalysis_http.objects.get(pk=pk)
    except Loganalysis_http.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = Loganalysis_httpSearchSerializer(http)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = Loganalysis_httpSerializer(http).data
        # print olddata['comment']
        serializer = Loganalysis_httpSerializer(http, data=request.data)
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
        olddata = Loganalysis_httpSerializer(http).data
        http.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@login_required()
@permission_required()
@api_view([ 'POST', 'GET' ])
def statuses(request):
    # 查询表格所有记录
    if request.method == 'GET':
        statuses = Loganalysis_status.objects.all()
        serializer = Loganalysis_statusSearchSerializer(statuses,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        serializer = Loganalysis_statusSerializer(data=request.data)
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
def statusmodify(request, pk):
    try:
        statuses = Loganalysis_status.objects.get(pk=pk)
    except Loganalysis_status.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = Loganalysis_statusSearchSerializer(statuses)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = Loganalysis_statusSerializer(statuses).data
        # print olddata['comment']
        serializer = Loganalysis_statusSerializer(statuses, data=request.data)
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
        olddata = Loganalysis_statusSerializer(statuses).data
        statuses.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@login_required()
@permission_required()
@api_view([ 'POST', 'GET' ])
def upstreams(request):
    # 查询表格所有记录
    if request.method == 'GET':
        upstream = Loganalysis_upstream.objects.all()
        serializer = Loganalysis_upstreamSearchSerializer(upstream,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        serializer = Loganalysis_upstreamSerializer(data=request.data)
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
def upstreammodify(request, pk):
    try:
        upstream = Loganalysis_upstream.objects.get(pk=pk)
    except Loganalysis_upstream.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = Loganalysis_upstreamSearchSerializer(upstream)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = Loganalysis_upstreamSerializer(upstream).data
        # print olddata['comment']
        serializer = Loganalysis_upstreamSerializer(upstream, data=request.data)
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
        olddata = Loganalysis_upstreamSerializer(upstream).data
        upstream.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)