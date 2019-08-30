<template>
  <div class="app-login">
    <!--登录显示!-->
    <!-- 添加地址 -->
    <div class="address">
      <div class="city" @click="city">
        <p>选择默认地址{{myAddressProvince}}{{myAddressCity}}{{myAddresscounty}}</p>
      </div>
        <mt-popup :closeOnClickModal="true" v-model="popupVisible" :position="'bottom'" style="width: 100%;z-index: 2003;">
          <div class="popup-title pk-1px-b">
            <span @click="cancel()">取消</span>
            <span></span>
            <span @click="sure()">确定</span>
          </div>
          <mt-picker :slots="myAddressSlots" @change="onMyAddressChange"></mt-picker>
        </mt-popup>
    </div>
  </div>
  
</template>
<script>
import { Popup } from 'mint-ui';
import myaddress from '@/assets/pca.json' //引入省市区数据
console.log(myaddress);
import {Toast} from 'mint-ui'
import {Picker} from 'mint-ui'
  export default {
    components: {
      'mt-picker': Picker,
      'mt-popup':Popup
    },
    data() {
      return{
        popupVisible:false,
        myAddressSlots: [
          {
              flex: 1,
              defaultIndex: 1,        
              values: Object.keys(myaddress),    //省份数组
              className: 'slot1',
              textAlign: 'center'
          },{
              divider: true,
              content: '-',
              className: 'slot2'
          },{
            flex: 1,
            values: [],
            className: 'slot3',
            textAlign: 'center'
          },
          {
              divider: true,
              content: '-',
              className: 'slot4'
          },
          {
              flex: 1,
              values: [],
              className: 'slot5',
              textAlign: 'center'
          }
        ],
        myAddressProvince:'省',
        myAddressCity:'市',
        myAddresscounty:'区/县',
      }  
    },
    created() {
      // this.getadc()
    },
     methods:{
       verify(){
        console.log(111);
        this.img='http://127.0.0.1:3000/api/getCaptcha?d='+Math.random();
      },
      //  getadc(){
      //    var url="http://127.0.0.1:3000/getSession"
      //    this.axios.get(url).then(result=>{
      //      console.log(result)
      //      this.user=result.data
      //      if(this.user){
      //        this.infoUname=true;
      //        this.$refs.css.style.display="block"
      //      }else{
      //        this.infoUname=false;
      //      }
      //    })
      //  },
      // 弹出地区选择
      city(){
        console.log(22);
        this.popupVisible=true;
      },
      onMyAddressChange(picker, values) {
        if(myaddress[values[0]]){    //这个判断类似于v-if的效果（可以不加，但是vue会报错，很不爽）
          picker.setSlotValues(1,Object.keys(myaddress[values[0]])); //  Object.keys()会返回一个数组，当前省的数组
          picker.setSlotValues(2,myaddress[values[0]][values[1]]); //  区/县数据就是一个数组
          this.myAddressProvince = values[0];
          this.myAddressCity = values[1];
          this.myAddresscounty = values[2];
        }
        
      },
      sure(){
        this.popupVisible=false;
      },
      cancel(){
        this.popupVisible=true;

      }
     },
     mounted(){
       this.$nextTick(() => {  //vue里面全部加载好了再执行的函数   （类似于setTimeout）
        this.myAddressSlots[0].defaultIndex = 0        
        // 这里的值需要和 data里面 defaultIndex 的值不一样才能够初始化
        //因为我没有看过源码（我猜测是因为数据没有改变，不会触发更新）
      });
     }
  }
</script>
<style>
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
    border:1px solid #ccc;
    text-align:center;
  }
  .css p{
    font-size:25px;
    color:#000;
    margin-top:50px;
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
    /* color: #fff; */
    background: #fff;
  }
  .city p{
    color: #000;
  }
  .popup-title {
height: 1.06667rem/* 80/75 */;
padding: 0 .4rem/* 30/75 */;
font-size: .4rem/* 30/75 */;
color: #323233;
text-align: center;
display: flex;
justify-content: space-between;
align-items: center;
}
.popup-title span{
flex: 1;
height: 1.06667rem/* 80/75 */;
line-height: 1.06667rem/* 80/75 */;
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