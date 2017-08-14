# -*- coding:utf-8 -*-
from rest_framework import serializers
from models import *


class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Groups
        fields = ('id', 'name', 'comment')

class StaffSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Staffs
        fields = ('id', 'name', 'password', 'sex', 'position', 'telno', 'comment', 'group')
        depth  = 1

class StaffSerializer(serializers.ModelSerializer):
    class Meta:
        model = Staffs
        fields = ('id', 'name', 'password', 'sex', 'position', 'telno', 'comment', 'group')