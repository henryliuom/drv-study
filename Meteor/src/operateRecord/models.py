# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from menuManage.models import *
from userPermission.models import *
import datetime

# Create your models here.
class Operaterecords(models.Model):
    staff = models.ForeignKey(Staffs, verbose_name="操作用户", blank=True, null=True)
    userip = models.CharField(max_length=15, blank=True)
    date = models.DateTimeField(verbose_name="操作时间", default=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    secondmenu = models.ForeignKey(Secondmenus, verbose_name="操作模块", null=True)
    operate_choices = (
        ('add', '添加'),
        ('delete', '删除'),
        ('modify', '修改'),
        ('view', '查看'),
    )
    operate = models.CharField(max_length=6, choices=operate_choices)
    olddata = models.TextField(blank=True)
    newdata = models.TextField(blank=True)
    comment = models.CharField(max_length=160, blank=True, null=True)
    def __unicode__(self):
        return self.staff
    class Meta:
        db_table = "meteor_operaterecords"