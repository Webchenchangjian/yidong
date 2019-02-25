<template>
 <div class="app-container">
  <!--顶部导航栏!-->
 	<div class="header">
		<input type="text" placeholder="请输入关键字">
		<span class="mui-icon mui-icon-search"></span>
	</div>
  <router-view></router-view>

    <!--定部导航栏!-->
		<!--
		<div class="footers">
		<div v-for='(item,index) of items' :class='[item.cls,{on:index === idx}]' @click="$router.push(item.push)">
			<img :src="index===idx?item.iconSelect:item.icon">
			<p :class="['colorChange',{on:index===idx}]" >{{item.name}}</p>
		</div>
	</div> !-->
	
		<nav class="mui-bar mui-bar-tab">
			<router-link to="/Home" class="mui-tab-item mui-active" href="#tabbar">
				<span class="mui-icon mui-icon-extra"><img class="img" src="./img/home-on.png" alt=""></span> 
        <span class="mui-tab-label">首页</span>
			</router-link>
			<router-link to="/classify" class="mui-tab-item" href="#tabbar-with-map">
				<span class="mui-icon mui-icon-extra"><img class="img" src="./img/category.png" alt=""></span> 
        <span class="mui-tab-label">分类</span>
        </router-link>
			<router-link to="/shoplist" class="mui-tab-item" href="#tabbar-with-map">
				<span class="mui-icon mui-icon-extra"><img class="img" src="./img/cart.png" alt=""></span>
				<span class="mui-badge">{{$store.getters.optCartCount}}</span>
        <span class="mui-tab-label">购物车</span>
			</router-link>
			<router-link to="/login" class="mui-tab-item" href="#tabbar-with-map">
				<span class="mui-icon mui-icon-extra"><img class="img" src="./img/user.png" alt=""></span> 
        <span class="mui-tab-label">我的</span>
			</router-link>
		</nav>
		 <!--返回顶部!-->
		<a id="toTop" href="#"></a>
 </div>
</template>
 <script>
 window.onscroll=function(){
      var scrollTop=document.body.scrollTop||document.documentElement.scrollTop
       //console.log(scrollTop);
      if(scrollTop>=1200)
      toTop.style.display="block";
      else
      toTop.style.display="none";
      }
			export default {

  data(){
    return{
    }
  },
	 methods:{
	 }
}
// 	export default {
// 		props:['idx'],
// 		data(){
// 			return {
// 				items:[{
// 					cls:"Home",
// 					name:"首页",
// 					push:"/Home",
// 					icon:"http://127.0.0.1:3000/img/home.png",
//           iconSelect:"http://127.0.0.1:3000/img/home-on.png"
          
// 				},
// 				{
// 					cls:"classify",
// 					name:"股票",
// 					push:"/classify",
// 					icon:"http://127.0.0.1:3000/img/category.png",
// 					iconSelect:"http://127.0.0.1:3000/img/category-on.png"
// 				},
// 				{
// 					cla:"shoplist",
// 					name:"社区",
// 					push:"/shoplist",
// 					icon:"http://127.0.0.1:3000/img/cart.png",
// 					iconSelect:"http://127.0.0.1:3000/img/cart-on.png"
// 				},
// 				{
// 					cla:"login",
// 					name:"我的",
//           push:'/login',
// 					icon:"http://127.0.0.1:3000/img/user.png",
// 					iconSelect:"http://127.0.0.1:3000/img/user-on.png"
// 				}]
// 			}
// 		}
// 	} 
	
 </script>
<style>
#toTop{
  width: 50px;
  height: 50px;
  background-image: url("./img/gototop.png");
  background-repeat:no-repeat;
  background-size: 30px;
  background-position: 10px 10px;
  opacity: .9;
  position:fixed;
  bottom:75px;
  right:15px;
  display:none;
    }

.app-container{
	overflow-x:hidden;
}
/*顶部搜索*/
.header{
  width:100%;
  height:40px;
  background:red;
  text-align:center;
}
.header input[type='text']{
  width:351px;
	height:30px;
  margin-top:5px;
  background:white;
}
    /**底部 */
#footer{
	background-color:#eee;
	border-top:1px dashed red;
	text-align:center;
}
#footer p{
	margin:0;
	font-size:12px;
}
/** 
.footers{
	display: flex;
	position: absolute;
	left: 0;
	bottom: 0;
	box-sizing: border-box;
	height: 6rem;
	background: #909090;
	width: 100%;}
	.footers div{
		flex: 1;
		font-size: 30px;
	}
	.footers div img{
		width: 30px;
		height: 30px;
	}
	.footers div p{
		color:black;
	}
	.on{
		color: red;
  }
	*/
/**底部样式 */
.yin{
  width:100%;
  height:57px;
  background:#ccc;
}
.img{
  width:30px;
  height:30px;
}
</style>
