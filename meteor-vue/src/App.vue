<template>
  <div id="app">
    <router-view @userSignIn="userSignIn"></router-view>
  </div>
</template>

<script>
export default {
  name: 'app',
  data(){
    return{
      userName: sessionStorage.userName
    }
  },

  methods:{
    //用户登入
    userSignIn(userName){
      sessionStorage.userName = userName;
      this.userName = sessionStorage.userName;
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  /*margin-top: 10px;*/
}
</style>
