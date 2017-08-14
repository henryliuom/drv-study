# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models

# Create your models here.
class Firstmenus(models.Model):
    name = models.CharField(max_length=80, unique=True)
    iconclass = models.CharField(max_length=80, blank=True)
    comment = models.CharField(max_length=160, blank=True, null=True)
    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "meteor_firstmenus"

class Secondmenus(models.Model):
    firstmenu = models.ForeignKey(Firstmenus)
    name = models.CharField(max_length=80, unique=True)
    url = models.CharField(max_length=200)
    onshow = models.BooleanField(default=False)
    comment = models.CharField(max_length=160, blank=True, null=True)
    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "meteor_secondmenus"