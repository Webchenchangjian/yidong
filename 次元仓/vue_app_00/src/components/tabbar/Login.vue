<template>
  <div class="app-login">
    <!--登录显示!-->
    <div class="c_img" v-if="!infoUname">
      <img src="../../img/login_img.png" alt="">
    </div>
    <div v-if="!infoUname" class="mui-card-content">
      <div class="mui-card-content-inner">
        <form action="" class="c_form">
          <input type="text" value="" placeholder="账号" v-model="name">
          <input type="password" value="" placeholder="密码" v-model="pwd">
          <span>验证码：</span><input id="yz" placeholder="请输入验证码"/>
          <div class="yz">
            <img :src="img" alt=""/>
            <a href="javascript:;" @click="verify">看不清?换一张</a>
          </div>
          <mt-button size="large" @click.prevent="handlelogin">登录</mt-button>
        </form>
      </div>
      <div class="footer"><router-link to="/register" href="">注册账号</router-link></div>
    </div>
    <div class="css" ref="css">
      <p>次元仓欢迎你 <span>{{user}}</span></p>
      <div class="logout">
        <mt-button @click="logout">退出登录</mt-button>
      </div>
    </div>
    <!-- 地址管理 -->
    <div class="address">
      <p>地址管理</p>
    </div>
  </div>
  
</template>
<script>
import {Toast} from 'mint-ui'
  export default {
    data() {
      return{
        img:'http://127.0.0.1:3000/api/getCaptcha',
        name:"",
        pwd:"",
        user:'',
        infoUname:false,
      }  
    },
    created() {
      this.getadc()
    },
     methods:{
       verify(){
        console.log(111);
        this.img='http://127.0.0.1:3000/api/getCaptcha?d='+Math.random();
      },
       getadc(){
         var url="http://127.0.0.1:3000/getSession"
         this.axios.get(url).then(result=>{
           console.log(result)
           this.user=result.data
           if(this.user){
             this.infoUname=true;
             this.$refs.css.style.display="block"
           }else{
             this.infoUname=false;
           }
         })
       },
       logout(){
        var url="http://127.0.0.1:3000/logout";
        this.axios.get(url).then(result=>{
          Toast("退出成功");
          this.$router.push("/logout")
        })
      },
      handlelogin(){
        var n=this.name;
        var p=this.pwd;
        var reg=/^[a-z0-9_]{3,12}$/i;
        if(!reg.test(n)){
          Toast("用户名不正确");
          return;
        }
        if(!reg.test(p)){
          Toast("密码不正确");
          return;
        }
        //console.log(n+":"+p)
        var url="http://127.0.0.1:3000/login?uname="+n+"&upwd="+p;
        this.axios.get(url).then(result=>{
          console.log(result)
          //var cd=result.data
          //console.log(cd)
          //console.log(cd.cod)
          //this.user=cd.cod
          //console.log(this.user)
          //document.getElementById('c1').html = cd.result;
          //Toast(result.data.msg);
          if(result.data.code==1){
            Toast("登录成功");
            this.$router.push("/home")
          }else{
            Toast("用户名或密码不匹配")
          }
        })
      },
      // 弹出地区选择
    },
     mounted(){
     }
  }
</script>
<style scoped>
  .c_img{
    max-width: 260px;
    margin: 0 auto 20px;
  }
  .c_img img{
    width:60%;
    margin:0 auto;
    margin:0 52px;
  }
  .app-login{
    margin:0 auto;
    background-color: #f0f0f0;
    background-size: cover;
    min-height: 100%;
    background-image:url('../../img/login_bg.jpg');
  }
  /**中间的样式 */
  .mui-card-content .mui-card-content-inner{
    padding:0;
  }
  /**表单 */
  .c_form{
    margin: 0 auto;
    max-width: 300px;
    border: 1px solid #e1e1e1;
    overflow: hidden;
  }
  .c_form .mint-button{
    margin: 20px auto;
    padding: 8px;
    width: 300px;
    color: #fff;
    text-align: center;
    border-radius: 3px;
    font-size: 14px;
    background: #ed3f40;
  }
 .footer{
    margin:0 auto;
    max-width: 300px;
  }
  .footer a{
    color:red;
    font-size:14px;
  }
  /**登录成功欢迎页 */
  .app-login .css{
    display:none;
    width:100%;
    height:200px;
    text-align:center;
    border: 0;
  }
  .css p{
    margin-top:.5rem; 
    font-size:.6rem;
    color:#000;
  }
  .css p span{
    color:#824343;
  }
  .app-login .mint-button{
    background-color: #9D77AF;
  }
  /* 选择默认地址 */
  .city{
    width: 100%;
    height: 1rem;
    line-height: 1rem;
    background: #fff;
  }
  .city p{
    color: #000;
    width: 30%;
    float: left;
  }
  .popup-title {
    height: 1.06667rem;
    padding: 0 .4rem;
    font-size: .4rem;
    color: #323233;
    text-align: center;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .popup-title span{
    flex: 1;
    height: 1.06667rem;
    line-height: 1.06667rem;
  }
  .popup-title span:first-child {
    color: #323233;
    text-align: left;
  }
  .popup-title span:last-child {
    color: green;
    text-align: right;
  }
</style>