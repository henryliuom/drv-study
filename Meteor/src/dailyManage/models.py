# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from userPermission.models import *
import datetime

# Create your models here.
class  Dutysheets(models.Model):
    staff = models.ForeignKey(Staffs, verbose_name="交接人员")
    quantum_choices = (
        ('e', '早班'),
        ('m', '中班'),
        ('n', '晚班'),
    )
    quantum = models.CharField(max_length=4, choices=quantum_choices, blank=True, null=True, default='e', verbose_name="班次")
    content = models.TextField(blank=True, null=True, verbose_name="交接记录")
    date = models.DateTimeField(blank=True, null=True, verbose_name="交接时间", default=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    photo = models.ImageField(upload_to='dutyImg', default='dutyImg/no-img.png', verbose_name="交接图片")
    deleteTag = models.CharField(max_length=20, blank=True, null=True, verbose_name="删除标记")
    deleteDate = models.DateTimeField(blank=True, null=True,  verbose_name="删除时间", default=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))

    def __unicode__(self):
        return self.staff
    class Meta:
        db_table = "meteor_dutysheets"
        verbose_name = '值班文档交接'