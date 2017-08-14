# -*- coding:utf-8 -*-
from rest_framework import serializers
from models import *

class FirstmenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = Firstmenus
        fields = ('id', 'name', 'iconclass', 'comment')

class SecondmenuSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Secondmenus
        fields = ('id', 'name', 'url', 'onshow', 'comment', 'firstmenu')
        depth = 1

class SecondmenuSerializer(serializers.ModelSerializer):
    class Meta:
        model = Secondmenus
        fields = ('id', 'name', 'url', 'onshow', 'comment', 'firstmenu')