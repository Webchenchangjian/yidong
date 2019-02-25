<template>
  <div class="app-goodsinfo">
  <!--商品详情图片!-->
    <mt-swipe :auto="0">
          <mt-swipe-item v-for="item in info.pics" :key="item.id">
              <img :src="item.img_url"/>
          </mt-swipe-item>
    </mt-swipe>
    <!--商品详情信息!-->
  <div class="name_floor">
    <div class="name">
      <p>{{info.product.title}}</p>
    </div>
    <div class="price">
      <p>￥{{info.product.price}}</p>
    </div>
    <div class="cyc">
      <a>次元仓</a>发货
    </div>
    <!--配送地址!-->
    

  </div>



  <div class="mui-card">
    <div class="cad" ref="cad">
      <p>款式</p>
      <ul class="card_a">
        <li @click="des()" ref="card_a" v-for="item in info.specs" :key="item.id">
        {{item.name}}
        </li>
      </ul>
    </div>
    <p class="more" ref="more" @click="add()">点击 查看更多款式</p>
    <div class="mui-card-content">
      <div class="mui-card-inner">
        购买数量:
        <div class="mui-numbox" data-numbox-min='1' data-numbox-max='9'>
					<button class="mui-btn mui-btn-numbox-minus" type="button" @click="goodsSub">-</button>
					<input id="test" class="mui-input-numbox" type="number" value="1" v-model="val"/>
					<button class="mui-btn mui-btn-numbox-plus" type="button" @click="goodsAdd">+</button>
				</div>
      </div>
    </div>
    <div class="trps">
      <p>提示：普通商品享有质量问题7天退货，签收后3个工作日之内可换货，其他特殊商品（如手办）的售后以页面说明为准。</p>
    </div>
    <!--商品评价!-->
    <!--3。调用评论子组件!-->
    <comment-box :id="id"></comment-box>

    <div class="mui-card-footer">
      <mt-button type="primary" size="small">立即购买</mt-button>
      <mt-button type="primary" size="small" @click="addCart">加入购物车</mt-button>
    </div>
  </div>
<!--商品参数!-->
  </div>
</template>
<script>
import {Toast} from "mint-ui";
//引入子组件
import comment from "../sub/comment.vue"
  export default {
  data(){
    return{
      lid:this.$route.params.lid,
      val:1,
      info:{},
      price:""
    }
  },
  created() {
    //console.log("list组件参数:"+this.id);
    this.getGoodsInfo();
  },
  methods:{
    getGoodsInfo(){
      var lid=this.lid;
      console.log(this.lid)
      var url="http://127.0.0.1:3000/getProduct?lid="+lid;
      this.axios.get(url).then(output=>{
        var result=output
      //console.log(result)
      this.info=result.data.data
      console.log(this.info);
      console.log(this.info.pics);
      this.price=result.data.data.product.price
      })
    },
    addCart(){
        var uid=this.uid;//当前登录用户
        console.log(uid)
        var pid=this.lid;//商品编号
        var count=this.val;//商品数量
        var price=this.price;
        var url="http://127.0.0.1:3000/";
        url +="addCart"
        this.axios.get(url,{
          params:{
            uid:uid,
            pid:pid,
            count:count,
            price:price
          }
        }).then(result=>{
          if(result.data.code>0){
            this.$store.commit("increment");
            Toast(result.data.msg);
          }else{
            Toast(result.data.msg);
          }
        })
      },
    goodsSub(){
        if(this.val>1){
          this.val--;
        }        
      },
      goodsAdd(){
        if(this.val<=998){
          this.val++;
        }
      },
    add(){
      this.$refs.more.style.display="none"
      this.$refs.cad.style.height="150px"
    },
    des(){
      this.$refs.card_a.style.color="#ed3f3f"
    }

    },
    //2.注册评论子组件
    components:{
      "comment-box":comment
    }
  }
</script>
<style>
/**商品详情图片 */
.app-goodsinfo .mint-swipe{
  height:320px;
  border-bottom:1px solid #ccc;
}
.app-goodsinfo .mint-swipe img{
  width:100%;
  height:320px;
}
.app-goodsinfo .mint-swipe-indicators{
  display:none;
}
/**商品详情信息 */
.app-goodsinfo .name_floor{
  width:100%;
  height:178px;
  background:white;
  border-bottom:1px solid #ccc;
}
.name_floor .name>p{
  color:#000;
  font-size:16px;
  padding:10px 10px;
}
.name_floor .price{
  border-bottom:1px solid #ccc;
}
.name_floor .price>p{
  color:red;
  font-size:16px;
  padding-left:12px;
  font-size:20px;
}
.name_floor .cyc{
  padding:10px;
  padding-left:36px;
  background:url('../../img/supplier.png') 12px;
  background-repeat:no-repeat;
  font-size:15px;
  border-bottom:1px solid #ccc;
}
.name_floor .cyc>a{
  color:#303235;
  margin-right:8px;
}
.app-goodsinfo .mui-card{
  margin:0;
  margin-top:10px;
}
/**款式 */
.mui-card .cad{
  height:112px;
  overflow:hidden;
}
.cad .card_a{
  width: 100%;
  overflow: hidden;
  padding: 0 12px;
  margin-bottom: 5px;
  list-style:none;
}
.cad .card_a>li{
  height:30px;
  border: 1px solid #303235;
  text-overflow: ellipsis;
  overflow: hidden;
  white-space: nowrap;
  max-width: 60%;
  line-height: 30px;
  height: 30px;
  float: left;
  text-align: center;
  line-height: 25px;
  padding: 2px 5px;
  margin: 0 12px 12px 0;
  border-radius: 3px;
}
.mui-card .more{
  margin: 0 12px 12px;
  background-color: #eee;
  text-align: center;
  padding: 6px 0;
}
.mui-card-content{
  border-top:1px solid #ccc;
  padding-top:10px;
}
/**添加购物车 */
.mui-card-footer{
  margin-bottom:50px;
}
</style>