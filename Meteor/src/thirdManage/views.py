# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import render_to_response
from rest_framework import status
from meteor.api import *
from models import *
from serializers import *
from django.core.files.base import ContentFile
import json, urllib2

# Create your views here.

@login_required()
@permission_required()
@api_view([ 'POST', 'GET' ])
def payhosts(request):
    # 查询表格所有记录
    if request.method == 'GET':
        payhost = Payhosts.objects.all()
        serializer = PayhostsSerializer(payhost,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        serializer = PayhostsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            ## 记录操作日志
            Operaterecord().saverecord(request, '', serializer.data, 'add')
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def payhostmodify(request, pk):
    try:
        payhost = Payhosts.objects.get(pk=pk)
    except Payhosts.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = PayhostsSerializer(payhost)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = PayhostsSerializer(payhost).data
        # print olddata['comment']
        serializer = PayhostsSerializer(payhost, data=request.data)
        if serializer.is_valid():
            serializer.save()
            ## 记录操作日志
            Operaterecord().saverecord(request, olddata, serializer.data, 'modify')
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # 删除
    elif request.method == 'DELETE':
        ## 删除前记录
        olddata = PayhostsSerializer(payhost).data
        payhost.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

@login_required()
@permission_required()
@api_view([ 'POST', 'GET' ])
def paydnses(request):
    # 查询表格所有记录
    if request.method == 'GET':
        paydns = Paydnses.objects.all()
        serializer = PaydnsSearchSerializer(paydns,many=True)
        return Response(serializer.data)
        # return render_to_response('dailyManage/dutysheets.html', locals(), request)
    # 添加纪录
    if request.method == 'POST':
        serializer = PaydnsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            ## 记录操作日志
            Operaterecord().saverecord(request, '', serializer.data, 'add')
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def paydnsmodify(request, pk):
    try:
        paydns = Paydnses.objects.get(pk=pk)
    except Paydnses.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    # 查询详情
    if request.method == 'GET':
        serializer = PaydnsSearchSerializer(paydns)
        return Response(serializer.data)
    # 修改
    elif request.method == 'PUT':
        ## 修改前记录
        olddata = PaydnsSerializer(paydns).data
        # print olddata['comment']
        domainname = request.data["domainname"]
        if domainname != '' and len(domainname.split('.')) > 2:
            ip = request.data["ip"]
            hosta = domainname.split('.')[0]
            domain = ".".join(domainname.split('.')[1:])
            # json.loads(DnsApi.update_record_value(domain,hosta,ip,'A'))   #使用此功能还需修改api.py里的secret_key变量
            serializer = PaydnsSerializer(paydns, data=request.data)
            if serializer.is_valid():
                serializer.save()
                ## 记录操作日志
                Operaterecord().saverecord(request, olddata, serializer.data, 'modify')
                return Response(serializer.data)
            else:
                return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response("域名编写不规范")
    # 删除
    elif request.method == 'DELETE':
        ## 删除前记录
        olddata = PaydnsSerializer(paydns).data
        paydns.delete()
        ## 记录操作日志
        Operaterecord().saverecord(request, olddata, '', 'delete')
        return Response(status=status.HTTP_204_NO_CONTENT)

def etcds(request):
    ##查询etcd的key值
    if request.method == 'GET':
        if 'key' in request.GET:
            name = request.GET.get('key')
            name = ''.join(name.split(' '))
            if name != '':
                try:
                    keys, node = EtcdOperate().getkey(name)
                except:
                    message = "没有对应的key：" + name
            else: message = '请输入key的值'
        return render_to_response('thirdManage/etcds.html', locals(), request)
    ##设置etcd键值
    elif request.method == 'POST':
        name = request.POST.get('key')
        value = request.POST.get('value')
        if name!='' and value!='':
            keys = {}
            keys[name] = value
            message = EtcdOperate().setkey(keys)
        else: message = '名称和值不能为空'
        return render_to_response('thirdManage/etcds.html', locals(), request)

def vpost(url,site_id):
        data = {}
        data['api_id']   = '21833'
        data['api_key']  = 'ca3d879c-e8d4-45e5-b9e9-2eb1dfd9aa15'
        data['site_id']  = site_id
        request = urllib2.Request(url)
        response = urllib2.urlopen(request,urllib.urlencode(data))
        return response.read()

# 清除缓存
def purgecache(request):
    res = ''
    IURL = 'https://my.incapsula.com/api/prov/v1/sites/cache/purge'
    if request.method == 'POST':
        post_key = [x + '_IDS' for x in request.POST.viewkeys() if x!='csrfmiddlewaretoken'][0]
        try:
            cdnid = Products.objects.filter(coding=post_key)[0].cdnid
            print cdnid
            #清理产品缓存
            for i in cdnid.split(','):
                if i!='':
                    tt = json.loads(vpost(IURL,i))
                    if tt['res_message'] == 'OK':
                        res = post_key.split('_IDS')[0] +  u'缓存清理成功'
        except:
            res = '缓存清除失败：数据库中无%s编码，请到http://xxx/admin/devops/products/链接下添加产品编码及对应的cdn id' %(post_key)
    return render(request, "thirdmanage/purge_cache.html",{'res': res})

@login_required()
@permission_required()
@api_view([ 'PUT', 'DELETE', 'POST', 'GET' ])
def paydnssearch(request):
    if request.method == 'GET':
        if 'fid' not in request.GET: return Response('fid不存在，请传fid参数')
        project = request.GET['fid']
        project = ''.join(project.split(' '))
        if project=='': return Response('项目ID不能为空')
        elif project=='all':
            paydns=Paydnses.objects.select_related('project').all()
            serializer = PaydnsSearchSerializer(paydns,many=True)
            return Response(serializer.data)
        else:
            paydns=Paydnses.objects.filter(project=project)
            serializer = PaydnsSearchSerializer(paydns,many=True)
            return Response(serializer.data)