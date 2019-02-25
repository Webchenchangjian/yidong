<template>
  <div class="app-classify">
    <div class="ding">
      <div class="ding_c" @click="cent()" ref="abc">分类</div>
      <div class="ding_c" @click="cent_a()">作品</div>
      <div class="ding_c" @click="cent_b()">品牌</div>
    </div>
    <div class="center" ref="center">
      <div class="left">
        <ul>
          <li><span @click="getProducts(11)">小裙子</span></li>
          <li><span @click="getProducts(9)">上衣</span></li>
          <li><span>下装</span></li>
          <li><span>外套</span></li>
          <li><span>配件</span></li>
          <li><span>包包</span></li>
          <li><span>COSPLAY</span></li>
          <li><span>居家宅品</span></li>
          <li><span>创意文具</span></li>
          <li><span>数码周边</span></li>
          <li><span>游戏专区</span></li>
        </ul>
      </div>
      <div class="right">
        <div class="right_c">
          <div class="right_d">
            <div class="hot_sale">
              <p class="title">热卖推荐</p>
              <div class="hot_sale_c">
                <a href="" class="item_left" v-for="item in list.product" :key="item.id">
                  <img v-lazy="item.img_url" alt="">
                  <p class="product_price">￥<span>{{item.price}}</span></p>
                </a>
              </div>
            </div>
            <div class="comm_cat">
              <p class="title">常用分类</p>
              <ul class="comm_cat_list">
                <a href="" class="item_left" v-for="item in list.specs">
                  <img v-lazy="item.img_url" alt="">
                  <p class="product_name">{{item.title}}</p>
                </a>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="ta"></div>
    </div>
    <div class="center_a" ref="center_a">
      <div class="view_tag">
        <div class="cyc_tag">
          <a href="" class="cyc_tag_a">
            <img src="http://127.0.0.1:3000/img_2/1477995333137.jpg" alt="">
            <span>全职高手</span>
          </a>
          <a href="" class="cyc_tag_a">
            <img src="http://127.0.0.1:3000/img_2/1477995333137.jpg" alt="">
            <span>全职高手</span>
          </a>
          <a href="" class="cyc_tag_a">
            <img src="http://127.0.0.1:3000/img_2/1477995333137.jpg" alt="">
            <span>全职高手</span>
          </a>
          <a href="" class="cyc_tag_a">
            <img src="http://127.0.0.1:3000/img_2/1477995333137.jpg" alt="">
            <span>全职高手</span>
          </a>
          <a href="" class="cyc_tag_a">
            <img src="http://127.0.0.1:3000/img_2/1477995333137.jpg" alt="">
            <span>全职高手</span>
          </a>
          <a href="" class="cyc_tag_a">
            <img src="http://127.0.0.1:3000/img_2/1477995333137.jpg" alt="">
            <span>全职高手</span>
          </a>
        </div>
      </div>
    </div>
    <div class="center_b" ref="center_b">
      <div class="view_tag">
        <div class="cyc_tag">
          <a href="" class="cyc_tag_a">
            <img src="http://127.0.0.1:3000/img_3/1480304143900.jpg" alt="">
          </a>
          <a href="" class="cyc_tag_a">
            <img src="http://127.0.0.1:3000/img_3/1480304143900.jpg" alt="">
          </a>
          <a href="" class="cyc_tag_a">
            <img src="http://127.0.0.1:3000/img_3/1480304143900.jpg" alt="">
          </a>
          <a href="" class="cyc_tag_a">
            <img src="http://127.0.0.1:3000/img_3/1480304143900.jpg" alt="">
          </a>
          <a href="" class="cyc_tag_a">
            <img src="http://127.0.0.1:3000/img_3/1480304143900.jpg" alt="">
          </a>
          <a href="" class="cyc_tag_a">
            <img src="http://127.0.0.1:3000/img_3/1480304143900.jpg" alt="">
          </a>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    data(){
      return{
        list:{}
      }
    },
    created() {
      this.getProduct();
    },
    methods:{
      cent(){
        this.$refs.center_a.style.display="none"
        this.$refs.center.style.display="block"
        this.$refs.center_b.style.display="none"
      },
      cent_a(){
        this.$refs.center.style.display="none"
        this.$refs.center_a.style.display="block"
        this.$refs.center_b.style.display="none"
      },
      cent_b(){
        this.$refs.center_a.style.display="none"
        this.$refs.center.style.display="none"
        this.$refs.center_b.style.display="block"
      },
      getProduct(value){
        this.active=value;
        var url="http://127.0.0.1:3000/products?cl=11";
        this.axios.get(url).then(output=>{
          var result=output
          this.list=result.data.data;
          console.log(this.list);
        })
      },
      getProducts(value){
        var url="http://127.0.0.1:3000/products?cl="+value;
        this.axios.get(url).then(output=>{
          var result=output
          this.list=result.data.data;
          console.log(this.list);
        })
      }
    }

  }
