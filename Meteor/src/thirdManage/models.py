# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from classmate.api import locationsearch, dnsresolve
from serverManage.models import *

class Payhosts(models.Model):
    ip = models.CharField(max_length=100, blank=True)
    location = models.CharField(max_length=100, blank=True,default='', help_text='ip所在地，自动生成')
    comment = models.TextField(blank=True, null=True, verbose_name="备注")

    class Meta:
        db_table = "meteor_payhosts"
        ordering = ('ip',)
    def save(self, force_insert=False, force_update=False, using=None):
        # 设置ip归属地
        self.location = locationsearch(self.ip)
        super(Payhosts, self).save()

class Paydnses(models.Model):
    project = models.ForeignKey(Projects, verbose_name="项目")
    domainname = models.CharField(max_length=100, blank=True,default='')
    ip = models.CharField(max_length=40, blank=True,default='', help_text='自动生成')
    comment = models.CharField(max_length=100, blank=True,default='')

    class Meta:
        db_table = "meteor_paydnses"
        ordering = ('project',)
    def save(self, force_insert=False, force_update=False, using=None):
        # 根据域名自动解析IP
        self.ip = dnsresolve(self.domainname)
        super(Paydnses, self).save()