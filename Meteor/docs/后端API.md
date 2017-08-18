# <h1 style="text-align:center"> Meteor后端API文档</h1>
## 用户权限管理模块
---
#### 用户组查询、添加：
* 链接：http://*serverip*/userpermission/groups/
* 查询参数：无
* 添加参数：
<table>
<tr><th>名称</th><th>类型</th><th>示例</th><th>长度</th><th>描述</th></tr>
<tr><td>name</td><td>string</td><td>OM</td><td>64</td><td>用户组名称（必填）</td></tr>
<tr><td>comment</td><td>string</td><td></td><td>160</td><td>备注</td></tr>
</table>

#### 用户组修改、删除、详情：
* 链接：http://*serverip*/userpermission/groupmodify/
* 参数：同上

#### 用户查询、添加：
* 链接：http://*serverip*/userpermission/staffs/
* 查询参数：无
* 添加参数：
<table>
<tr><th>名称</th><th>类型</th><th>示例</th><th>长度</th><th>描述</th></tr>
<tr><td>name</td><td>string</td><td>OM</td><td>64</td><td>用户名称（必填）</td></tr>
<tr><td>group</td><td>int</td><td>1</td><td></td><td>外键</td></tr>
<tr><td>password</td><td>string</td><td>123456</td><td>64</td><td>登入密码</td></tr>
<tr><td>telno</td><td>string</td><td>1358861235</td><td>64</td><td>手机号</td></tr>
<tr><td>sex</td><td>string</td><td>男</td><td>2</td><td>性别（保留字段）</td></tr>
<tr><td>position</td><td>string</td><td>运维工程师</td><td>50</td><td>职位（保留字段）</td></tr>
<tr><td>comment</td><td>string</td><td></td><td>160</td><td>备注</td></tr>
</table>

#### 用户修改、删除、详情：
* 链接：http://*serverip*/userpermission/staffmodify/
* 参数：同上

#### 角色查询、添加：
* 链接：http://*serverip*/userpermission/roles/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| name      | char | 超级管理员 | 64 | 角色名称，超级管理员角色无需分配权限，自动拥有任何权限 |
| comment | char |  | 160 | 备注 |

#### 角色修改、删除、详情：
* 链接：http://*serverip*/userpermission/rolemodify/
* 添加参数： 

#### 角色权限查询、添加：
* 链接：http://*serverip*/userpermission/rolepermissions/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| role      | int | 1 |  | 角色，外键 |
| secondmenu  | int | 1 |  | 菜单，外键 |
| permission | char | 1011 | 4 | 权限，由4位0或1的字符组成，从左到右分别是查看、添加、修改、删除，1表示有权限，0表示没有权限 |
| comment | char |  | 160 | 备注 |

#### 角色权限修改、删除、详情：
* 链接：http://*serverip*/userpermission/rolepermissionmodify/
* 添加参数： 

#### 用户角色查询、添加：
* 链接：http://*serverip*/userpermission/staffroles/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| staff      | int | 1 |  | 用户，外键 |
| role      | int | 1 |  | 角色，外键 |
| comment | char |  | 160 | 备注 |

#### 用户角色修改、删除、详情：
* 链接：http://*serverip*/userpermission/staffrolemodify/
* 添加参数：

#### 用户权限查询、添加：
* 链接：http://*serverip*/userpermission/staffpermissions/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| staff      | int | 1 |  | 用户，外键 |
| secondmenu      | int | 1 |  | 菜单，外键 |
| permission | char | 1011 | 4 | 权限，由4位0或1的字符组成，从左到右分别是查看、添加、修改、删除，1表示有权限，0表示没有权限 |
| comment | char |  | 160 | 备注 |

#### 用户权限修改、删除、详情：
* 链接：http://*serverip*/userpermission/staffpermissionmodify/
* 添加参数：

## 日常管理模块
---
#### 值班交接文档查询、添加：
* 链接：http://*serverip*/dailymanage/dutysheets/
* 查询参数：无
* 添加参数：
<table>
<tr><th>名称</th><th>类型</th><th>示例</th><th>长度</th><th>描述</th></tr>
<tr><td>staff</td><td>int</td><td>1</td><td>64</td><td>外键(必填)</td></tr>
<tr><td>quantum</td><td>choices</td><td>早班</td><td>4</td><td>选项：('e', '早班'),('m', '中班'),('n', '晚班')，默认是e</td></tr>
<tr><td>content</td><td>TextField</td><td>交接给……</td><td>50</td><td>交接记录</td></tr>
<tr><td>date</td><td>DateTimeField</td><td>2017-07-14 08:44:27</td><td></td><td>交接时间(默认是系统当前时间)</td></tr>
<tr><td>photo</td><td>ImageField</td><td></td><td></td><td>图片</td></tr>
<tr><td>deleteTag</td><td>string</td><td></td><td>20</td><td>删除标记</td></tr>
<tr><td>deleteDate</td><td>DateTimeField</td><td>2017-07-14 08:44:27</td><td></td><td>删除时间(默认是系统当前时间)</td></tr>
</table>

