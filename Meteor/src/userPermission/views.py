# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from meteor.api import *
from serializers import *
from models import *
import hashlib, datetime, json
import sys

reload(sys)
sys.setdefaultencoding('utf8')

# Create your views here.

@login_required()
@permission_required()
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

@login_required()
@permission_required()
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

@login_required()
@permission_required()
@api_view(['GET', 'POST'])
def staffs(request):
    # 查询表格所有记录
    if request.method == 'GET':
        staff = Staffs.objects.all()
        serializer = StaffSearchSerializer(staff,many=True)
        return Response(serializer.data)
    # 添加纪录
    if request.method == 'POST':
        if request.data["password"] != '':
            request.data["password"] = hashlib.md5(request.data["password"]).hexdigest()
        serializer = StaffSerializer(data=request.data)
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
        if request.data["password"] != '':
            # print request.data["password"]
            request.data["password"] = hashlib.md5(request.data["password"]).hexdigest()
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

@login_required()
@permission_required()
@api_view(['GET', 'POST'])
def staffpermissions(request):
    # 查询表格所有记录
    if request.method == 'GET':
        staffpermission = StaffPermissions.objects.all()
        serializer = StaffPermissionsSearchSerializer(staffpermission,many=True)
        return Response(serializer.data)
    # 添加纪录
    if request.method == 'POST':
        serializer = StaffPermissionsSerializer(data=request.data)
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
def staffpermissionmodify(request, pk):
    try:
        staffpermission = StaffPermissions.objects.get(pk=pk)
    except StaffPermissions.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = StaffPermissionsSearchSerializer(staffpermission)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = StaffPermissionsSerializer(staffpermission).data
        # print olddata['comment']
        serializer = StaffPermissionsSerializer(staffpermission, data=request.data)
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
        olddata = StaffPermissionsSerializer(staffpermission).data
        staffpermission.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@login_required()
@permission_required()
@api_view(['GET', 'POST'])
def roles(request):
    # 查询表格所有记录
    if request.method == 'GET':
        role = Roles.objects.all()
        serializer = RoleSerializer(role,many=True)
        return Response(serializer.data)
    # 添加纪录
    if request.method == 'POST':
        serializer = RoleSerializer(data=request.data)
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
def rolemodify(request, pk):
    try:
        role = Roles.objects.get(pk=pk)
    except Roles.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = RoleSerializer(role)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = RoleSerializer(role).data
        # print olddata['comment']
        serializer = RoleSerializer(role, data=request.data)
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
        olddata = RoleSerializer(role).data
        role.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@login_required()
@permission_required()
@api_view(['GET', 'POST'])
def rolepermissions(request):
    # 查询表格所有记录
    if request.method == 'GET':
        grouppermission = RolePermissions.objects.all()
        serializer = RolePermissionSearchSerializer(grouppermission,many=True)
        return Response(serializer.data)
    # 添加纪录
    if request.method == 'POST':
        serializer = RolePermissionSerializer(data=request.data)
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
def rolepermissionmodify(request, pk):
    try:
        rolepermission = RolePermissions.objects.get(pk=pk)
    except RolePermissions.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = RolePermissionSearchSerializer(rolepermission)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = RolePermissionSerializer(rolepermission).data
        # print olddata['comment']
        serializer = RolePermissionSerializer(rolepermission, data=request.data)
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
        olddata = RolePermissionSerializer(rolepermission).data
        rolepermission.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@login_required()
@permission_required()
@api_view(['GET', 'POST'])
def staffroles(request):
    # 查询表格所有记录
    if request.method == 'GET':
        staffrole = StaffRoles.objects.all()
        serializer = StaffRoleSearchSerializer(staffrole,many=True)
        return Response(serializer.data)
    # 添加纪录
    if request.method == 'POST':
        serializer = StaffRoleSerializer(data=request.data)
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
def staffrolemodify(request, pk):
    try:
        staffrole = StaffRoles.objects.get(pk=pk)
    except StaffRoles.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = StaffRoleSearchSerializer(staffrole)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = StaffRoleSerializer(staffrole).data
        # print olddata['comment']
        serializer = StaffRoleSerializer(staffrole, data=request.data)
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
        olddata = StaffRoleSerializer(staffrole).data
        staffrole.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def staffsearch(request):
    if request.method == 'GET':
        if 'fid' not in request.GET: return Response('fid不存在，请传fid参数')
        group = request.GET['fid']
        group = ''.join(group.split(' '))
        if group=='': return Response('用户组ID不能为空')
        elif group=='all':
            staff=Staffs.objects.select_related('group').all()
            serializer = StaffSearchSerializer(staff,many=True)
            return Response(serializer.data)
        else:
            staff=Staffs.objects.filter(group=group)
            serializer = StaffSearchSerializer(staff,many=True)
            return Response(serializer.data)

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def rolepermissionsearch(request):
    if request.method == 'GET':
        if 'fid' not in request.GET: return Response('fid不存在，请传fid参数')
        role = request.GET['fid']
        role = ''.join(role.split(' '))
        if role=='': return Response('角色ID不能为空')
        elif role=='all':
            rolepermission=RolePermissions.objects.select_related('role').all()
            serializer = RolePermissionSearchSerializer(rolepermission,many=True)
            return Response(serializer.data)
        else:
            rolepermission=RolePermissions.objects.filter(role=role)
            serializer = RolePermissionSearchSerializer(rolepermission,many=True)
            return Response(serializer.data)

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def staffrolesearch(request):
    if request.method == 'GET':
        if 'fid' not in request.GET: return Response('fid不存在，请传fid参数')
        fid = request.GET['fid']
        fid = eval(fid)
        if fid['name']=='staff':
            staff = fid['value']
            staff = ''.join(staff.split(' '))
            if staff=='': return Response('员工ID不能为空')
            elif staff=='all':
                staffrole=StaffRoles.objects.select_related('staff').all()
                serializer = StaffRoleSearchSerializer(staffrole,many=True)
                return Response(serializer.data)
            else:
                staffrole=StaffRoles.objects.filter(staff=staff)
                serializer = StaffRoleSearchSerializer(staffrole,many=True)
                return Response(serializer.data)
        elif fid['name']=='role':
            role = fid['value']
            role = ''.join(role.split(' '))
            if role=='': return Response('角色ID不能为空')
            elif role=='all':
                staffrole=StaffRoles.objects.select_related('role').all()
                serializer = StaffRoleSearchSerializer(staffrole,many=True)
                return Response(serializer.data)
            else:
                staffrole=StaffRoles.objects.filter(role=role)
                serializer = StaffRoleSearchSerializer(staffrole,many=True)
                return Response(serializer.data)
        else: return Response('请按{"name": "staff", "value": "***"}或{"name": "role", "value": "***"}规范给fid传值')



