# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import render_to_response
from rest_framework import status
from models import *
from serializers import *
from django.core.files.base import ContentFile
from meteor.api import *

# Create your views here.

@login_required()
@permission_required()
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

@login_required()
@permission_required()
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

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def dutysheetsearch(request):
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
                dutysheet=Dutysheets.objects.select_related('staff').all()
            elif fdate!='' and sdate=='':
                fdate = fdate+" 00:00:00"
                dutysheet=Dutysheets.objects.filter(date__gte=fdate)
            elif fdate=='' and sdate!='':
                sdate = sdate+" 23:59:59"
                dutysheet=Dutysheets.objects.filter(date__lte=sdate)
            else:
                fdate = fdate+" 00:00:00"
                sdate = sdate+" 23:59:59"
                dutysheet=Dutysheets.objects.filter(date__gte=fdate,date__lte=sdate)
            serializer = DutysheetSearchSerializer(dutysheet,many=True)
            return Response(serializer.data)
        else:
            if fdate=='' and sdate=='':
                dutysheet=Dutysheets.objects.filter(staff=staff)
            elif fdate!='' and sdate=='':
                fdate = fdate+" 00:00:00"
                dutysheet=Dutysheets.objects.filter(staff=staff, date__gte=fdate)
            elif fdate=='' and sdate!='':
                sdate = sdate+" 23:59:59"
                dutysheet=Dutysheets.objects.filter(staff=staff, date__lte=sdate)
            else:
                fdate = fdate+" 00:00:00"
                sdate = sdate+" 23:59:59"
                dutysheet=Dutysheets.objects.filter(staff=staff, date__gte=fdate,date__lte=sdate)
            serializer = DutysheetSearchSerializer(dutysheet,many=True)
            return Response(serializer.data)