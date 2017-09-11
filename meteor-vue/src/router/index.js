import Vue from 'vue'
import Router from 'vue-router'
import index from '../components/index'
import Login from '../modules/login/Login.vue'
import Menus from '../modules/menumanage/Menus'

Vue.use(Router);

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'index',
      component: index
    },
    {
      path: '/login/',
      name: 'login',
      component: Login
    },
    {
      path: '/menumanage/menus',
      name: 'menus',
      component: Menus
    }
  ]
})
