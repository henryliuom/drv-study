# -*- coding: utf-8 -*-

from django.db import models

# Create your models here.
class Idcs(models.Model):
    name = models.CharField(max_length=80, unique=True)
    address = models.CharField(max_length=200, blank=True)
    comment = models.CharField(max_length=160, blank=True, null=True)

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "cmdb_idcs"

class Servers(models.Model):
    name = models.CharField(max_length=80, unique=True)
    ip = models.CharField(max_length=15, unique=True)
    cpu = models.CharField('CPU', max_length=15, blank=True)
    mem = models.CharField('Memory', max_length=15, blank=True)
    disktype = models.CharField(max_length=15, blank=True)
    disksize = models.CharField(max_length=15, blank=True)
    nic = models.CharField('NIC', max_length=50, blank=True)
    manufactory = models.CharField('Manufactory', max_length=100, blank=True)
    model = models.CharField('Manufactory', max_length=50, blank=True)
    apply_date = models.DateField('DateOfApplication', blank=True)
    expire_date = models.DateField('DateOfExpire', blank=True)
    uuid = models.CharField(max_length=50, blank=True)
    idc = models.ForeignKey(Idcs, blank=True)
    comment = models.CharField(max_length=160, blank=True)

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "cmdb_servers"
