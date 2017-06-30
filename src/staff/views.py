# -*- coding: utf-8 -*-
import re,os,json
from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.db import connection
from cmdb.api import *
from .models import *

from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.response import Response
from .serializers import *
# Create your views here.

@funmenu()
def departments(request,menus):
    cursor = connection.cursor()
    cursor.execute("select id,name,comment from cmdb_departments")
    departments = cursor.fetchall()
    cursor.close
    return render_to_response('staff/departments.html', locals(), request)

@api_view([ 'PUT','DELETE','POST' ])
def Departmentmodify(request, pk):
    try:
        Department = Departments.objects.get(pk=pk)
    except Departments.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = DepartmentSerializer(Department)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        serializer = DepartmentSerializer(Department, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # 删除
    elif request.method == 'DELETE':
        Department.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['PUT', 'POST'])
def Departmentadd(request):
    # 添加纪录
    if request.method == 'POST':
        serializer = DepartmentSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@funmenu()
def staffs(request,menus):
    message = ''
    cursor = connection.cursor()
    if request.method == 'POST' and "departmentid" in request.POST and "search" in request.POST:
        departmentid = int(request.POST.get('departmentid'))
        cursor.execute("select s.id,s.department_id,f.name,s.name,s.sex,s.position,s.comment from cmdb_departments f left join cmdb_staffs s on f.id=s.department_id where f.id=%s",[departmentid])
        staffs = cursor.fetchall()
    cursor.execute("select id,name from cmdb_departments")
    departments = cursor.fetchall()
    cursor.close
    return render_to_response('staff/staffs.html', locals(), request)

@api_view([ 'PUT','DELETE','POST' ])
def Staffmodify(request, pk):
    try:
        Staff = Staffs.objects.get(pk=pk)
    except Staffs.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = StaffSerializer(Staff)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        serializer = StaffSerializer(Staff, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # 删除
    elif request.method == 'DELETE':
        Staff.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['PUT', 'POST'])
def Staffadd(request):
    # 添加纪录
    if request.method == 'POST':
        serializer = StaffSerializer(data=request.data)
        print request.data
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
