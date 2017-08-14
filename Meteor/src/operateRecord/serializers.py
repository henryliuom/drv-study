# -*- coding:utf-8 -*-
from rest_framework import serializers
from models import *
import sys

reload(sys)
sys.setdefaultencoding('utf8')

class OperaterecordsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Operaterecords
        fields = ('id', 'staff', 'userip', 'date', 'secondmenu', 'operate', 'olddata', 'newdata', 'comment')

class OperaterecordSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Operaterecords
        fields = ('id', 'staff', 'userip', 'date', 'secondmenu', 'operate', 'olddata', 'newdata', 'comment')
        depth = 1

