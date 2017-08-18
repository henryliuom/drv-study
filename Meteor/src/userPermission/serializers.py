# -*- coding:utf-8 -*-
from rest_framework import serializers
from models import *


class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Groups
        fields = ('id', 'name', 'comment')

class StaffSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Staffs
        fields = ('id', 'name', 'password', 'sex', 'position', 'telno', 'comment', 'group')
        depth  = 1

class StaffSerializer(serializers.ModelSerializer):
    class Meta:
        model = Staffs
        fields = ('id', 'name', 'password', 'sex', 'position', 'telno', 'comment', 'group')

class StaffPermissionsSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = StaffPermissions
        fields = ('id', 'staff', 'secondmenu', 'permission', 'comment')
        depth  = 1

class StaffPermissionsSerializer(serializers.ModelSerializer):
    class Meta:
        model = StaffPermissions
        fields = ('id', 'staff', 'secondmenu', 'permission', 'comment')

class RoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Roles
        fields = ('id', 'name', 'comment')

class RolePermissionSerializer(serializers.ModelSerializer):
    class Meta:
        model = RolePermissions
        fields = ('id', 'role', 'secondmenu', 'permission', 'comment')

class RolePermissionSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = RolePermissions
        fields = ('id', 'role', 'secondmenu', 'permission', 'comment')
        depth  = 1

class StaffRoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = StaffRoles
        fields = ('id', 'staff', 'role', 'comment')

class StaffRoleSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = StaffRoles
        fields = ('id', 'staff', 'role', 'comment')
        depth  = 1