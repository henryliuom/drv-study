#coding:utf-8
from cloudxns.api import *
from userPermission.models import *
from menuManage.models import *
from operateRecord.models import *
import requests, json, re, datetime
import dns.resolver

ipurl = 'http://ip.taobao.com/service/getIpInfo.php'

def locationsearch(ip):
    try:
        result = requests.get(ipurl, params={'ip':ip}).text
        data = json.loads(result)
        return "%s%s%s" % (data['data']['isp'],data['data']['region'],data['data']['city'])
    except:
        print "%15s: timeout" % ip
        return 'Null'

def dnsresolve(url):
    domain = re.findall('(\S+)',url)
    try:
        while 1>0:
            A = dns.resolver.query(domain[0], 'A')    #指定查询类型为A记录
            for i in A.response.answer:   #通过response.answer方法获取查询回应信息
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

    def get_domain_id(self,domain_name):
        true_domain = domain_name + '.'
        result = self.api.domain_list()
        domains = json.loads(result)['data']
        for domain in domains:
            if domain['domain'] == true_domain:
                return domain['id']

    def get_record_id(self,domain_id,host):
        result = self.api.record_list(domain_id)
        records = json.loads(result)['data']
        for record in records:
            if record['host'] == host:
                return record['record_id']

    def update_record_value(self,domain,host,ip,record_type):
        self.domain_id = self.get_domain_id(domain)
        self.record_id = self.get_record_id(self.domain_id,host)
        result = self.api.record_update(self.record_id,self.domain_id,host,ip,record_type)
        return result

class Operaterecord(object):
    def __init__(self):
        self.dict = {}
        self.dict['date'] = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    def saverecord(self, request, olddata, newdata,operate):
        if request.META.has_key('HTTP_X_FORWARDED_FOR'):
            ip = request.META['HTTP_X_FORWARDED_FOR']
        else:
            ip = request.META['REMOTE_ADDR']
        if request.user.get_username()=='':
            self.dict['staff'] = None
            # print dict['staff']
        else:
            self.dict['staff'] = Staffs.objects.get(name=request.user.get_username()).id
        path = request.path
        try:
            secondmenu = Secondmenus.objects.get(url="/" + "/".join(path.split('/')[:-1][1:]) + "/")
            self.dict['comment'] = ''
        except:
            secondmenu = ''
            self.dict['comment'] = '大哥，子菜单栏中没有对应的链接' + path + '请到子菜单栏中添加该链接，谢谢大哥！'
        self.dict['secondmenu'] = secondmenu
        self.dict['operate'] = operate
        self.dict['olddata'] = json.dumps(olddata, encoding="utf-8", ensure_ascii=False)
        self.dict['newdata'] = json.dumps(newdata, encoding="utf-8", ensure_ascii=False)
        self.dict['userip'] = ip
        Operaterecords.objects.create(staff=self.dict['staff'], date=self.dict['date'], secondmenu=self.dict['secondmenu'], operate=self.dict['operate'], olddata=self.dict['olddata'],
                                      newdata=self.dict['newdata'], userip=self.dict['userip'], comment=self.dict['comment'])