# -*- coding:utf-8 -*-
from rest_framework import serializers
from .models import *


class FirstmenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = Firstmenu
        fields = ('id', 'name', 'iconclass', 'comment')

class SecondmenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = Secondmenu
        fields = ('id', 'name', 'url', 'onshow', 'comment', 'firstmenu')