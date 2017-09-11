# -*- coding: utf-8 -*-
from userPermission.serializers import *
from meteor.api import *
from userPermission.models import *
from rest_framework.response import Response
from django.shortcuts import render_to_response
from rest_framework.decorators import api_view
from rest_framework import status
from django.http import HttpResponseRedirect
import hashlib, simplejson

@login_required()
def dashbard(request):
    try:
        name = request.session['user']
        return render_to_response('index.html', locals(), request)
    except Exception as e:
        print e
        HttpResponseRedirect('/login/')

@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def login(request):
    if request.method == 'GET':
        return render_to_response('login.html', locals(), request)
        # return Response(locals(), template_name='login.html')
    elif request.method == 'POST':
        try:
            dict = simplejson.loads(request.body)
            username = dict['name']
            password = dict['password']
            # username = request.POST.get('name')
            # password = request.POST.get('password')
            if ''.join(username.split(' '))=='': return Response(u'error,用户名不能为空')
            if password!=None: password = hashlib.md5(password).hexdigest()
            else:
                return Response(u'error,密码不能为空')
            staff = Staffs.objects.get(name=username, password=password)
        except Staffs.DoesNotExist:
            message = u"error,用户名或密码错误"
            return Response(message)
            # return Response(status=status.HTTP_404_NOT_FOUND)
        serializer = StaffSearchSerializer(staff)
        # print serializer.data
        request.session['user'] = serializer.data['name']
        request.session['userid'] = serializer.data['id']
        Operaterecord().saverecord(request, '', '', 'login')
        # permission_required(request)
        return Response(serializer.data)
        # return render_to_response('index.html', locals(), request)

def logout(request):
    request.session['user'] = ''
    request.session['userid'] = ''
    return HttpResponseRedirect('/login/')

