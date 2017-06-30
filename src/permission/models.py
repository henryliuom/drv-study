# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Firstmenu(models.Model):
    name = models.CharField(max_length=80, unique=True)
    iconclass = models.CharField(max_length=80)
    comment = models.CharField(max_length=160, blank=True, null=True)

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "cmdb_firstmenu"
class Secondmenu(models.Model):
    firstmenu = models.ForeignKey(Firstmenu)
    name = models.CharField(max_length=80, unique=True)
    url = models.CharField(max_length=200, unique=True)
    onshow = models.BooleanField()
    comment = models.CharField(max_length=160, blank=True, null=True)

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "cmdb_secondmenu"