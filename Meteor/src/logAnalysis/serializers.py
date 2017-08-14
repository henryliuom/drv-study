# -*- coding:utf-8 -*-
from rest_framework import serializers
from models import *

class Loganalysis_agentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loganalysis_agent
        fields = ('id', 'http_user_agent', 'timestamp', 'size', 'service', 'logservice')

class Loganalysis_agentSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loganalysis_agent
        fields = ('id', 'http_user_agent', 'timestamp', 'size', 'service', 'logservice')
        depth = 1

class Loganalysis_areaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loganalysis_area
        fields = ('id', 'clientip', 'timestamp', 'size', 'service', 'logservice')

class Loganalysis_areaSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loganalysis_area
        fields = ('id', 'clientip', 'timestamp', 'size', 'service', 'logservice')
        depth = 1

class Loganalysis_cdnSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loganalysis_cdn
        fields = ('id', 'cdnip', 'timestamp', 'size', 'service', 'logservice')

class Loganalysis_cdnSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loganalysis_cdn
        fields = ('id', 'cdnip', 'timestamp', 'size', 'service', 'logservice')
        depth = 1

class Loganalysis_httpSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loganalysis_http
        fields = ('id', 'domain', 'timestamp', 'size', 'service', 'logservice')

class Loganalysis_httpSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loganalysis_http
        fields = ('id', 'domain', 'timestamp', 'size', 'service', 'logservice')
        depth = 1

class Loganalysis_statusSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loganalysis_status
        fields = ('id', 'status', 'timestamp', 'size', 'service', 'logservice')

class Loganalysis_statusSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loganalysis_status
        fields = ('id', 'status', 'timestamp', 'size', 'service', 'logservice')
        depth = 1

class Loganalysis_upstreamSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loganalysis_upstream
        fields = ('id', 'upstreamaddr', 'timestamp', 'size', 'service', 'logservice')

class Loganalysis_upstreamSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loganalysis_upstream
        fields = ('id', 'upstreamaddr', 'timestamp', 'size', 'service', 'logservice')
        depth = 1