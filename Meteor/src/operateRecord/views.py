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
        if "page" in request.GET:
            page_num = request.GET.get("page")
            if page_num.strip()=='': page_num = 1
        else: page_num = 1
        if "limit" in request.GET:
            limit = request.GET.get("limit")
            if limit.strip()=='': limit = 15
        else: limit = 15
        serializer, pages = pagedivision(operaterecord, page_num, limit)
        serializer = OperaterecordSearchSerializer(serializer,many=True)
        context={}
        context={"datas": serializer.data, "pages": pages}
        # serializer = OperaterecordSearchSerializer(operaterecord,many=True)
        return Response(context)
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

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def operaterecordsearch(request):
    if request.method == 'GET':
        if 'fid' not in request.GET: return Response('fid不存在，请传fid参数')
        staff = request.GET['fid']
        if 'fdate' in request.GET: fdate = request.GET['fdate']
        else: fdate = ''
        if 'sdate' in request.GET: sdate = request.GET['sdate']
        else: sdate = ''
        staff = ''.join(staff.split(' '))
        if staff=='': return Response('员工ID不能为空')
        elif staff=='all':
            if fdate=='' and sdate=='':
                operaterecord=Operaterecords.objects.select_related('staff').all()
            elif fdate!='' and sdate=='':
                fdate = fdate+" 00:00:00"
                operaterecord=Operaterecords.objects.filter(date__gte=fdate)
            elif fdate=='' and sdate!='':
                sdate = sdate+" 23:59:59"
                operaterecord=Operaterecords.objects.filter(date__lte=sdate)
            else:
                fdate = fdate+" 00:00:00"
                sdate = sdate+" 23:59:59"
                operaterecord=Operaterecords.objects.filter(date__gte=fdate,date__lte=sdate)
            serializer = OperaterecordSearchSerializer(operaterecord,many=True)
            return Response(serializer.data)
        else:
            if fdate=='' and sdate=='':
                operaterecord=Operaterecords.objects.filter(staff=staff)
            elif fdate!='' and sdate=='':
                fdate = fdate+" 00:00:00"
                operaterecord=Operaterecords.objects.filter(staff=staff, date__gte=fdate)
            elif fdate=='' and sdate!='':
                sdate = sdate+" 23:59:59"
                operaterecord=Operaterecords.objects.filter(staff=staff, date__lte=sdate)
            else:
                fdate = fdate+" 00:00:00"
                sdate = sdate+" 23:59:59"
                operaterecord=Operaterecords.objects.filter(staff=staff, date__gte=fdate,date__lte=sdate)
            serializer = OperaterecordSearchSerializer(operaterecord,many=True)
            return Response(serializer.data)
