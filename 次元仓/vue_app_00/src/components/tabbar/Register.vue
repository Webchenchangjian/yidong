<template>
  <div class="app-register">
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<form>
              <input type="text" value="" placeholder="手机号" v-model="uname" @blur.prevent="checkName">
              <input type="password" value="" placeholder="请输入密码" v-model="pwd">
              <input type="password" value="" placeholder="请输入确认密码" v-model="pwd2">
              <input type="password" value="" placeholder="基友邀请码（选填）">
              <mt-button size="large" @click="login">注册</mt-button>
            </form>
					</div>
				</div>
				<div class="mui-card-footer">页脚</div>
			</div>
    </div>
</template>
<script>
  import {Toast} from 'mint-ui';
  export default {
    data(){
      return {
        uname:"",//双向绑定
        pwd:"",
        pwd2:"",
        isSumit:false//是否允许提交
      }
    },
    created() {
      
    },
    methods:{
      checkName(){
        //console.log(123);
        var n=this.uname;
        var url="http://127.0.0.1:3000/existsName?uname="+n;
        //if(){}
        this.axios.get(url).then(result=>{
          //console.log(result);
          if(result.data.code>0){
            Toast("欢迎使用");
            this.isSumit=true;
          }else{
            Toast("该用户名已存在")
            this.isSumit=false;
          }
          //Toast(result.data.msg);
        })
      },
      login(){
        if(this.isSumit==false){
          Toast("用户名已存在，请修改")
          //return;//禁止提交
        }
        //console.log(123);
        //双向绑定
        var n=this.uname;
        var p=this.pwd;
        var p2=this.pwd2;
        //console.log(n+"|"+p+"|"+p2);
        var regname=/^1[34578]\d{9}$/i;
        var regpwd=/^[a-z0-9]{8,12}$/i
        if(!regname.test(n)){
          Toast("用户名格式不正确");
          return;
        }
        if(!regpwd.test(p)){
          Toast("密码格式不正确");
          return;
        }
        if(p != p2){
          Toast("两次密码不一致，请修改");
          return;
        }
        var url="http://127.0.0.1:3000/register?uname="+n+"&upwd="+p
        this.axios.get(url).then(result=>{
          //console.log(result.data);
          Toast(result.data.msg)
          if(result.data.code==1)
        {
       this.$router.push("/login")}



        })
      }
    }

  }
</script>
<style>

</style>