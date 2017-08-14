# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models

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
    group = models.ForeignKey('Groups')

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "meteor_staffs"
