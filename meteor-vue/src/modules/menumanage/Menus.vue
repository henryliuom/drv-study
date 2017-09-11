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
                    <li><a href="#">主页</a></li>
                    <li><a href="#">菜单管理</a></li>
                    <li class="active">父菜单管理</li>
                </ol>
                <h4 class="page-title" align="left">父菜单管理</h4>
            <div class="block-area" id="defaultStyle">
                <div class="row">
                    <div class="col-md-6">
                        <div class="tile">
                            <!--<h2 class="tile-title">所有用户</h2>-->
                            <table class="table tile">
                                <thead>
                                <tr>
                                    <th style="text-align:center;">序号</th>
                                    <th style="text-align:center;">菜单名称</th>
                                    <th style="text-align:center;">备注</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(row,index) in menus[0]">
                                    <td align="center">{{ index+1 }}</td>
                                    <td align="left">{{ row.name }}</td>
                                    <td align="left">{{ row.comment }}</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-alt">新增</button>
                                <button type="button" class="btn btn-sm btn-alt">修改</button>
                                <button type="button" class="btn btn-sm btn-alt">删除</button>
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

  function menusfun (){
      let list = [];
      let url = config.baseurl+'/menumanage/menus/';
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
      sidebar, bodyheader, info, warn
    },
    data () {
      return {
          menus: ''
      }
    },
    created () {
        this.menus = menusfun();
    }
  }
</script>
