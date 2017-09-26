<template>
    <section id="main" class="" role="main">
        <bodyheader></bodyheader>
        <sidebar></sidebar>
        <!--<label id="test">{{ menus[0] }}</label>-->
    <section id="main" class="label info-box" role="main">
        <section id="content" class="container">
        <info></info>
        <warn></warn>
            <!-- Breadcrumb -->
                <ol class="breadcrumb hidden-xs">
                    <li><a>主页</a></li>
                    <li><a>用户权限管理</a></li>
                    <li class="active">用户管理</li>
                </ol>
                <h4 class="page-title" align="left">用户管理</h4>
            <div class="block-area" id="defaultStyle">
                <div class="row">
                    <div class="col-md-6">
                        <div class="tile">
                            <!--<h2 class="tile-title">所有用户</h2>-->
                            <table class="table tile" id="tid">
                                <thead>
                                <tr>
                                    <th style="text-align:center;">序号</th>
                                    <th style="text-align:center;">用户名</th>
                                    <th style="text-align:center;">用户组</th>
                                    <th style="text-align:center;">性别</th>
                                    <th style="text-align:center;">电话</th>
                                    <th style="text-align:center;">备注</th>
                                    <th style="text-align:center;">管理</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(row,index) in menus[0]">
                                    <td align="center">{{ index+1 }}</td>
                                    <td align="left">{{ row.name }}</td>
                                    <td align="left">{{ row.group.name }}</td>
                                    <td align="left">{{ row.sex }}</td>
                                    <td align="left">{{ row.telno }}</td>
                                    <td align="left">{{ row.comment }}</td>
                                    <td align="center">
                                        <button type="button" class="btn btn-sm btn-alt" @click="modifyfun(row.id,row.name,row.group.id,row.sex,row.telno,row.comment)">修改</button>
                                        <button type="button" class="btn btn-sm btn-alt" @click="delfun(row.id,index)">删除</button>
                                    </td>
                                    <td align="left" style="display: none">{{ row.id }}</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-alt" @click="newfun()">新增</button>
                                <popdialog :show="show" @modifydata="modifydata">
                                    <form class="form-inline" role="form"><div class="form-group"><br><br><input style="display: none" id="mid">
                                        <lable class="label" style="text-align: right">用户组：</lable>
                                        <select class="form-control" style="width: 175px" id="groupid">
                                            <option v-for="(row,index) in groups[0]" :value="row.id" :selected="row.id==groupid ? 'selected':''">{{row.name}}</option>
                                        </select><br><br>
                                        <lable class="label" style="text-align: right">用户名：</lable><input class="form-control" id="username"><br><br>
                                        <lable class="label" style="text-align: right">性别：</lable><input class="form-control" id="sex"><br><br>
                                        <lable class="label" style="text-align: right">电话：</lable><input class="form-control" id="telno"><br><br>
                                        <lable class="label" style="text-align: right">备注：</lable><input class="form-control" id="comment">
                                    </div></form><br><br>
                                    <button type="button" class="btn btn-sm btn-alt" @click="savefun()">保存</button>
                                    <button type="button" class="btn btn-sm btn-alt" @click="concelfun()">取消</button>
                                </popdialog>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
    </section>
</template>

