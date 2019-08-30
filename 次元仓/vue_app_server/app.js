
//vue_app_server
//   app.js 
//   public/img/banner1.png ...
const express = require("express");
var app = express();
app.use(express.static("public"));
app.listen(3000);
const pool=require("./pool");
// 获取验证码
const svgCaptcha = require('svg-captcha');
//express mysql 参数 request;response
//跨域访问配置
//1:加载模块cors
const cors = require("cors");
//2:配置cors
app.use(cors({
  origin:["http://127.0.0.1:3001",
         "http://localhost:3001"],//允许列表
  credentials:true   //是否验证
}));
//3:加载第三方模块: express-session
const session = require("express-session");
//4:对模块配置
app.use(session({
  secret:"128位随机字符串",   //安全令牌
  resave:false,              //请求保存
  saveUninitialized:false,    //初始化
  cookie:{                   //sessionid保存时
    maxAge:1000*60*60*24     //间1天 cookie
  }
}));
//功能一:首页轮播
app.get("/getImages",(req,res)=>{
  var rows = [
    {id:1,img_url:"http://127.0.0.1:3000/img/1512705801278.png"},
    {id:2,img_url:"http://127.0.0.1:3000/img/1541155442171.jpg"},
    {id:3,img_url:"http://127.0.0.1:3000/img/1541762938224.jpg"},
    {id:4,img_url:"http://127.0.0.1:3000/img/1545640887744.jpg"},
    {id:5,img_url:"http://127.0.0.1:3000/img/1545907483443.png"},
  ];
  res.send(rows);
});
//功能二:首页商品图片
app.get("/getGoodsList",(req,res)=>{
  var sql="SELECT * FROM `ciyuan_product`"
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    res.send({data:result});
  })
});
// 功能三:九宫格商品列表
app.get("/getList",(req,res)=>{
  var sql="SELECT * FROM `ciyuan_news`"
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({data:result});
  })
});
// 功能四：商品详情
//功能八:查询商品详细信息
app.get("/getProduct",(req,res)=>{
  //1:参数 商品id
  var output={product:{},specs:[],pics:[]};
  var lid = parseInt(req.query.lid);
  //2:sql  SELECT id,name,price,
  
  var sql ="select * from ciyuan_products where lid='?'";
  pool.query(sql,[lid],(err,result)=>{
     if(err)throw err;
     output.product=result[0]
    //  res.send({code:1,data:result[0]})
  var sql="select * from ciyuan_pic where laptop_id='?'";
    pool.query(sql,[lid],(err,result)=>{
      if(err) console.log(err);
      output.pics=result
  var sql="select * from ciyuan_products_name where fname_id='?'";
    pool.query(sql,[lid],(err,result)=>{
      if(err) console.log(err);
      output.specs=result
      res.send({data:output})
      //console.log(output);
      })
    })
  });
  //3:json {code:1,data:{}}
});

//功能五:将商品信息添加至购物车
app.get("/addCart",(req,res)=>{
  //1:参数 uid pid price count
  var uid = req.session.uid;
  var pid   = parseInt(req.query.pid);
  var price = parseFloat(req.query.price);
  var count = parseInt(req.query.count);
  //2:sql  INSERT
  var sql=" INSERT INTO `ciyuan_cart`(`id`, ";
      sql+=" `uid`, `pid`, `price`,";
      sql+=" `count`) VALUES (null,?,?,?,?)";
  pool.query(sql,[uid,pid,price,count],(err,result)=>{
    console.log(uid)
      if(err)throw err;
      if(result.affectedRows > 0){
        res.send({code:1,msg:"添加成功"});
      }else{
        res.send({code:-1,msg:"添加失败"});
      }
  })
  //3:json {code:1,msg:"添加成功"}
});

