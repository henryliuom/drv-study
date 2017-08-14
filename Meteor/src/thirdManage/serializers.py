# -*- coding:utf-8 -*-
from rest_framework import serializers
from models import *

class PayhostsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Payhosts
        fields = ('id', 'ip', 'location', 'comment')

class PaydnsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Paydnses
        fields = ('id', 'domainname', 'ip', 'comment', 'project')

class PaydnsSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Paydnses
        fields = ('id', 'domainname', 'ip', 'comment', 'project')
        depth = 1

