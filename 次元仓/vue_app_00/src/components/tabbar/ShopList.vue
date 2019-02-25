<template>
    <div class="app-cart">
<div class="mui-card">
<h3>购物车列表</h3>
<div class="mui-card-content">
    <div class="mui-card-content-inner">
        <ul class="mui-table-view" v-for="item of list">
        <li class="mui-table-view-cell mui-media">
        <a href="javascript:;">
        <img class="mui-media-object mui-pull-left" :src="item.img_url">
        <div class="mui-media-body">
        {{item.name}}
        <div class='mui-ellipsis'>
        {{item.price}}
        <div class="mui-numbox" data-numbox-min='1' data-numbox-max='9'>
        <button class="mui-btn mui-btn-numbox-minus" type="button" @click="CartSub" :data-id="item.id">-</button>
        <input id="test" class="mui-input-numbox" type="number" :value="item.count" />
        <button class="mui-btn mui-btn-numbox-plus" type="button" @click="CartAdd" :data-id="item.id">+</button>
                </div>
            </div>
        </div>
    </a>
</li>
</ul>
<div class="mui-card-footer">
小计：{{getSubTotal}}
            </div>
            </div>
        </div>
    </div>
</div>
</template>
<script>
    export default {
    data(){
    return {
    val:"1",
    list:[]
        }
    },
    created() {
    this.getList()
    },
    computed:{
        getSubTotal:function(){
            var sum=0;
            for(var item of this.list){
                sum +=item.price * item.count;
            }
            return sum;
        }
    },
    methods:{

			updateItemCount(id,count){
					var url="http://127.0.0.1:3000/updateCart?id="+id;
					url+="&count="+count;
					this.axios.get(url).then(result=>{
							console.log(result);
					})
			},
    getList(){
			var url = "http://127.0.0.1:3000/getCartList";
			this.axios.get(url).then(result=>{
					this.list = result.data.data
					console.log(this.list)
				})
			},
		CartAdd(e){
		var id = e.target.dataset.id
		console.log(id)
		for(var item of this.list){
				if(item.id == id){
						item.count++
						this.updateItemCount(item.id,item.count)
						break;
            }
        }
    },
		CartSub(e){
				var id = e.target.dataset.id
				for(var item of this.list){
						if(item.id==id && item.count>1){
								item.count--
				//同步数据
				this.updateItemCount(item.id,item.count)
					}
			}
	}
}
}
</script>
<style>
    
</style>