//功能六:用户注册
app.get("/register",(req,res)=>{
  //1:参数 name,pwd
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  var email=req.query.email;
  var phone=req.query.phone;
  //1.1:验证
  var reg = /^[a-z0-9_]{3,12}$/;
  if(!reg.test(uname)){
    res.send({code:-1,msg:"用户名格式不正确"});
    return;
  }
  var sql = "INSERT INTO ciyuan_user VALUES(null";
  sql +=",?,md5(?),?,?)";
  pool.query(sql,[uname,upwd,email,phone],(err,result)=>{
         if(err)throw err;
         if(result.affectedRows>0){
           res.send({code:1,msg:"注册成功"})
         }else{
           res.send({code:-1,msg:"注册失败"});
         }
  })
});
// 功能七：用户登录
app.get("/login",(req,res)=>{
  //1:获取登录参数
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  //var user=req.session.uname;
  //console.log(user)
  //2:正则
  //3:创建sql
  var sql =" SELECT count(uid) as c,uid,uname";
     sql +=" FROM ciyuan_user";
     sql +=" WHERE uname = ? AND upwd = md5(?)";
  //4:如果参数匹配成功将用户id保存session对象
  pool.query(sql,[uname,upwd],(err,result)=>{
       if(err)throw err;
       //console.log(result)
       var c = result[0].c;
       if(c == 1){
        req.session.uname = result[0].uname
        req.session.uid = result[0].uid
        //console.log("|"+result[0].uname+"|")
        console.log(result[0].uname)
        var user=req.session.uname
        console.log(user)
        res.send({code:1,msg:"登录成功"});
       }else{
         res.send({code:-1,msg:"用户名或密码有误"})
       }  
  });
  //5:返回结果
  //  {code:1,msg:"登录成功"}
  //  {code:-1,msg:"用户名或密码错误"}
});
// session值
app.get("/getSession",(req,res)=>{
  var uname = req.session.uname;
  res.send(uname);
})
//功能八:用户名是否存在
app.get("/existsName",(req,res)=>{
  //1:参数
  var uname = req.query.uname;
  //2:sql
  var sql = " SELECT count(uid) as c FROM ciyuan_user";
      sql+=" WHERE uname = ?";
  pool.query(sql,[uname],(err,result)=>{
       if(err)throw err;
       //result node.js 数组
       //[{c:0}]
       ///result[0].c
       if(result[0].c > 0){
         res.send({code:-1,msg:"该用户名己存在"})
       }else{
         res.send({code:1,msg:"欢迎使用"});
       }
  })    
  //3:json
});


//功能九:查询购物车中数据
app.get("/getCartList",(req,res)=>{
  //1:参数
  var uid = req.session.uid;
  console.log("|"+uid+"|");
  //2:sql
   var sql =" SELECT p.title,p.img_url,c.count,c.price";
       sql +=" ,c.id";
       sql +=" FROM ciyuan_news p,ciyuan_cart c";
       sql +=" WHERE p.id = c.pid";
       sql +=" AND uid = ?";
   //console.log(sql);
   pool.query(sql,[uid],(err,result)=>{
       if(err)throw err;
       res.send({code:1,data:result});
   }) 
})
//功能十:同步购物中商品数量
app.get("/updateCart",(req,res)=>{
  //1:参数 id count
  var uid = parseInt(req.query.id);
  var count = parseInt(req.query.count);
  //2:sql UPDATE
  var sql = " UPDATE ciyuan_cart SET count = ?";
     sql += " WHERE uid = ?";
  pool.query(sql,[count,uid],(err,result)=>{
    if(err)throw err;   //17:30 sub add
    if(result.affectedRows > 0){
      res.send({code:1,msg:"更新成功"});
    }else{
      res.send({code:-1,msg:"更新失败"});
    }
  })
  //3:json {code:1,msg:""}
})
// 功能十一:价格排序
app.get("/priceRanking",(req,res)=>{
  var sql=" SELECT *";
    sql +=" FROM ciyuan_news";
    sql +=" ORDER BY price DESC";//按价格降序排列 
    pool.query(sql,(err,result)=>{
      if(err)throw err;
      res.send({code:1,data:result})
    })
});
app.get("/priceRanking_c",(req,res)=>{
  var sql=" SELECT *";
    sql +=" FROM ciyuan_news";
    sql +=" ORDER BY price ASC";//按价格降序排列 
    pool.query(sql,(err,result)=>{
      if(err)throw err;
      res.send({code:1,data:result})
    })
});
// 功能十二：用户退出
app.get("/logout",(req,res)=>{
  req.session.uname=null;
  req.session.uid=null;
  console.log(req.session.uid)
  res.send({code:1,msg:"退出成功"});
});
// 商品分类
app.get("/products",(req,res)=>{
  var cl=req.query.cl;
  var value=req.query.value
  var output={product:[],specs:[]};
  if(cl>=10){
    var sql="SELECT * FROM `ciyuan_classify` WHERE name LIKE '%小裙子%'"
    pool.query(sql,[value],(err,result)=>{
      if(err) throw err;
      output.product=result
      var sql="SELECT * FROM `ciyuan_classify_c` WHERE name LIKE '%小裙子%'"
      pool.query(sql,[value],(err,result)=>{
        if(err) throw err;
        output.specs=result
        res.send({data:output});
      })
    })
  }
  else if(cl<=10){
    var sql="SELECT * FROM `ciyuan_classify` WHERE name LIKE '%上衣%'"
    pool.query(sql,[value],(err,result)=>{
      if(err) throw err;
      output.product=result
      var sql="SELECT * FROM `ciyuan_classify_c` WHERE name LIKE '%上衣%'"
      pool.query(sql,[value],(err,result)=>{
        if(err) throw err;
        output.specs=result
        res.send({data:output});
      })
    })
  }
})

