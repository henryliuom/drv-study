# -*- coding:utf-8 -*-
from rest_framework import serializers
from models import *

class ProjectsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Projects
        fields = ('id', 'name', 'comment', 'staff')

class ProjectsSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Projects
        fields = ('id', 'name', 'comment', 'staff')
        depth = 1

class IdcsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Idcs
        fields = ('id', 'name', 'location', 'telephone', 'comment', 'staff')

class IdcsSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Idcs
        fields = ('id', 'name', 'location', 'telephone', 'comment', 'staff')
        depth = 1

class ServersSerializer(serializers.ModelSerializer):
    class Meta:
        model = Servers
        fields = ('id', 'name', 'sn', 'cpu', 'mem', 'disktype', 'diskcapacity', 'nic', 'expiredate', 'privateip', 'publicip', 'comment', 'idc', 'staff')

class ServersSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Servers
        fields = ('id', 'name', 'sn', 'cpu', 'mem', 'disktype', 'diskcapacity', 'nic', 'expiredate', 'privateip', 'publicip', 'comment', 'idc', 'staff')
        depth = 1

class ServicesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Services
        fields = ('id', 'name', 'tags', 'comment', 'project')

class ServicesSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Services
        fields = ('id', 'name', 'tags', 'comment', 'project')
        depth = 1