<template>
  <div class="app-home">
     <!--第一个：顶部导航条 学子商城-->
     <!--第二个：轮播图-->
     <div class="c_act">
      <mt-swipe :auto="2500">
          <mt-swipe-item v-for="item in list" :key="item.id">
              <img :src="item.img_url" />
          </mt-swipe-item>
      </mt-swipe>
     </div>
     <!--第三个：九宫格-->
     <ul class="mui-table-view mui-grid-view mui-grid-10">
    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
      <router-link to="/Newslist">
        <img src="../../img/1496715043118.png" alt="">
        <div class="mui-media-txt">图书仓</div>
      </router-link>
    </li>
    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
      <router-link to="/GoodsList">
        <img src="../../img/1496715069193.png" alt="">
        <div class="mui-media-txt">汉风仓</div>
      </router-link>
    </li>
    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
      <router-link to="#">
        <img src="../../img/1496715102386.png" alt="">
        <div class="mui-media-txt">手办仓</div>
      </router-link>
    </li>
    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
      <router-link to="#">
        <img src="../../img/1496715116612.png" alt="">
        <div class="mui-media-txt">首饰仓</div>
      </router-link>
    </li>
    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
      <router-link to="#">
        <img src="../../img/1496715143797.png" alt="">
        <div class="mui-media-txt">零食仓</div>
      </router-link>
    </li>
    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
      <router-link to="#">
        <img src="../../img/1496715130000.png" alt="">
        <div class="mui-media-txt">文具仓</div>
      </router-link>
    </li>
    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
      <router-link to="#">
        <img src="../../img/1496715204057.png" alt="">
        <div class="mui-media-txt">古风仓</div>
      </router-link>
    </li>
    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
      <router-link to="#">
        <img src="../../img/1496715216702.png" alt="">
        <div class="mui-media-txt">装扮仓</div>
      </router-link>
    </li>
    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
      <router-link to="#">
        <img src="../../img/1496715056777.png" alt="">
        <div class="mui-media-txt">周边仓</div>
      </router-link>
    </li>
    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
      <router-link to="#">
        <img src="../../img/1496715188996.png" alt="">
        <div class="mui-media-txt">服饰仓</div>
      </router-link>
    </li>
  </ul>
  <!--中间年华大赏!-->
  <img class="c_head" src="../../img/1547779714544.jpg" alt="">
  <!--层叠式轮播!-->
  <div class="c_art">
  <mt-swipe :auto="2500">
    <mt-swipe-item v-for="item in list2" :key="item.id">
    <div class="c_cart">
      <img :src="item.img_url"/>
    </div>
    </mt-swipe-item>
  </mt-swipe>
  </div>
  
  <!--闪购!-->
  <div class="sale">
    <span class="title">闪购-距 <span>结束</span>
      <span class="time">09天12:55:14</span>
    </span>
    <span class="more">查看全部</span>
    <!--图片!-->
    <div class="swipe-wrap" id="slip">
      <article class="swipe">
        <ul class="c_swipe_ul">
          <li class="c_swipe_li" v-for="item in list3.slice(0,7)">
            <a href="">
              <div class="swipe-box">
                <img v-lazy="item.img_url" alt="">
              </div>
              <p class="c_price">￥{{item.price}}</p>
              <p class="c_org_price">
                <del>￥{{item.price}}</del>
              </p>
            </a>
          </li>
        </ul>
      </article>
    </div>
  </div>
<!--新品推荐!-->
<div class="sale_c">
    <span class="title_c">新品推荐
    </span>
    <span class="more">查看更多</span>

    <!--图片!-->
