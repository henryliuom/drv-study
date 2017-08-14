# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from userPermission.models import *
import datetime

# Create your models here.
class  Projects(models.Model):
    staff = models.ForeignKey(Staffs, verbose_name="项目负责人")
    name = models.CharField(max_length=64, verbose_name="项目名称")
    comment = models.TextField(blank=True, null=True, verbose_name="备注")

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "meteor_projects"
        verbose_name = '项目'

class  Idcs(models.Model):
    staff = models.ForeignKey(Staffs, verbose_name="机房负责人")
    name = models.CharField(max_length=64, verbose_name="机房名称")
    location = models.CharField(max_length=128, verbose_name="地址")
    telephone = models.CharField(max_length=128, verbose_name="电话")
    comment = models.TextField(blank=True, null=True, verbose_name="备注")

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "meteor_idcs"
        verbose_name = '机房'

class  Servers(models.Model):
    staff = models.ForeignKey(Staffs, verbose_name="服务器负责人")
    idc = models.ForeignKey(Idcs, verbose_name="所属机房")
    name = models.CharField(blank=True, null=True, max_length=64, verbose_name="服务器名称")
    sn = models.CharField(blank=True, null=True, max_length=32, verbose_name="")
    cpu = models.CharField(blank=True, null=True, max_length=64, verbose_name="")
    mem = models.IntegerField(blank=True, null=True, verbose_name="内存")
    disktype = models.CharField(blank=True, null=True, max_length=64, verbose_name="磁盘类型")
    diskcapacity = models.IntegerField(blank=True, null=True, verbose_name="磁盘容量")
    nic = models.CharField(blank=True, null=True, max_length=64, verbose_name="网卡")
    expiredate = models.DateTimeField(blank=True, null=True, verbose_name="过期时间", default=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    privateip = models.CharField(blank=True, null=True, max_length=64, verbose_name="内网IP")
    publicip = models.CharField(blank=True, null=True, max_length=64, verbose_name="公网IP")
    comment = models.TextField(blank=True, null=True, verbose_name="备注")

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "meteor_servers"
        verbose_name = '服务器'

class  Services(models.Model):
    project = models.ForeignKey(Projects, verbose_name="所属项目")
    name = models.CharField(max_length=64, verbose_name="服务名称")
    tags = models.CharField(blank=True, null=True, max_length=64, verbose_name="")
    comment = models.TextField(blank=True, null=True, verbose_name="备注")

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "meteor_services"
        verbose_name = '服务'