<script>
  import sidebar from '../../components/sidebar.vue'
  import bodyheader from '../../components/bodyheader.vue'
  import info from '../../components/info.vue'
  import warn from '../../components/warn.vue'
  import axios from 'axios'
  import router from '../../router'
  import config from "../../assets/config"
  import popdialog from '../../components/dialog.vue'

  function menusfun (){
      let list = [];
      let url = config.baseurl+'/userpermission/staffs/';
      new Promise(function (resolve, reject) {
          axios.get(url,{
          headers: {
                "Content-Type":"application/json;charset=utf-8"
              },
          responseType:'json',
          withCredentials : true
      }).then(function(response){
              if (response.status==200) {
                  if ('permission required'==response.data){alert(response.data)}
                  else if('login required'==response.data){alert(response.data);router.push('/login')}
                  else {list.push(response.data);}
//                  resolve(response.data);
              }
              else {alert(response.status)}
      }).catch(function(error){console.log(error);router.push('/login')});
      });
      return list;
  }
  function groupsfun (){
      let list = [];
      let url = config.baseurl+'/userpermission/groups/';
      new Promise(function (resolve, reject) {
          axios.get(url,{
          headers: {
                "Content-Type":"application/json;charset=utf-8"
              },
          responseType:'json',
          withCredentials : true
      }).then(function(response){
              if (response.status==200) {
                  if ('permission required'==response.data){alert(response.data)}
                  else if('login required'==response.data){alert(response.data);router.push('/login')}
                  else {list.push(response.data);}
//                  resolve(response.data);
              }
              else {alert(response.status)}
      }).catch(function(error){console.log(error);router.push('/login')});
      });
      return list;
  }

  export default {
    components: {
      sidebar, bodyheader, info, warn, popdialog
    },
    data () {
      return {
          menus: '',
          groups: '',
          groupid: '',
          show: false
      }
    },
    created () {
        this.menus = menusfun();
    },
    methods:{
        modifydata (show){this.show=show},
        concelfun: function (){
            this.show=false
        },
        savefun: function (){
            var mid = document.getElementById('mid').value;
            if (mid!=''){var url = config.baseurl+'/userpermission/staffmodify/'+mid;var methods='PUT'}
            else {var url = config.baseurl+'/userpermission/staffs/';var methods='post'}
            let groupid = $("#groupid").find("option:selected").val();
            let username = document.getElementById('username').value;
            let sex = document.getElementById('sex').value;
            let telno = document.getElementById('telno').value;
            let comment = document.getElementById('comment').value;
            let self = this;
//      console.log({"name": menuname, "iconclass": classname, "comment": comment});
      new Promise(function (resolve, reject) {
          axios({method:methods,url:url,
          data:{
              'group': groupid,
              'name': username,
              'sex': sex,
              'telno': telno,
              'comment': comment
          },
          headers: {
                'X-Requested-With':'XMLHttpRequest',"Content-Type":"application/json;charset=utf-8"
              },
          responseType:'json',
          withCredentials : true
      }).then(function(response){
              if (response.status==201) {
                  if ('permission required'==response.data){alert(response.data)}
                  else if('login required'==response.data){alert(response.data);router.push('/login')}
                  else {
                      alert('保存成功');
                      self.show=false;
                      if (mid=='') {
                          let tble = document.getElementById("tid");
                          let inserttr = tble.insertRow(tble.rows.length);
                          let inserttd = inserttr.insertCell(0);
                          inserttd.style.textAlign = "center";
                          inserttd.innerHTML = tble.rows.length - 1;
                          inserttd = inserttr.insertCell(1);
                          inserttd.style.textAlign = "left";
                          inserttd.innerHTML = username;
                          inserttd = inserttr.insertCell(2);
                          inserttd.style.textAlign = "left";
                          inserttd.innerHTML = $("#groupid").find("option:selected").text();
                          inserttd = inserttr.insertCell(3);
                          inserttd.style.textAlign = "left";
                          inserttd.innerHTML = sex;
                          inserttd = inserttr.insertCell(4);
                          inserttd.style.textAlign = "left";
                          inserttd.innerHTML = telno;
                          inserttd = inserttr.insertCell(5);
                          inserttd.style.textAlign = "left";
                          inserttd.innerHTML = comment;
                          inserttd = inserttr.insertCell(6);
                          inserttd.style.textAlign = "center";
                          inserttd.innerHTML = '';
                      }
                  }
//                  resolve(response.data);
              }
              else if(response.status==200){
                  if ('permission required'==response.data){alert(response.data)}
                  else if('login required'==response.data){alert(response.data);router.push('/login')}
                  else {
                      alert('保存修改成功');
                      self.show=false;
                      let tble = document.getElementById("tid");
                      for (let i = 0; i < tble.rows.length; i++) {
                          let j = tble.rows[i+1].cells[7].innerHTML;
                          if (j == mid) {
                              tble.rows[i+1].cells[1].innerHTML = username;
                              tble.rows[i+1].cells[2].innerHTML = $("#groupid").find("option:selected").text();
                              tble.rows[i+1].cells[3].innerHTML = sex;
                              tble.rows[i+1].cells[4].innerHTML = telno;
                              tble.rows[i+1].cells[5].innerHTML = comment;
                              tble.rows[i+1].cells[6].innerHTML = '';
                              break
                          }
                      }
                  }
              }
              else {alert(response.status)}
      }).catch(function(error){alert(error)});
      });
  },
        modifyfun: function (id,username,groupid,sex,telno,comment){
            this.show = true;
            this.groups = groupsfun();
            this.groupid = groupid;
            document.getElementById('username').value=username;
            document.getElementById('sex').value=sex;
            document.getElementById('telno').value=telno;
            document.getElementById('comment').value=comment;
            document.getElementById('mid').value=id;
        },
        newfun: function (){
            this.show = true;
            this.groups = groupsfun();
            document.getElementById('mid').value='';
        },
        delfun: function (id,index){
            if (confirm("确定删除？")) {
                let url = config.baseurl + '/userpermission/staffmodify/'+id;
                let self = this;
                new Promise(function (resolve, reject) {
                    axios({
                        method: 'DELETE', url: url,
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest', "Content-Type": "application/json;charset=utf-8"
                        },
                        responseType: 'json',
                        withCredentials: true
                    }).then(function (response) {
                        if (response.status == 204) {
                            if ('permission required' == response.data) {
                                alert(response.data)
                            }
                            else if ('login required' == response.data) {
                                alert(response.data);
                                router.push('/login')
                            }
                            else {
                                alert('删除成功');
                                let tble = document.getElementById("tid");
                                for(let i=0;i<tble.rows.length;i++){
                                    let j=tble.rows[i].cells[0].innerHTML;
                                    if (j==index+1){document.getElementById('tid').deleteRow(i);break}
                                }
                            }
//                            resolve(response.data);
                        }
                        else {
                            alert(response.status)
                        }
                    }).catch(function (error) {
                        console.log(error);
                        alert(error)
                    });
                });
            }
        }
    }
  }
</script>