<div class="app-goodslist">
     <!--商品列表项 start-->
      <div class="goods-item" v-for="item in list3.slice(7,16)">
       <img v-lazy="item.img_url"/>
       <p class="title">{{item.title}}</p>
       <div class="info">
         <div class="price">
            <span class="now">￥{{item.price}}</span>
         </div>
       </div>
      </div>
     <!--商品列表项 end-->
  </div>
  </div>


  <!--商品列表!-->
  <div class="sale_a">
    <span class="title_a">新品推荐
    </span>
    <span class="more">查看更多</span>
    <div class="app-goodslist">
     <!--商品列表项 start-->
      <div class="goods-item_c" v-for="item in list3.slice(16,75)">
       <img v-lazy="item.img_url"/>
       <p class="title">{{item.title}}</p>
       <div class="info">
         <div class="price">
            <span class="now">￥{{item.price}}</span>
         </div>
       </div>
      </div>
     <!--商品列表项 end-->
  </div>
  </div>
  <!--底部!-->
  <div class="footer" id="footer">
    <p>Copyright © 2017 m.cycang.com All Rights Reserved</p>
  </div>
     <!--底部导航栏tabbar-->
  <div class="yin"></div>
  <nav class="mui-bar mui-bar-tab">
			<a class="mui-tab-item mui-active" href="#tabbar">
				<span class="mui-icon mui-icon-extra"><img class="img" src="../../img/home-on.png" alt=""></span> 
        <span class="mui-tab-label">首页</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-map">
				<span class="mui-icon mui-icon-extra"><img class="img" src="../../img/category.png" alt=""></span> 
        <span class="mui-tab-label">分类</span>
        </a>
			<a class="mui-tab-item" href="#tabbar-with-map">
				<span class="mui-icon mui-icon-extra"><img class="img" src="../../img/cart.png" alt=""></span> 
        <span class="mui-tab-label">购物车</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-map">
				<span class="mui-icon mui-icon-extra"><img class="img" src="../../img/user.png" alt=""></span> 
        <span class="mui-tab-label">我的</span>
			</a>
		</nav>
  </div>  
</template>
<script>
 export default {
   created() {
     this.getImages();
     this.getGoodsList();
   },
   methods:{
     getImages(){
       console.log(123);
       var url="http://127.0.0.1:3000/getImages";
       this.axios.get(url).then(result=>{
         this.list=result.data;
       })
     },
     getGoodsList(){
       console.log(11);
       var url="http://127.0.0.1:3000/getGoodsList";
       this.axios.get(url).then(result=>{
         this.list3=result.data.data;
       })
     }
   },
   data(){
     return {
       list:[],
         list2:[
           {id:1,img_url:"http://127.0.0.1:3000/img/1545899481927.png"},
           {id:2,img_url:"http://127.0.0.1:3000/img/1547796982419.png"}
         ],
         list3:[]
     }
   }
 }
