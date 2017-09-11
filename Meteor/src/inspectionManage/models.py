# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from serverManage.models import *
import datetime

# Create your models here.

class  Serverinspections(models.Model):
    server = models.ForeignKey(Servers, verbose_name="服务器")
    inspectdate = models.DateTimeField(blank=True, null=True, verbose_name="巡检时间", default=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    cpu = models.CharField(blank=True, max_length=64, verbose_name="CPU大小")
    mem = models.CharField(blank=True, max_length=64, verbose_name="内存")
    diskroot = models.CharField(blank=True, max_length=64, verbose_name="根分区大小G")
    diskhome = models.CharField(blank=True, max_length=64, verbose_name="home分区大小G")
    port = models.CharField(blank=True, max_length=64, verbose_name="使用端口")
    comment = models.TextField(blank=True, verbose_name="备注")

    def __unicode__(self):
        return self.inspectdate
    class Meta:
        db_table = "meteor_serverinspections"
        verbose_name = '服务器巡检'