### ansible_api 使用示例
#### 1) 导入AnsibleRunner和Config
``` python
from ansible2.pbex_runner import AnsibleRunner as AR
from cmdb.config import Config
```
- `AnsibleRunner`, 用于来执行ansible任务
- `Config`, 用于获取ansible配置

#### 2) 创建ansible的配置实例
``` python
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ANSIBLE = Config(os.path.join(BASE_DIR, 'conf'), 'cmdb.ini').conf('ansible')
```

#### 3) 创建AnsibleRunner实例，传参和运行
``` python
runner = AnsibleRunner(connection=ANSIBLE["connection"],
                       forks=ANSIBLE["forks"],
                       become=ANSIBLE["become"],
                       become_method=ANSIBLE["become_method"],
                       become_user=ANSIBLE["become_user"],
                       remote_user=ANSIBLE["remote_user"],
                       private_key_file=ANSIBLE["private_key_file"])
# 指定hosts文件或传递json数据
runner.init_inventory(host_list='./hosts')
# 指定playbooks文件
runner.init_playbook(playbooks="./test.yml")
result = runner.run_it()
```
