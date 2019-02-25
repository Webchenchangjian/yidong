<template>
  <div class="app-goodslist_1">
    <!--商品店铺!-->
     <ul class="tabs">
      <li class="red_1">
        <a href="javascript:;" @click="tab_1()">商品</a>
      </li>
      <li class="red_2">
        <a href="javascript:;" @click="tab_2()">店铺</a>
      </li>
     </ul>
     <div class="tabr" ref="cad_2">
      <div class="shop_tabs">
        <p>该关键字下没有相关店铺</p>
        <p>请试试其他关键字呦</p>
        <img src="../../img/list_empty.png" alt="">
      </div>
     </div>
     <!--排序!-->
     <div class="cad" ref="cad_1">
			<div class="mui-card">
				<ul class="mui-gao">
					<li>
          <a href="#" @click="xian()">综合排序</a>
          <span class="c_ico"></span>
					</li>
					<li><a href="#" @click="acd">价格</a>
					</li>
					<li><a href="#">筛选</a>
					</li>
				</ul>
			</div>
      <!--隐藏的排序!-->
      <div ref="yin" class="yin_1">
        <div class="yin_2">
          <p><a class="gao" href="">综合排序</a>
          </p>
          <p><a class="gao" href="">新品推荐</a></p>
        </div>
        <div class="bg" @click="bg()">
        </div>
      </div>
      <!--商品列表项 start-->
    <div ref="goods" class="goods-item_b" v-for="item in list">
        <img v-lazy="item.img_url" @click="jumpDetail" :data-id="item.id"/>
        <p class="title">{{item.title}}</p>
        <div class="info">
          <div class="price">
            <span class="now">￥{{item.price}}</span>
          </div>
        </div>
    </div>
    </div>
     <!--商品列表项 end-->
  </div>  
</template>

 <script>
   export default {
    data(){
      return {
        list:[]
      }
    },
    created() {
      this.getMore();
    },
    methods:{
      jumpDetail(event){
         //获取参数
         var lid =event.target.dataset.id;
         console.log(lid);
         //跳转商品详情 
         this.$router.push("/GoodsInfo/"+lid);
       },
       acd(){
         var url="http://127.0.0.1:3000/priceRanking";
         this.axios.get(url).then(result=>{
           this.list = result.data.data;
         });
       },
      xian(){
        this.$refs.yin.style.display="block"
      },
      bg(){
        this.$refs.yin.style.display="none"
      },
      tab_1(){
        this.$refs.cad_1.style.display=""
        this.$refs.cad_2.style.display="none"
      },
      tab_2(){
        this.$refs.cad_1.style.display="none"
        this.$refs.cad_2.style.display="block"
      },
      getMore(){
        //1:创建url地址   50
        var url = "http://127.0.0.1:3000/getList";
        //2:发送ajax请求
        this.axios.get(url).then(result=>{
          //3:获取返回数据保存 list
          this.list = result.data.data;
          console.log(this.list);
        })
          //4:在模板循环创建数据
      }
    }
  } 
</script>
<style>
.app-goodslist_1{
  background:white;
}
.app-goodslist_1 .cad{
  width:100%;
  display:flex;   /*最外层父元素弹性布局*/
  justify-content:space-between;
  flex-wrap:wrap; /*子元素换行*/
  margin-bottom: 50px
}
/**商品店铺样式 */
.app-goodslist_1 ul{
  position:relative;
  padding:0;
  margin:0;
  list-style:none;
  width:100%;
  display:flex;
  text-align:center;
}
.app-goodslist_1 ul li{
  width:50%;
  height:30px;
  line-height:30px;
  border-bottom:2px solid #eee;
}
.app-goodslist_1 ul .red_1{
  border-bottom:2px solid #ed3f3f;
}
.app-goodslist_1  a{
  color:black;
}
/**店铺样式 */
.app-goodslist_1 .tabr{
  display:none;
  width:100%;
  background:#eee;
  overflow:hidden;
}
.tabr .shop_tabs{
width: 100%;
/*display: none;*/
padding: 50px;
background: #fff;
position: relative;
}
.tabr .shop_tabs{
width: 100%;
text-align: center;
}
.tabr .shop_tabs img{
width: 80px;
height: 80px;
display: block;
margin: 10px auto;
}
/**排序样式 */
.app-goodslist_1 .mui-card{
  width:100%;
  margin:0;
}
.app-goodslist_1 .yin_1{
  position: fixed;
  top: 70px;
  bottom: 0;
  width: 100%;
  text-align: left;
  z-index: 3;
  display:none;
}
.app-goodslist_1 .yin_1 .bg{
  background-color: #333;
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  top: 81px;
  opacity: .6;
}
.app-goodslist_1 .yin_1 .yin_2{
  background:white;
  padding:0 12px;
}
.app-goodslist_1 .yin_1 .yin_2 p{
  width:100%;
  height:40px;
  font-size: 15px;
  margin-bottom:0;
  line-height:40px;
  color: #8f8f94;
  border-bottom:1px solid #ccc;
}
.app-goodslist_1 .mui-card .mui-gao span{
  height: 12px;
  width: 13px;
  margin-left: 4px;
  display: inline-block;
  vertical-align: middle;
  background: url('../../img/triangle.png'); 
  background-repeat:no-repeat;
  background-size: 11px;
}
/**商品样式 */
.app-goodslist_1 .goods-item_b{
  width:49%;     /*宽度*/
  margin:4px 0;
  padding:5px;
  border:1px solid #e0e0e0;
  height:250px;
  justify-content:space-between;/*子元素两端对齐*/
  background:white;  
  }
.app-goodslist_1 .goods-item_b p{
  margin:0;
  height:40px;
  overflow:hidden;
  font-size:15px;
  color:#000;
}
.app-goodslist_1 .goods-item_b img{
  width:100%;
  height:173px;
}
.app-goodslist_1 .goods-item_b .now{
  float:left;
  color:red;
  font-size:15px;
}
</style>