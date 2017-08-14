# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from classmate.api import Operaterecord
from serializers import *
from models import *
import datetime, json
import sys

reload(sys)
sys.setdefaultencoding('utf8')

# Create your views here.

@api_view([ 'POST', 'GET' ])
def groups(request):
    # 查询表格所有记录
    if request.method == 'GET':
        groups = Groups.objects.all()
        serializer = GroupSerializer(groups,many=True)
        return Response(serializer.data)
    # 添加纪录
    if request.method == 'POST':
        serializer = GroupSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            ## 记录操作日志
            Operaterecord().saverecord(request, '', serializer.data, 'add')
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def groupmodify(request, pk):
    try:
        group = Groups.objects.get(pk=pk)
    except Groups.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = GroupSerializer(group)
        # print serializer.data
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = GroupSerializer(group).data
        # print olddata['comment']
        serializer = GroupSerializer(group, data=request.data)
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
        olddata = GroupSerializer(group).data
        group.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['GET', 'POST'])
def staffs(request):
    # 查询表格所有记录
    if request.method == 'GET':
        staff = Staffs.objects.all()
        serializer = StaffSearchSerializer(staff,many=True)
        return Response(serializer.data)
    # 添加纪录
    if request.method == 'POST':
        serializer = StaffSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            ## 记录操作日志
            Operaterecord().saverecord(request, '', serializer.data, 'add')
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def staffmodify(request, pk):
    try:
        staff = Staffs.objects.get(pk=pk)
    except Staffs.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = StaffSearchSerializer(staff)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = StaffSerializer(staff).data
        # print olddata['comment']
        serializer = StaffSerializer(staff, data=request.data)
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
        olddata = StaffSerializer(staff).data
        staff.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)
