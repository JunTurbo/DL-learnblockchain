import Vue from 'vue'
import Router from 'vue-router'
import Vault from '@/components/Vault'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Vault',
      component: Vault
    }
  ]
})
