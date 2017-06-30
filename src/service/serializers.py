# -*- coding:utf-8 -*-
from rest_framework import serializers
from .models import *


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Projects
        fields = ('id', 'name', 'comment', 'staff')

class ServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Services
        fields = ('id', 'name', 'type', 'port', 'tags', 'comment', 'project', 'server', 'staff')