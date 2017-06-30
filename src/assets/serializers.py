# -*- coding:utf-8 -*-
from rest_framework import serializers
from .models import *


class IdcSerializer(serializers.ModelSerializer):
    class Meta:
        model = Idcs
        fields = ('id', 'name', 'address', 'comment')

class ServerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Servers
        fields = ('id', 'name', 'ip', 'cpu', 'mem', 'disktype', 'disksize', 'nic', 'manufactory', 'model', 'apply_date', 'expire_date', 'uuid', 'idc', 'comment')