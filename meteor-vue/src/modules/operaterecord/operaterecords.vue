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
                    <li><a>操作记录</a></li>
                    <li class="active">操作记录查询</li>
                </ol>
                <h4 class="page-title" align="left">操作记录查询</h4>
            <div class="block-area" id="defaultStyle">
                <div class="row">
                    <div class="col-md-6">
                        <div class="tile">
                            <!--<h2 class="tile-title">所有用户</h2>-->
                            <table class="table tile">
                                <thead>
                                <tr>
                                    <th style="text-align:center;">序号</th>
                                    <th style="text-align:center;">操作人</th>
                                    <th style="text-align:center;">from ip</th>
                                    <th style="text-align:center;">操作时间</th>
                                    <th style="text-align:center;">操作模块</th>
                                    <th style="text-align:center;">操作</th>
                                    <th style="text-align:center;">操作前数据</th>
                                    <th style="text-align:center;">操作后数据</th>
                                    <th style="text-align:center;">备注</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="(row,index) in operaterecords[0]">
                                    <td align="center">{{ index+1 }}</td>
                                    <td align="left" v-if="row.staff">{{ row.staff.name }}</td>
                                    <td align="left" v-if="!row.staff"></td>
                                    <td align="left">{{ row.userip }}</td>
                                    <td align="left">{{ row.date }}</td>
                                    <td align="left" v-if="row.secondmenu">{{ row.secondmenu.name }}</td>
                                    <td align="left" v-if="!row.secondmenu"></td>
                                    <td align="left">{{ row.operate }}</td>
                                    <td align="left" style="width: 20px;text-overflow: ellipsis">{{ row.olddata }}</td>
                                    <td align="left" style="width: 20px;text-overflow: ellipsis">{{ row.newdata }}</td>
                                    <td align="left">{{ row.comment }}</td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="btn-group">
                                <pagination :page-no="operaterecords[1]" :current="current" @getrecords="getrecords"></pagination>
                                <!--{{operaterecords[1]}}-->
                                <!--<button type="button" class="btn btn-sm btn-alt">新增</button>-->
                                <!--<button type="button" class="btn btn-sm btn-alt">修改</button>-->
                                <!--<button type="button" class="btn btn-sm btn-alt">删除</button>-->
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
  import pagination from '../../components/pages.vue'
  import bodyheader from '../../components/bodyheader.vue'
  import info from '../../components/info.vue'
  import warn from '../../components/warn.vue'
  import axios from 'axios'
  import router from '../../router'
  import config from "../../assets/config"

  function menusfun (page,limit){
      let list = [];
      let url = config.baseurl+'/operaterecord/operaterecords/?page='+page+'&limit='+limit;
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
                  else {list.push(response.data.datas);list.push(response.data.pages)}
//                  resolve(response.data);
              }
              else {alert(response.status)}
      }).catch(function(error){console.log(error);router.push('/login')});
      });
      return list;
  }
  export default {
    components: {
      sidebar, bodyheader, info, warn, pagination
    },
    data () {
      return {
          operaterecords: '',
          current: 1
      }
    },
    watch: {
//        current: function () {alert(this.current);this.operaterecords = menusfun(this.current)}
    },
    created () {
        this.operaterecords = menusfun(this.current,15);
    },
    methods:{
        getrecords(current){this.current=current;this.operaterecords = menusfun(current,15);}
    }
  }
</script>
