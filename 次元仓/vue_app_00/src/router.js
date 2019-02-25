import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
import testContainer from "./components/testContainer.vue"
import Home from "./components/tabbar/Home.vue"
import GoodsList from './components/goods/GoodsList.vue'
import GoodsInfo from './components/goods/GoodsInfo'
 import Login from './components/tabbar/Login'
import Register from './components/tabbar/Register'
import ShopList from './components/tabbar/ShopList'
import Logout from './components/tabbar/Logout'
import Classify from './components/tabbar/Classify'
Vue.use(Router)
export default new Router({
  routes: [
    {path:'/hello',component:HelloContainer},
    {path:'/',redirect:"/Home"},
    {path:'/test',component:testContainer},
    {path:'/Home',component:Home},
    {path:'/GoodsList',component:GoodsList},
    {path:'/GoodsInfo/:lid',component:GoodsInfo},
     {path:'/login',component:Login},
    {path:'/register',component:Register},
    {path:'/shoplist',component:ShopList},
    {path:'/logout',component:Logout},
    {path:'/classify',component:Classify}
    

  ]
})