</script>
<style>
/*顶部搜索*/
.app-home .header{
  width:100%;
  height:20rem;
  background:red;
  text-align:center;
}
.app-home .header input{
  width:350px;
  height:30px;
  margin-top:5px;
  background:white;
}
/**轮播图样式 */
.app-home .mint-swipe{
  height:120px;
}
.app-home .mint-swipe img{
  width:100%;
  height:120px;
}
/**九宫格样式 */
.app-home .mui-grid-view.mui-grid-9{
  width:375px;
  height:160px;
  background-color:#fff;
  display:flex;
  flex-wrap:nowrap;
}
  .app-home .mui-grid-view .mui-grid-9 li{
  border:0;
}
.app-home .mui-table-view-cell{
  width:20%;
  height:70px;
}
.mui-media-txt{
  font-size:8px;
  padding-bottom:5px;
}
.app-home ul li img{
  width:40px;
  height:40px;
}
/**中间图片样式 */
.app-home .c_head{
  width:100%;
}
/**中间层叠式轮播 */
.app-home .c_art{
  width:100%;
  height:135px;
  background:#f6f6f6;
}
.app-home .c_cart img{
  margin:10px 0;
  width:100%;
  height:120px;
}
/**闪购样式 */
.app-home .sale{
  width:100%;
  height:186px;
  border:1px solid red;
  overflow: hidden;
  font-size: 14px;
  padding: 12px 18px 8px;
  font-weight: 400;
  color: #3f3f3f;
}
.sale .title{
  background-image:url("../../img/new-goods.png");
  background-repeat:no-repeat;
  padding-left: 18px;
  font-weight: 700;
  color: #3c3c3c;
  background-size: 16px;
}
.sale .more{
  float:right;
  padding-right:16px;
  background-image:url("../../img/next.png");
  background-repeat:no-repeat;
  background-position:100%;
  background-size: 13%;
}
/**闪购图片 */
#slip{
  width:100%;
  height:140px;
  border:1px solid #f0f;
}
#slip .c_swipe_ul{
  padding-inline-start: 0px;
  padding-bottom: 12px;
  white-space: nowrap;
  overflow-x: auto;
}
#slip .c_swipe_li{
  display: inline-block;
  width: 100px;
  padding: 5px;
}
#slip .c_swipe_li {
  margin:0;
}
#slip .swipe img{
  width:100%;
  height:100%;
}
/**新品推荐 */
/**新品推荐样式 */
.app-home .sale_c{
  width:100%;
  height:100%;
  font-size: 14px;
  padding: 12px 18px 8px;
  font-weight: 400;
  color: #3f3f3f;
}
.sale_c .title_c{
  background-image:url("../../img/new-goods.png");
  background-repeat:no-repeat;
  padding-left: 18px;
  font-weight: 700;
  color: #3c3c3c;
  background-size: 16px;
}
.sale_c .more{
  float:right;
  padding-right:16px;
  background-image:url("../../img/next.png");
  background-repeat:no-repeat;
  background-position:100%;
  background-size: 13%;
}
/**图片 */
.app-goodslist{
      display:flex;   /*最外层父元素弹性布局*/
      flex-wrap:wrap; /*子元素换行*/
      justify-content:space-between;/*两端对齐*/
    }
    /*商品项目*/ 
    .app-goodslist .goods-item{
       width:32%;     /*宽度*/
       margin:0;
       padding:2px;
       display:flex;         /*弹性布局*/
       flex-direction:column;/*排列方式:垂直*/
       min-height:180px;
       justify-content:space-between;/*子元素两端对齐*/   
    }
    .app-goodslist .goods-item p{
      margin:0;
      height:40px;
      overflow:hidden;
      font-size:15px;
      color:#000;
    }
    .app-goodslist .goods-item img{
     width:100%;
     height:110px;
    }
    .app-goodslist .goods-item .price{
      text-align:center;
    }
    .app-goodslist .goods-item .now{
     color:red;
     font-weight:bold;
     font-size:16px;
    }
    /**新品推荐顶部样式 */
  .app-home .sale_a{
    background:#eee;
  width:100%;
  height:100%;
  font-size: 14px;
  padding: 12px 18px 8px;
  font-weight: 400;
  color: #3f3f3f;
}
.sale_a .title_a{
  background-image:url("../../img/new-goods.png");
  background-repeat:no-repeat;
  padding-left: 18px;
  font-weight: 700;
  color: #3c3c3c;
  background-size: 16px;
}
.sale_a .more{
  float:right;
  padding-right:16px;
  background-image:url("../../img/next.png");
  background-repeat:no-repeat;
  background-position:100%;
  background-size: 13%;
}
    /**新品推荐图片 */
    .app-goodslist .goods-item_c{
       width:49%;     /*宽度*/
       margin:4px 0;
       padding:2px;
       border:1px solid #ccc;
       display:flex;         /*弹性布局*/
       flex-direction:column;/*排列方式:垂直*/
       min-height:180px;
       justify-content:space-between;/*子元素两端对齐*/
       background:white;   
    }
    .app-goodslist .goods-item_c p{
      margin:0;
      height:40px;
      overflow:hidden;
      font-size:15px;
      color:#000;
    }
    .app-goodslist .goods-item_c img{
     width:100%;
     height:173px;
    }
    .app-goodslist .goods-item_c .price{
      text-align:center;
    }
    .app-goodslist .goods-item_c .now{
      float:left;
     color:red;
     font-weight:bold;
     font-size:16px;
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
/**底部样式 */
.app-home .yin{
  width:100%;
  height:57px;
  background:#ccc;
}
.app-home .img{
  width:30px;
  height:30px;
}
</style>