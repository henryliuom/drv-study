<template xmlns="http://www.w3.org/1999/html">
    <section>
        <div></br></br></br></br></br></br></div>
        <div class="btn btn-sm" style="width: 30%;"></br></br>
        <h1 class="label" style="font-size: 25px;color: #c9dd22">用户登入</h1></br></br></br></br>
        <div align="center">
        <div align="center" style="width: 200px;height: 60px">
            <h3 class="label" style="font-size: 15px;float: left">用户名：</h3><input id="user" value="" type="text" class="form-control input-sm m-b-10" style="width: 120px; float: none">
        </div>
        <div align="center" style="width: 200px">
            <h3 class="label" style="font-size: 15px;float: left">密 &nbsp;&nbsp;&nbsp;码：</h3><input id="password" value="" type="password" class="form-control input-sm m-b-10" style="width: 120px">
        </div>
        </div>
            </br>
            <button type="button" class="btn btn-sm btn-alt" @click="btnfun()">登入</button></br></br>
            </div>
    </section>
</template>

<script>
    import axios from 'axios'
    import router from '../../router'

  export default {
    name: 'login',
    data () {
      return {
      }
    },
    methods: {
      btnfun (){
          let user=document.getElementById('user').value;
          let password=document.getElementById('password').value;
          user = $.trim(user);
          password = $.trim(password);
          let self=this;
          if (user!='' && password!='') {
              axios({method:'post',url:'http://172.16.33.140/login/',
//                  data:'name='+user+'&password='+password,
                  data:{"name": user, "password": password},
                  headers: {'X-Requested-With':'XMLHttpRequest',"Content-Type":"application/x-www-form-urlencoded;charset=utf-8"},
                  responseType:'json',
                  withCredentials : true,
                  timeout: 1000
               }).then(function(response){if(response.status==200) {
                  try{
                  if (response.data.indexOf('error') >= 0){
                      alert(response.data);
                      router.push('/login')
                  }}
                  catch (err){
                      console.log(response.data);
                      self.$emit('userSignIn', user);
                      router.push('/')
                  }
              }
               }).catch(function(error){console.log(error);router.push('/login')});
          }
          else {
              alert("请输入用户名或密码")
          }
      }
    }
  }
</script>

