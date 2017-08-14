# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import render_to_response
from rest_framework import status
from models import *
from serializers import *
from django.core.files.base import ContentFile
from classmate.api import Operaterecord

# Create your views here.

@api_view([ 'POST', 'GET' ])
def dutysheets(request):
    # 查询表格所有记录
    if request.method == 'GET':
        dutysheet = Dutysheets.objects.all()
        serializer = DutysheetSearchSerializer(dutysheet,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        # photo = request.POST.get('photo')
        # staff = request.POST.get('staff')
        # photo=request.FILES.get(photo, '')
        # if photo:
        #     file_content = ContentFile(photo.read())
        #     Dutysheets.photo.save(photo.name, file_content)
        #     Dutysheets.staff.save(staff)
        #     Dutysheets.save()
        serializer = DutysheetSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            ## 记录操作日志
            Operaterecord().saverecord(request, '', serializer.data, 'add')
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def dutysheetmodify(request, pk):
    try:
        dutysheet = Dutysheets.objects.get(pk=pk)
    except Dutysheets.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = DutysheetSearchSerializer(dutysheet)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = DutysheetSerializer(dutysheet).data
        # print olddata['comment']
        serializer = DutysheetSerializer(dutysheet, data=request.data)
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
        olddata = DutysheetSerializer(dutysheet).data
        dutysheet.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)