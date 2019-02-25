<template>
	<div class="footers">
		<div v-for='(item,index) of items' :class='[item.cls,{on:index === idx}]' @click="$router.push(item.push)">
			<img :src="index===idx?item.iconSelect:item.icon">
			<p :class="['colorChange',{on:index===idx}]" >{{item.name}}</p>
		</div>
 
	</div>
</template>

<script>
 export default {
		props:['idx'],
		data(){
			return {
				items:[{
					cls:"home",
					name:"首页",
					icon:"http://127.0.0.1:3000/img/home.png",
          iconSelect:"http://127.0.0.1:3000/img/home-on.png"
          
				},
				{
					cls:"shares",
					name:"股票",
					icon:"http://127.0.0.1:3000/img/category.png",
					iconSelect:"http://127.0.0.1:3000/img/category-on.png"
				},
				{
					cla:"community",
					name:"社区",
					push:"/community",
					icon:"http://127.0.0.1:3000/img/cart.png",
					iconSelect:"http://127.0.0.1:3000/img/cart-on.png"
				},
				{
					cla:"mine",
					name:"我的",
					icon:"http://127.0.0.1:3000/img/user.png",
					iconSelect:"http://127.0.0.1:3000/img/user-on.png"
				}]
			}
		}
	} 
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>

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
</style>
