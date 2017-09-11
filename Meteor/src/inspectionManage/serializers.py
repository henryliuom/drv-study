# -*- coding:utf-8 -*-
from rest_framework import serializers
from models import *

class ServerinspectionsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Serverinspections
        fields = ('id', 'inspectdate', 'cpu', 'mem', 'diskroot', 'diskhome', 'port', 'comment', 'server')

class ServerinspectionsSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Serverinspections
        fields = ('id', 'inspectdate', 'cpu', 'mem', 'diskroot', 'diskhome', 'port', 'comment', 'server')
        depth = 1