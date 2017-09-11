# coding:utf-8
from cloudxns.api import *
from userPermission.models import *
from userPermission.serializers import *
from menuManage.models import *
from operateRecord.models import *
from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.http import HttpResponse
import requests, json, re, datetime, etcd
import dns.resolver

ipurl = 'http://ip.taobao.com/service/getIpInfo.php'


def locationsearch(ip):
    try:
        result = requests.get(ipurl, params={'ip': ip}).text
        data = json.loads(result)
        return "%s%s%s" % (data['data']['isp'], data['data']['region'], data['data']['city'])
    except:
        print "%15s: timeout" % ip
        return 'Null'


def dnsresolve(url):
    domain = re.findall('(\S+)', url)
    try:
        while 1 > 0:
            A = dns.resolver.query(domain[0], 'A')  # 指定查询类型为A记录
            for i in A.response.answer:  # 通过response.answer方法获取查询回应信息
                for j in i.items:
                    return j.address
    except:
        print "%15s: timeout" % url
        return 'Null'


class DnsApi():
    def __init__(self):
        self.api_key = 'b7ba4b3351fcf0b5ec2cae89011a0d2b'
        self.secret_key = 'sdf'
        # self.secret_key = '279a4d57f7d98f8d'
        self.api = Api(api_key=self.api_key, secret_key=self.secret_key)

    def get_domain_id(self, domain_name):
        true_domain = domain_name + '.'
        result = self.api.domain_list()
        domains = json.loads(result)['data']
        for domain in domains:
            if domain['domain'] == true_domain:
                return domain['id']

    def get_record_id(self, domain_id, host):
        result = self.api.record_list(domain_id)
        records = json.loads(result)['data']
        for record in records:
            if record['host'] == host:
                return record['record_id']

    def update_record_value(self, domain, host, ip, record_type):
        self.domain_id = self.get_domain_id(domain)
        self.record_id = self.get_record_id(self.domain_id, host)
        result = self.api.record_update(self.record_id, self.domain_id, host, ip, record_type)
        return result


class Operaterecord(object):
    def __init__(self):
        self.dict = {}
        self.dict['date'] = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    def saverecord(self, request, olddata, newdata, operate):
        if request.META.has_key('HTTP_X_FORWARDED_FOR'):
            ip = request.META['HTTP_X_FORWARDED_FOR']
        else:
            ip = request.META['REMOTE_ADDR']
        try:
            self.dict['staff'] = Staffs.objects.get(name=request.session['user'])
        except:
            self.dict['staff'] = None
            # print dict['staff']
        path = request.path
        try:
            secondmenu = Secondmenus.objects.get(url="/" + "/".join(path.split('/')[:-1][1:]) + "/")
            self.dict['comment'] = ''
        except:
            secondmenu = None
            self.dict['comment'] = '操作链接为：' + "/" + "/".join(
                    path.split('/')[:-1][1:]) + "/"
        self.dict['secondmenu'] = secondmenu
        self.dict['operate'] = operate
        self.dict['olddata'] = json.dumps(olddata, encoding="utf-8", ensure_ascii=False)
        self.dict['newdata'] = json.dumps(newdata, encoding="utf-8", ensure_ascii=False)
        self.dict['userip'] = ip
        if self.dict['operate'] == 'login':
            self.dict['comment'] = '用户登入'
        Operaterecords.objects.create(staff=self.dict['staff'], date=self.dict['date'],
                                      secondmenu=self.dict['secondmenu'], operate=self.dict['operate'],
                                      olddata=self.dict['olddata'],
                                      newdata=self.dict['newdata'], userip=self.dict['userip'],
                                      comment=self.dict['comment'])

def login_required():
    def permission_check(view_func):
        def _wrapped_view(request, *args, **kwargs):
            try:
                userid = request.session['userid']
                username = request.session['user']
            except Exception as e:
                # print e.message
                message = 'login required'
                return HttpResponse(json.dumps(message), content_type="application/json")
                # return HttpResponseRedirect('/login/')
            try:
                Staffs.objects.get(id=userid, name=username)
                return view_func(request, *args, **kwargs)
            except:
                message = 'login required'
                return HttpResponse(json.dumps(message), content_type="application/json")
                # return HttpResponseRedirect('/login/')
        return _wrapped_view
    return permission_check

def permission_required():
    def permission_check(view_func):
        def _wrapped_view(request, *args, **kwargs):
            try:
                userid = request.session['userid']
            except Exception as e:
                print e.message
                return HttpResponseRedirect('/login/')
            reqpath = request.path
            method = request.method
            secondmenu = reqpath.split('/')[2]
            if secondmenu[-6:] == 'modify':
                ##详情权限请求
                if method == 'GET':
                    reqpermission = 0  ##请求数据库中权限字符串第0位权限，权限依次为查看、添加、修改、删除
                ##修改权限请求
                elif method == 'PUT':
                    reqpermission = 2
                elif method == 'DELETE':
                    reqpermission = 3
                reqpath = '/' + reqpath.split('/')[1] + '/' + secondmenu[:-6] + 's/'
            else:
                ##查询权限请求
                if method == 'GET':
                    reqpermission = 0
                ##添加权限请求
                elif method == 'POST':
                    reqpermission = 1
            staffroles = []
            # print reqpath, reqpermission, method, request.session['user']
            staffrole = Roles.objects.filter(id=StaffRoles.objects.filter(staff=userid).values('role')).values('name')
            for i in staffrole:
                staffroles.append(i['name'])
            ##超级管理员拥有所有权限
            if '超级管理员' in staffroles:
                return view_func(request, *args, **kwargs)
            try:
                staffpermission = StaffPermissions.objects.filter(staff=userid, secondmenu=Secondmenus.objects.filter(
                    url=reqpath).values('id'))
                for i in staffpermission:
                    serializer = StaffPermissionsSearchSerializer(i)
                    if serializer.data['permission'][reqpermission] == '1':
                        return view_func(request, *args, **kwargs)
            except Exception as e:
                print e.message
            try:
                rolepermission = RolePermissions.objects.filter(
                        role__id=StaffRoles.objects.filter(staff=userid).values('role'),
                        secondmenu=Secondmenus.objects.filter(url=reqpath).values('id'))
                for i in rolepermission:
                    serializer = RolePermissionSearchSerializer(i)
                    if serializer.data['permission'][reqpermission] == '1':
                        return view_func(request, *args, **kwargs)
                    else:
                        message = 'permission required'
                        return HttpResponse(json.dumps(message), content_type="application/json")
                        # return render_to_response('permissionerror.html', locals(), request)
            except Exception as e:
                print e.message
                return render_to_response('permissionerror.html', locals(), request)
            message = 'permission required'
            return HttpResponse(json.dumps(message), content_type="application/json")
            # return render_to_response('permissionerror.html', locals(), request)
        return _wrapped_view
    return permission_check

class EtcdOperate(object):
    def __init__(self):
        self.client = etcd.Client(host='127.0.0.1', port=2379)
    def getkey(self, name):
        keys = self.client.read(name, recursive = True)
        dict = {}
        node = []
        if len(keys._children) != 0:
            for child in keys._children:
                if "value" in child: dict[child['key'].split('/')[-1]] = child['value'],
                elif "nodes" in child: node.append(child['key'])
        else: dict[name.split('/')[-1]] = keys.value
        return dict,node
    def setkey(self, keys):
        ##keys 为字典格式
        for key in keys:
            self.client.write(key, keys[key])
        return 'ok'
    def delkey(self, key):
        self.client.delete(key)
        return 'ok'

