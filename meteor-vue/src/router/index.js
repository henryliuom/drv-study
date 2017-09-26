import Vue from 'vue'
import Router from 'vue-router'
import index from '../components/index'
import Login from '../modules/login/Login.vue'
import Menus from '../modules/menumanage/Menus'
import secondmenus from '../modules/menumanage/secondmenus'
import staffs from '../modules/userpermission/staffs'
import operaterecords from '../modules/operaterecord/operaterecords'

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
    },
    {
      path: '/menumanage/secondmenus',
      name: 'secondmenus',
      component: secondmenus
    },
    {
      path: '/operaterecord/operaterecords',
      name: 'operaterecords',
      component: operaterecords
    },
    {
      path: '/userpermission/staffs',
      name: 'staffs',
      component: staffs
    }
  ]
})