</script>
<style>
.active{
  color: red;
  background: #fff;
}
  .app-classify .ding{
    background-color: #fff;
    padding-top: 8px;
    border-bottom: 1px solid #d8d8d8;
    width:375px;
    display:flex;   /*最外层父元素弹性布局*/
    justify-content:space-between;
    flex-wrap:wrap; /*子元素换行*/
  }
  .ding .ding_c{
    width: 73px;
    text-align: center;
    font-size: 14px;
    border-bottom:2px solid #ed3f3f;
    line-height: 38px;
  }
  /**中间整体 */
  .app-classify .ta{
    clear:both;
  }
  /**最左边样式 */
  .app-classify .center .left{
    float:left;
    overflow-y: auto;
    height: auto;
    min-height: 100%;
    width:30%;
  }
  .center .left ul{
    padding-left:0;
    list-style:none;
  }
  .center .left ul li{
    font-size: 14px;
    line-height: 50px;
    position: relative;
    border-right: 1px solid #e0e0e0;
    border-bottom: 1px solid #e0e0e0;
  }
  .center .left ul li span{
    display: block;
    width: 60px;
    margin: 0 auto;
  }
  /**最右边样式 */
  .center .right{
    float:right;
    width: 70%;
    padding: 0 9px;
    background: #fff;
    overflow-y: auto;
    height: auto;
    min-height: 100%;
  }
  .right .right_c .right_d{
    width:100%;
    overflow:hidden;
  }
  /**热卖推荐 */
  .right_d .title{
    color: #666;
    font-size: 14px;
    line-height: 50px;
    margin:0;
  }
  .right_d .hot_sale .hot_sale_c{
    margin-bottom:10px;
  }
  .right_d .item_left{
    float:left;
    display: block;
    width: 28%;
    margin-right: 10px;
  }
  .right_d .item_left img{
    width:100%;
  }
  .product_name,.product_price{
    text-align: center;
    color: #666;
    padding: 5px 0;
    font-size:14px;
  }
  /**常用分类 */
  .right_d .comm_cat_list{
    padding-left: 0;
    overflow:hidden;
    margin-bottom: 10px;
  }
  .product_name{
    font-size: 12px;
    width: 100%;
    overflow: hidden;
    white-space: nowrap;
  }
  /**作品样式 */
  .center_a{
    display:none;
  }
  .center_b{
    display:none;
  }
   .view_tag{
    background-color: #fff;
    padding: 24px 0;
    margin-bottom: 45px;
    text-align: center;
  }
   .view_tag .cyc_tag{
    margin: 0 auto;
    width: 100%;
    overflow: hidden;
  }
   .view_tag .cyc_tag .cyc_tag_a{
    color:#f2a421;
    margin:12px;
    display: inline-block;
    font-size: 12px;
    text-align:center;
    width: 89px;
  }
  .view_tag .cyc_tag .cyc_tag_a img{
    width:100%;
  }
</style>