#### 值班交接文档修改、删除、详情：
* 链接：http://*serverip*/dailymanage/dutysheetmodify/
* 参数：同上

## 菜单管理模块
---
#### 父菜单查询、添加：
* 链接：http://*serverip*/menumanage/menus/
* 添加参数：
<table>
<tr><th>名称</th><th>类型</th><th>示例</th><th>长度</th><th>描述</th></tr>
<tr><td>name</td><td>char</td><td>日常管理</td><td>80</td><td>必填</td></tr>
<tr><td>iconclass</td><td>char</td><td>fa-class</td><td>80</td><td>菜单样式</td></tr>
<tr><td>comment</td><td>char</td><td>左侧栏一级目录</td><td>160</td><td>备注</td></tr>
</table>

#### 父菜单修改、删除、详情：
* 链接：http://*serverip*/menumanage/menumodify/
* 参数：同上

#### 子菜单查询、添加：
* 链接：http://*serverip*/menumanage/secondmenus/
* 添加参数：
<table>
<tr><th>名称</th><th>类型</th><th>示例</th><th>长度</th><th>描述</th></tr>
<tr><td>firstmenu</td><td>int</td><td>1</td><td>64</td><td>外键(必填),父菜单ID</td></tr>
<tr><td>name</td><td>char</td><td>值班交接管理</td><td>80</td><td>必填、唯一</td></tr>
<tr><td>url</td><td>char</td><td>/dailymanage/dutysheets/</td><td>200</td><td>子菜单对应url，格式为：“/…/…/”</td></tr>
<tr><td>onshow</td><td>boolean</td><td>/dailymanage/dutysheets/</td><td>1</td><td>是否在菜单栏显示，默认为false</td></tr>
<tr><td>comment</td><td>char</td><td>左侧栏一级目录</td><td>160</td><td>备注</td></tr>
</table>

#### 子菜单修改、删除、详情：
* 链接：http://*serverip*/menumanage/secondmenumodify/
* 参数：同上

## 日志分析模块
---
#### Nginx日志分析
###### 用户设备查询、添加：
* 链接：http://*serverip*/loganalysis/agents/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| logservice      | char | 千亿 | 64 | 日志所属服务 |
| http_user_agent | text | android | | 用户设备类型 |
| timestamp       | text | 2016-07-01 09:00:00 | | 统计时间 |
| size            | int  | 231 | | 访问量 |

###### 用户设备修改、删除、详情：
* 链接：http://*serverip*/loganalysis/agentmodify/
* 参数：同上

###### 用户地区查询、添加：
* 链接：http://*serverip*/loganalysis/areas/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| logservice      | char | 千亿 | 64 | 日志所属服务 |
| clientip        | text | 上海 | | 用户所在地区 |
| timestamp       | text | 2016-07-01 09:00:00 | | 统计时间 |
| size            | int  | 231 | | 访问量 |

###### 用户地区修改、删除、详情：
* 链接：http://*serverip*/loganalysis/areamodify/
* 参数：同上

###### 用户访问cdn节点查询、添加：
* 链接：http://*serverip*/loganalysis/cdns/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| logservice      | char | 千亿 | 64 | 日志所属服务 |
| cdnip           | text | 21.35.6.139 | | 访问的cdn节点IP |
| timestamp       | text | 2016-07-01 09:00:00 | | 统计时间 |
| size            | int  | 231 | | 访问量 |

###### 用户访问cdn节点修改、删除、详情：
* 链接：http://*serverip*/loganalysis/cdnmodify/
* 参数：同上

###### 用户访问域名查询、添加：
* 链接：http://*serverip*/loganalysis/domainnames/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| logservice      | char | 千亿 | 64 | 日志所属服务 |
| domain          | text | www.qy.com | | 访问的域名 |
| timestamp       | text | 2016-07-01 09:00:00 | | 统计时间 |
| size            | int  | 231 | | 访问量 |

###### 用户访问域名修改、删除、详情：
* 链接：http://*serverip*/loganalysis/domainnamemodify/
* 参数：同上

###### 用户访问状态查询、添加：
* 链接：http://*serverip*/loganalysis/statuses/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| logservice      | char | 千亿 | 64 | 日志所属服务 |
| status          | int | 200 | | 访问状态码 |
| timestamp       | text | 2016-07-01 09:00:00 | | 统计时间 |
| size            | int  | 231 | | 访问量 |

###### 用户访问状态修改、删除、详情：
* 链接：http://*serverip*/loganalysis/statusmodify/
* 参数：同上

