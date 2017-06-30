# -*- coding: utf-8 -*-
from django.db import models

# Create your models here.
class Departments(models.Model):
    name = models.CharField(max_length=50, blank=False, null=False, unique=True)
    comment = models.CharField(max_length=160, blank=True, null=True)

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "cmdb_departments"

class Staffs(models.Model):
    name = models.CharField(max_length=50, blank=False, null=False, unique=True)
    sex = models.CharField(max_length=1, blank=True, null=True)
    position = models.CharField(max_length=50, blank=True, null=True)
    comment = models.CharField(max_length=160, blank=True, null=True)
    department = models.ForeignKey(Departments)

    def __unicode__(self):
        return self.name
    class Meta:
        db_table = "cmdb_staffs"