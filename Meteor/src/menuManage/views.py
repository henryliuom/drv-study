# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import render_to_response
from rest_framework import status
from serializers import *
from meteor.api import *
from django.core.files.base import ContentFile
import datetime

# Create your views here.

@login_required()
@permission_required()
@api_view([ 'POST', 'GET' ])
def menus(request):
    print request.path
    # 查询表格所有记录
    if request.method == 'GET':
        firstmenu = Firstmenus.objects.all()
        serializer = FirstmenuSerializer(firstmenu,many=True)
        return Response(serializer.data)
    # 添加纪录
    if request.method == 'POST':
        serializer = FirstmenuSerializer(data=request.data)
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
def menumodify(request, pk):
    try:
        firstmenu = Firstmenus.objects.get(pk=pk)
    except Firstmenus.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = FirstmenuSerializer(firstmenu)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = FirstmenuSerializer(firstmenu).data
        # print olddata['comment']
        serializer = FirstmenuSerializer(firstmenu, data=request.data)
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
        olddata = FirstmenuSerializer(firstmenu).data
        firstmenu.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@login_required()
@permission_required()
@api_view([ 'POST', 'GET' ])
def secondmenus(request):
    # 查询表格所有记录
    if request.method == 'GET':
        secondmenu = Secondmenus.objects.all()
        serializer = SecondmenuSearchSerializer(secondmenu,many=True)
        return Response(serializer.data)
    # 添加纪录
    if request.method == 'POST':
        ## 改写用户传过来的数据
        url = request.data["url"]
        if url != '':
            dict = request.data
            if url[0] != '/': url = '/' + url
            if url[-1:] != '/': url = url + '/'
            dict["url"] = url
            serializer = SecondmenuSerializer(data=dict)
        else:
            serializer = SecondmenuSerializer(data=request.data)
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
def secondmenumodify(request, pk):
    try:
        secondmenu = Secondmenus.objects.get(pk=pk)
    except Secondmenus.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = SecondmenuSearchSerializer(secondmenu)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = SecondmenuSerializer(secondmenu).data
        # print olddata['comment']
        ## 改写用户传过来的数据
        url = request.data["url"]
        if url != '':
            dict = request.data
            if url[0] != '/': url = '/' + url
            if url[-1:] != '/': url = url + '/'
            dict["url"] = url
            serializer = SecondmenuSerializer(secondmenu, data=dict)
        else:
            serializer = SecondmenuSerializer(secondmenu, data=request.data)
        # serializer = SecondmenuSerializer(secondmenu, data=request.data)
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
        olddata = SecondmenuSerializer(secondmenu).data
        secondmenu.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)