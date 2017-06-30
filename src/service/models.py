# -*- coding: utf-8 -*-

from django.db import models
from assets.models import *
from staff.models import *
from permission.models import *

# Create your models here.
class Projects(models.Model):
    name = models.CharField(max_length=80, blank=False, null=False, unique=True)
    comment = models.CharField(max_length=160, blank=True, null=True)
    staff = models.ForeignKey(Staffs)

    def __unicode__(self):
        return self.name

    class Meta:
        db_table = "cmdb_projects"

class Services(models.Model):
    name = models.CharField(max_length=80, blank=False, null=False, unique=True)
    type = models.CharField(max_length=50, blank=True, null=True)
    port = models.CharField(max_length=10, blank=True, null=True)
    tags = models.CharField(max_length=20, blank=True, null=True)
    comment = models.CharField(max_length=160, blank=True, null=True)
    project = models.ForeignKey(Projects)
    server = models.ForeignKey(Servers)
    staff = models.ForeignKey(Staffs)

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "cmdb_services"

class iptables(models.Model):
    server = models.ForeignKey(Servers)
    iptable = models.TextField
    comment = models.CharField(max_length=160, blank=True, null=True)

    def __unicode__(self):
        return self.server
    class Meta:
        db_table = "cmdb_iptables"
