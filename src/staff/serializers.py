# -*- coding:utf-8 -*-
from rest_framework import serializers
from .models import *


class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Departments
        fields = ('id', 'name', 'comment')

class StaffSerializer(serializers.ModelSerializer):
    class Meta:
        model = Staffs
        fields = ('id', 'name', 'sex', 'position','comment', 'department')