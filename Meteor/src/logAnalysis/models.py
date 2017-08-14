# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from serverManage.models import *
import datetime

# Create your models here.
class  Loganalysis_agent(models.Model):
    service = models.ForeignKey(Services, blank=True, null=True, verbose_name="服务")
    logservice = models.CharField(max_length=64, blank=True, null=True, verbose_name="日志所属服务")
    http_user_agent = models.TextField(blank=True, null=True, verbose_name="用户设备类型")
    timestamp = models.TextField(blank=True, null=True, verbose_name="统计时间")
    size = models.IntegerField(blank=True, null=True, verbose_name="统计数")

    def __unicode__(self):
        return self.http_user_agent
    class Meta:
        db_table = "meteor_loganalysis_agent"
        verbose_name = '日志分析用户设备统计'

class  Loganalysis_area(models.Model):
    service = models.ForeignKey(Services, blank=True, null=True, verbose_name="服务")
    logservice = models.CharField(max_length=64, blank=True, null=True, verbose_name="日志所属服务")
    clientip = models.TextField(blank=True, null=True, verbose_name="用户所在地区")
    timestamp = models.TextField(blank=True, null=True, verbose_name="统计时间")
    size = models.IntegerField(blank=True, null=True, verbose_name="统计数")

    def __unicode__(self):
        return self.location
    class Meta:
        db_table = "meteor_loganalysis_area"
        verbose_name = '日志分析用户所在地区统计'

class  Loganalysis_cdn(models.Model):
    service = models.ForeignKey(Services, blank=True, null=True, verbose_name="服务")
    logservice = models.CharField(max_length=64, blank=True, null=True, verbose_name="日志所属服务")
    cdnip = models.TextField(blank=True, null=True, verbose_name="用户访问的cdn节点ip")
    timestamp = models.TextField(blank=True, null=True, verbose_name="统计时间")
    size = models.IntegerField(blank=True, null=True, verbose_name="统计数")

    def __unicode__(self):
        return self.location
    class Meta:
        db_table = "meteor_loganalysis_cdn"
        verbose_name = '日志分析用户访问cdn统计'

class  Loganalysis_http(models.Model):
    service = models.ForeignKey(Services, blank=True, null=True, verbose_name="服务")
    logservice = models.CharField(max_length=64, blank=True, null=True, verbose_name="日志所属服务")
    domain = models.TextField(blank=True, null=True, verbose_name="用户访问的域名")
    timestamp = models.TextField(blank=True, null=True, verbose_name="统计时间")
    size = models.IntegerField(blank=True, null=True, verbose_name="统计数")

    def __unicode__(self):
        return self.domain
    class Meta:
        db_table = "meteor_loganalysis_http"
        verbose_name = '日志分析用户访问域名统计'

class  Loganalysis_status(models.Model):
    service = models.ForeignKey(Services, blank=True, null=True, verbose_name="服务")
    logservice = models.CharField(max_length=64, blank=True, null=True, verbose_name="日志所属服务")
    status = models.IntegerField(blank=True, null=True, verbose_name="用户访问状态码")
    timestamp = models.TextField(blank=True, null=True, verbose_name="统计时间")
    size = models.IntegerField(blank=True, null=True, verbose_name="统计数")

    def __unicode__(self):
        return self.status
    class Meta:
        db_table = "meteor_loganalysis_status"
        verbose_name = '日志分析用户访问状态码统计'

class  Loganalysis_upstream(models.Model):
    service = models.ForeignKey(Services, blank=True, null=True, verbose_name="服务")
    logservice = models.CharField(max_length=64, blank=True, null=True, verbose_name="日志所属服务")
    upstreamaddr = models.TextField(blank=True, null=True, verbose_name="Nginx转发地址")
    timestamp = models.TextField(blank=True, null=True, verbose_name="统计时间")
    size = models.IntegerField(blank=True, null=True, verbose_name="统计数")

    def __unicode__(self):
        return self.upstreamaddr
    class Meta:
        db_table = "meteor_loganalysis_upstream"
        verbose_name = '日志分析Nginx转发统计'

