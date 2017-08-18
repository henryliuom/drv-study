# -*- coding: utf-8 -*-
from userPermission.serializers import *
from meteor.api import *
from userPermission.models import *
from rest_framework.response import Response
from django.shortcuts import render_to_response
from rest_framework import status
from django.http import HttpResponseRedirect
import hashlib

@login_required()
def dashbard(request):
    try:
        name = request.session['user']
        print 'name: ', name
        return render_to_response('index.html', locals(), request)
    except Exception as e:
        print e
        HttpResponseRedirect('/login/')

def login(request):
    if request.method == 'GET':
        return render_to_response('login.html', locals(), request)
        # return Response(locals(), template_name='login.html')
    elif request.method == 'POST':
        try:
            username = request.POST.get('username')
            password = request.POST.get('password')
            password = hashlib.md5(password).hexdigest()
            staff = Staffs.objects.get(name=username, password=password)
        except Staffs.DoesNotExist:
            message = "用户或密码错误，请重新登入"
            print message
            return render_to_response('login.html', locals(), request)
            return Response(status=status.HTTP_404_NOT_FOUND)
        serializer = StaffSearchSerializer(staff)
        # print serializer.data
        request.session['user'] = serializer.data['name']
        request.session['userid'] = serializer.data['id']
        Operaterecord().saverecord(request, '', '', 'login')
        # permission_required(request)
        return render_to_response('index.html', locals(), request)

def logout(request):
    request.session['user'] = ''
    request.session['userid'] = ''
    return HttpResponseRedirect('/login/')

