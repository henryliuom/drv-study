# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from menuManage.models import *

# Create your models here.
class Groups(models.Model):
    name = models.CharField(max_length=64, blank=True, null=True, unique=True)
    comment = models.CharField(max_length=160, blank=True, null=True)

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "meteor_groups"

class Staffs(models.Model):
    name = models.CharField(max_length=50, blank=False, null=False, unique=True)
    password = models.CharField(max_length=128, blank=True, null=True)
    sex = models.CharField(max_length=2, blank=True, null=True)
    position = models.CharField(max_length=50, blank=True, null=True)
    telno = models.CharField(max_length=50, blank=True, null=True)   #手机号，数组格式存储
    comment = models.CharField(max_length=160, blank=True, null=True)
    group = models.ForeignKey(Groups)

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "meteor_staffs"

class Roles(models.Model):
    name = models.CharField(max_length=64, blank=True, null=True, unique=True)
    comment = models.CharField(max_length=160, blank=True, null=True)

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "meteor_roles"

class RolePermissions(models.Model):
    role = models.ForeignKey(Roles, verbose_name="角色")
    secondmenu = models.ForeignKey(Secondmenus, verbose_name="子菜单")
    permission = models.CharField(max_length=4, default='1000', verbose_name="4位操作权限，分别是查看、添加、修改、删除，1表示有权限，0表示没有权限")
    comment = models.CharField(max_length=160, blank=True, null=True)

    def __unicode__(self):
        return self.permission
    class Meta:
        db_table = "meteor_rolepermissions"

class StaffRoles(models.Model):
    staff = models.ForeignKey(Staffs, verbose_name="用户")
    role = models.ForeignKey(Roles, verbose_name="角色")
    comment = models.CharField(max_length=160, blank=True, null=True)

    def __unicode__(self):
        return self.comment
    class Meta:
        db_table = "meteor_staffroles"

class StaffPermissions(models.Model):
    staff = models.ForeignKey(Staffs, verbose_name="用户")
    secondmenu = models.ForeignKey(Secondmenus, verbose_name="子菜单")
    permission = models.CharField(max_length=4, default='1000', verbose_name="4位操作权限，分别是查看、添加、修改、删除，1表示有权限，0表示没有权限")
    comment = models.CharField(max_length=160, blank=True, null=True)

    def __unicode__(self):
        return self.permission
    class Meta:
        db_table = "meteor_staffpermissions"