###### Nginx后台转发查询、添加：
* 链接：http://*serverip*/loganalysis/upstreams/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| logservice      | char | 千亿 | 64 | 日志所属服务 |
| upstreamaddr    | text | 192.168.10.3 | | 转发地址 |
| timestamp       | text | 2016-07-01 09:00:00 | | 统计时间 |
| size            | int  | 231 | | 访问量 |

###### Nginx后台转发修改、删除、详情：
* 链接：http://*serverip*/loganalysis/upstreammodify/
* 参数：同上

## 第三方API功能模块
---
#### 支付dns管理
###### web服务器查询、添加：
* 链接：http://*serverip*/thirdmanage/payhosts/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| ip      | char | 222.36.5.91 | 100 | web服务器ip |
| location    | char | 上海 | 100 | ip所在地，自动生成 |
| comment       | text |  | | 备注 |

###### web服务器修改、删除、详情：
* 链接：http://*serverip*/thirdmanage/payhostmodify/
* 参数：同上

###### 支付域名解析查询、添加：
* 链接：http://*serverip*/thirdmanage/paydnses/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| project    | int | 1 |   | 项目，外键 |
| domainname    | char | www.qy.com | 100 | 域名 |
| ip      | char | 222.36.5.91 | 100 | 解析ip，自动生成 |
| comment       | text |  | | 备注 |

###### 支付域名解析修改、删除、详情：
* 链接：http://*serverip*/thirdmanage/paydnsmodify/
* 参数：同上

## 服务器管理模块
---
#### 项目管理
###### 项目查询、添加：
* 链接：http://*serverip*/servermanage/projects/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| staff   | int  | 2 |  | 项目负责人，外键 |
| name    | char |  Meteor项目 | 64 | 项目名称 |
| comment | text |  | | 备注 |

###### 项目修改、删除、详情：
* 链接：http://*serverip*/servermanage/projectmodify/
* 添加参数： 同上

#### IDC管理
###### IDC查询、添加：
* 链接：http://*serverip*/servermanage/idcs/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| staff    | int  | 2 |  | 项目负责人，外键 |
| name     | char | 阿里云 | 64 | IDC名称 |
| location | char | 杭州 | 128 | IDC所在地 |
| telephone| char | 15802212145 | 128 | 项目名称 |
| comment  | text |  | | 备注 |

###### IDC修改、删除、详情：
* 链接：http://*serverip*/servermanage/idcmodify/
* 添加参数： 同上

#### 服务器管理
###### 服务器查询、添加：
* 链接：http://*serverip*/servermanage/servers/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| staff        | int  | 2 |  | 项目负责人，外键 |
| idc          | int  | 2 |  | 所在机房，外键 |
| name         | char | Tomcatserver | 64 | 服务器名称 |
| sn           | char |   | 32 | 服务器sn码 |
| cpu          | char | 4c | 64 | CPU大小 |
| mem          | int  | 8 |   | 内存大小 |
| disktype     | char | SSD |  64 | 磁盘类型 |
| diskcapacity | int  | 12 |   | 磁盘大小(G) |
| nic          | char | 1G | 64 | 网卡 |
| expiredate   | datetime  | 2018-07-01 09:00:00 |   | 租约到期时间 |
| privateip    | char  | 192.168.3.6 | 64 | 内外IP |
| publicip     | char  | 222.36.3.45 | 64 | 外网IP |
| comment      | text  |  | | 备注 |

###### 服务器修改、删除、详情：
* 链接：http://*serverip*/servermanage/servermodify/
* 添加参数： 同上

#### 服务管理
###### 服务查询、添加：
* 链接：http://*serverip*/servermanage/services/
* 添加参数： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| project  | int  | 2 |  | 项目，外键 |
| name     | char | Nginx | 64 | 服务名称 |
| tags     | char |   | 64 |  |
| comment  | text |  | | 备注 |

###### 服务修改、删除、详情：
* 链接：http://*serverip*/servermanage/servicemodify/
* 添加参数： 同上

## 操作日志模块
---
#### 操作日志查询：
* 链接：http://*serverip*/operaterecord/operaterecords/
* 表字段： 

| 字段名称 | 类型 | 示例 | 长度 | 描述 |
| :-------------- | :-------- | :-------- | :---------: | :--------- |
| staff   | int  | 2 |  | 操作人，外键 |
| userip    | char |  192.168.132.133 |  | 操作人机器IP |
| date    | datetime |  2018-07-01 09:00:00 |  | 操作时间 |
| secondmenu    | int |  3 |  | 操作模块，外键 |
| operate    | char |  modify |  | 修改操作，共有add、modify、delete三种操作 |
| olddata    | text |  |  | 操作前数据，json格式 |
| newdata    | text |  |  | 操作后数据，json格式 |
| comment | text |  | | 备注 |

* 此模块数据添加、删除、修改由后台独立完成，无需前端再写代码。


