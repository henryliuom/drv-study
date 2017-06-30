### 环境要求
1. python2.7
2. django1.11
3. mysql
4. vue-cli
### 包安装
``` bash
yum install gcc zlib-devel openssl-devel readline readline-devel mysql-devel mysql mysql-client
```
```
pip install mysql-python mysqlclient
```

### 配置
1. 创建cmdb数据库
2. 将database目录下的数据库文件导入到数据库里
3. 创建mysql用户，用户名：cmdbuser，密码：cmdbuserpass。
4. 分配cmdbuser用户的cmdb数据库权限

### 模块
#### hosts模块
1. iptables函数：实现iptables的增删改查功能

#### permission模块
1. menuadd函数：实现父菜单增、删、改、查功能
2. submenuadd函数：实现子菜单增、删、改、查功能
