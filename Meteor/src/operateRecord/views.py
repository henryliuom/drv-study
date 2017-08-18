# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import render_to_response
from rest_framework import status
from models import *
from meteor.api import *
from serializers import *
import json

# Create your views here.

@login_required()
@permission_required()
@api_view([ 'POST', 'GET' ])
def operaterecords(request):
    # 查询表格所有记录
    if request.method == 'GET':
        operaterecord = Operaterecords.objects.all()
        serializer = OperaterecordSearchSerializer(operaterecord,many=True)
        # dict = eval(serializer.data[60]['newdata'])
        # print json.dumps(dict, encoding="utf-8", ensure_ascii=False)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        serializer = OperaterecordsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def operaterecordmodify(request, pk):
    try:
        operaterecord = Operaterecords.objects.get(pk=pk)
    except Operaterecords.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = OperaterecordSearchSerializer(operaterecord)
        return Response(serializer.data)
    # # 修改
    # elif request.method == 'PUT':
    #     serializer = OperaterecordsSerializer(operaterecord, data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data)
    #     else:
    #         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # # 删除
    # elif request.method == 'DELETE':
    #     operaterecord.delete()
    #     return Response(status=status.HTTP_204_NO_CONTENT)
