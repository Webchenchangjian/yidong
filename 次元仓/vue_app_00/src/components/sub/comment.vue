<template>
  <div>
    <div class="app-comment">
    <h3>评论子组件</h3>
    <textarea placeholder="请吐槽最多20个字" maxlength="120" v-model="msg"></textarea>
    <mt-button size="large" @click="addComment">发表评论</mt-button>
    <!--显示评论区域!-->
      <div class="cmt-list">
        <div class="cmt-item" v-for="(item,i) in list" :key="item.id">
        第{{i+1}}楼：发表时间{{item.ctime|datetimeFilter}}
        <div class="cmt-body">
          {{item.content}}
        </div>
        </div>
      </div>
      <mt-button size="large" @click="getMore">加载更多</mt-button>
    </div>
  </div>
</template>
<script>
  import {Toast} from 'mint-ui'

  export default {
    data() {
      return {
       msg:"",
       pageIndex:0,   //当前页码
       pageSize:7,    //页大小
       pageCount:1,   //总页数
       list:[],        //当前页内容
       lid:this.$route.params.lid
      }
    },
    methods:{
      getMore(){
        var nid =this.lid;
        console.log(nid)
        this.pageIndex++;
        var pno=this.pageIndex;
        var ps=this.pageSize;
        var url="http://127.0.0.1:3000";
        url+="/getComments?pno="+pno;
        url+="&nid="+nid+"&pageSize="+ps;
        this.axios.get(url).then(result=>{
          var rows=this.list.concat(result.data.data);
          this.list=rows;
          //console.log(rows)
        })
      },
      addComment(){
        //1.获取两个参数
        var nid=this.lid;//获取新闻编号
        var content=this.msg;//获取评论内容
        var size=content.trim().length;//内容长度
        if(size==0){
          Toast("评论的内容不能为空")
          return;
        }
        //2.发送ajax请求
        var url="http://127.0.0.1:3000";
        url+="/addComment?nid="+nid+"&content="+content;
        //接收返回数据
        this.axios.get(url).then(result=>{
          if(result.data.code==1){
            Toast(result.data.msg);
            this.list=[];//清空原数据
            this.pageIndex=0;//清空页码
            this.msg="";//清空评论内容
            this.getMore();
          }else{
            Toast(result.data.msg);
          }
        })
      }
    },
    // props:["lid"],
    //console.log(props)
    created() {
      //console.log(this.nid);
      //this.addComment();
      this.getMore();
    }
  }
</script>
<style>
  .app-comment h3{
    font-size:18px;
  }
  .app-comment textarea{/**发表评论区域 */
    font-size:14px;
    height:60px;
    margin:0;
  }
  .app-comment .cmt-list{
    margin:5px 0;
  }
  .app-comment .cmt-list .cmt-item{
    border:1px solid #aaa;
    margin-top:15px
  }
</style>