// 商品评价
//功能四：发表评论
app.get("/addComment",(req,res)=>{
  var nid=req.query.nid;
  console.log(nid)
  var content=req.query.content;
  var sql="INSERT INTO ciyuan_comment(id,content,ctime,nid) VALUES(null,?,now(),?)";
  pool.query(sql,[content,nid],(err,result)=>{
    if(err) throw err;
    if (result.affectedRows>0){
      res.send({code:1,msg:"评论发送成功"});
    }else{
      res.send({code:-1,msg:"评论发表失败"});
    }
  })
});

//功能五:依据新闻编号(id),查询指定新闻编号评论列表
app.get("/getComments",(req,res)=>{
  //1:参数       pno 页码;pageSize 页大小
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  var nid = parseInt(req.query.nid);
  //1.2:默认值
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 7;
  }
  //2:验证正则表达式
  var reg = /^[0-9]{1,}$/;
  if(!reg.test(pno)){
     res.send({code:-1,msg:"页码格式不正确"});
     return;
  }
  if(!reg.test(pageSize)){
    res.send({code:-2,msg:"页大小格式不正确"});
    return;
  }
  //3:创建sql
  //  查询总页数
  var sql = "SELECT count(id) as c FROM ciyuan_comment";
  sql +=" WHERE nid = ?"
  var progress = 0; //sql执行进度
  obj = {code:1};
  pool.query(sql,[nid],(err,result)=>{
       if(err)throw err;
       //console.log(result[0].c);
       var pageCount = Math.ceil(result[0].c/pageSize);
       obj.pageCount = pageCount;
       progress += 50;
       if(progress == 100){
        res.send(obj);
       }
  });
  //  查询当前页内容
var sql=" SELECT id,ctime,content";
    sql +=" FROM ciyuan_comment";
    sql +=" WHERE nid = ?"
    sql +=" ORDER BY id DESC";//按编号降序排列
    sql +=" LIMIT ?,?"
var offset = parseInt((pno-1)*pageSize);
pageSize = parseInt(pageSize);
  pool.query(sql,[nid,offset,pageSize],(err,result)=>{
    if(err)throw err;
    //console.log(result);
    obj.data = result;
    progress+=50;
    if(progress==100){
      res.send(obj);
    }
  }); 
})
// 用户登录验证码
// 获取验证码
app.use('/api/getCaptcha', function(req, res, next) {
  var captcha = svgCaptcha.create({ 
          // 翻转颜色 
          inverse: false, 
          // 字体大小 
          fontSize: 36, 
          // 噪声线条数 
          noise: 2, 
          // 宽度 
          width: 80, 
          // 高度 
          height: 30, 
         }); 
         // 保存到session,忽略大小写 
         req.session.captcha = captcha.text.toLowerCase(); 
         console.log(req.session); //0xtg 生成的验证码
         //保存到cookie 方便前端调用验证
          res.cookie('captcha', req.session); 
         res.setHeader('Content-Type', 'image/svg+xml');
         res.write(String(captcha.data));
         res.end();
 })