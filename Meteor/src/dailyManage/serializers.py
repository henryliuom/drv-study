# -*- coding:utf-8 -*-
from rest_framework import serializers
from models import *
from userPermission.models import *

class DutysheetSearchSerializer(serializers.ModelSerializer):
    # staff = serializers.SlugRelatedField(queryset=Staffs.objects.all(), slug_field='name')
    class Meta:
        model = Dutysheets
        fields = ('id', 'quantum', 'content', 'date', 'photo', 'deleteTag', 'deleteDate', 'staff')
        depth = 1
class DutysheetSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dutysheets
        fields = ('id', 'quantum', 'content', 'date', 'photo', 'deleteTag', 'deleteDate', 'staff')