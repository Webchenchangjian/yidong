SET NAMES UTF8;
DROP DATABASE IF EXISTS ciyuan;
CREATE DATABASE ciyuan CHARSET=UTF8;
USE ciyuan;

/**用户信息**/
CREATE TABLE ciyuan_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16)
);
INSERT INTO ciyuan_user VALUES
(NULL,'tom',md5('123456'),'tom@qq.com','13501234567');

/****首页轮播广告商品****/
CREATE TABLE ciyuan_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128)
);
INSERT INTO ciyuan_index_carousel VALUES
(NULL,"http://127.0.0.1:3000/img/1512705801278.png"),
(NULL,"http://127.0.0.1:3000/img/1541155442171.jpg"),
(NULL,"http://127.0.0.1:3000/img/1541762938224.jpg"),
(NULL,"http://127.0.0.1:3000/img/1545640887744.jpg"),
(NULL,"http://127.0.0.1:3000/img/1545907483443.png");
-- 首页商品
CREATE TABLE ciyuan_product(
  id  INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255),
  title  VARCHAR(255),
  price DECIMAL(10,2)
);
/****首页商品****/
INSERT INTO ciyuan_product VALUES
(1,"http://127.0.0.1:3000/img/1547725045993.png","
预售预售【乐爱豆】ES偶像梦幻祭 招福 绘马 挂件 ",5),
(2,"http://127.0.0.1:3000/img/1547724572337.png","
预售预售【乐爱豆】ES偶像梦幻祭 招福 绘马 挂件 ",10),
(3,"http://127.0.0.1:3000/img/1547724309338.png","
预售预售【乐爱豆】ES偶像梦幻祭 招福 绘马 挂件 ",15),
(4,"http://127.0.0.1:3000/img/1497411126118.jpg","
预售预售【乐爱豆】ES偶像梦幻祭 招福 绘马 挂件 ",20),
(5,"http://127.0.0.1:3000/img/1501641192439.jpg","
预售预售【乐爱豆】ES偶像梦幻祭 招福 绘马 挂件 ",25),
(6,"http://127.0.0.1:3000/img/1506588010918.jpg","
预售预售【乐爱豆】ES偶像梦幻祭 招福 绘马 挂件 ",30),
(7,"http://127.0.0.1:3000/img/1506588218055.jpg","
预售预售【乐爱豆】ES偶像梦幻祭 招福 绘马 挂件 ",25),

(8,"http://127.0.0.1:3000/img/1547783352702.jpg","
【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",35),
(9,"http://127.0.0.1:3000/img/1547783352702.jpg","
【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",286),
(10,"http://127.0.0.1:3000/img/1547783352702.jpg","
【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",138),

(11,"http://127.0.0.1:3000/img/1547783352702.jpg","
【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",20),
(12,"http://127.0.0.1:3000/img/1547783352702.jpg","
【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",168.00),
(13,"http://127.0.0.1:3000/img/1547783352702.jpg","
【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",156.00),

(14,"http://127.0.0.1:3000/img/1547783352702.jpg","
【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",102.40),
(15,"http://127.0.0.1:3000/img/1547783352702.jpg","
【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",19.60),
(16,"http://127.0.0.1:3000/img/1547783352702.jpg","
【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",900),

(17,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",30),
(18,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",45),

(19,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",35),
(20,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",45),

(21,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",134.40),
(22,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",134.40),

(23,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",10),
(24,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",26),

(25,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",12),
(26,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",49),

(27,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",69),
(28,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",78),

(29,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",42),
(30,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",20),

(31,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",59),
(32,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",49),

(33,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",39.80),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",25),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",42),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",80),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",15),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",65),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",30),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",37),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",25),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",15),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",299),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",90),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",19.8),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",14.5),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",39),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",198),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",55),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",29),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",59),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",170),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",23),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",15),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",218),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",45),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",20),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",70),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",78),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",158),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",26.5),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",79),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",58),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",18),

(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",218),
(NULL,"http://127.0.0.1:3000/img/1505301021911.jpg","
【全职高手】战队人物系列眼镜盒 共15款",45);

CREATE TABLE ciyuan_news(
   id  INT PRIMARY KEY AUTO_INCREMENT,
   img_url VARCHAR(255),
   title  VARCHAR(255),
   price  DECIMAL(10,2),
   name VARCHAR(25)
);
/****汉风商品****/
INSERT INTO ciyuan_news VALUES
(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",286,"汉风"),
(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",138,"汉风"),

(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",156,"汉风"),
(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",19.6,"汉风"),

(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",68,"汉风"),
(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",79,"汉风"),

(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",176,"汉风"),
(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",178,"汉风"),

(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",178,"汉风"),
(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",294,"汉风"),

(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",198,"汉风"),
(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",254,"汉风"),

(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",75,"汉风"),
(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",39,"汉风"),

(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",192,"汉风"),
(NULL,'http://127.0.0.1:3000/img/1547782485765.jpg',"【清水溪·汉初】桂花歌 清水溪原创 刺绣改良汉服女装带帽短斗篷披风加厚上衣秋冬",246,"汉风");
/**购物车信息*/
CREATE TABLE ciyuan_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  pid INT,
  price DECIMAL(10,2),
  count INT
);
INSERT INTO ciyuan_cart VALUES(null,1,1,10,1);
INSERT INTO ciyuan_cart VALUES(null,2,2,12,2);


/**商品详情图片*/
CREATE TABLE ciyuan_pic(
  id INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #商品编号
  img_url VARCHAR(300)       
);
INSERT INTO ciyuan_pic VALUES
(NULL,1,'http://127.0.0.1:3000/img/1505301021911.jpg'),
(NULL,1,'http://127.0.0.1:3000/img/1505301033618.jpg'),
(NULL,1,'http://127.0.0.1:3000/img/1505301038519.jpg'),
(NULL,1,'http://127.0.0.1:3000/img/1505301042502.jpg'),
(NULL,1,'http://127.0.0.1:3000/img/1505301046654.jpg'),
(NULL,1,'http://127.0.0.1:3000/img/1505301050621.jpg'),
(NULL,1,'http://127.0.0.1:3000/img/1505301050621.jpg');
CREATE TABLE ciyuan_products_name(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  fname_id INT,
  name VARCHAR(10)            #款式名字
);
INSERT INTO ciyuan_products_name VALUES
(NULL,1,'叶修款'),
(NULL,1,'苏沐橙款'),
(NULL,1,'喻文州款'),
(NULL,1,'黄少天款'),
(NULL,1,'王杰希款'),
(NULL,1,'周泽楷款'),
(NULL,1,'孙翔款'),
(NULL,1,'韩文清款'),
(NULL,1,'张佳乐款');
/**商品详情文字*/
CREATE TABLE ciyuan_products(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #商品编号
  title VARCHAR(128),         #主标题
  price DECIMAL(10,2)        #价格
);
INSERT INTO ciyuan_products VALUES
(NULL,1,'【全职高手】战队人物系列眼镜盒 共15款',30);

-- 商品评价
CREATE TABLE ciyuan_comment(
  id INT PRIMARY KEY AUTO_INCREMENT,
  content VARCHAR(2000),
  ctime DATETIME,
  nid   INT
);
INSERT INTO ciyuan_comment VALUES(null,'1',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'2',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'3',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'4',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'5',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'6',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'7',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'8',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'9',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'10',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'11',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'12',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'13',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'14',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'15',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'16',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'17',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'18',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'19',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'20',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'21',now(),1);
INSERT INTO ciyuan_comment VALUES(null,'22',now(),1);

/**商品分类*/
CREATE TABLE ciyuan_classify(
  id INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #商品编号
  img_url VARCHAR(300),
  price DECIMAL(10,2),
  name VARCHAR(10)       
);
INSERT INTO ciyuan_classify VALUES
(NULL,1,"http://127.0.0.1:3000/img_1/1546586950562.jpg",189,"小裙子"),
(NULL,2,"http://127.0.0.1:3000/img_1/1544171645513.jpg",239,"小裙子"),
(NULL,3,"http://127.0.0.1:3000/img_1/1541762160126.jpg",428,"小裙子"),
(NULL,4,"http://127.0.0.1:3000/img_1/1547783352702.jpg",428,"上衣"),
(NULL,5,"http://127.0.0.1:3000/img_1/1547782485765.jpg",428,"上衣"),
(NULL,6,"http://127.0.0.1:3000/img_1/1547716054950.jpg",428,"上衣");

CREATE TABLE ciyuan_classify_c(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(300),
  title VARCHAR(10),
  name VARCHAR(10)
);
INSERT INTO ciyuan_classify_c VALUES
(NULL,"http://127.0.0.1:3000/img_1/1465383045312.jpg","汉风","小裙子"),
(NULL,"http://127.0.0.1:3000/img_1/1446016297307.jpg","古风","小裙子"),
(NULL,"http://127.0.0.1:3000/img_1/1446016509141.jpg","和风","小裙子"),
(NULL,"http://127.0.0.1:3000/img_1/1446016728621.jpg","loaita","小裙子"),
(NULL,"http://127.0.0.1:3000/img_1/1446444753067.jpg","日常","小裙子"),

(NULL,"http://127.0.0.1:3000/img_1/1446017524434.jpg","日常","上衣"),
(NULL,"http://127.0.0.1:3000/img_1/1449216802403.jpg","泳衣","上衣"),
(NULL,"http://127.0.0.1:3000/img_1/1465383045312.jpg","汉风","上衣"),
(NULL,"http://127.0.0.1:3000/img_1/1446016297307.jpg","古风","上衣"),
(NULL,"http://127.0.0.1:3000/img_1/1446017570261.jpg","loaita","上衣"),
(NULL,"http://127.0.0.1:3000/img_1/1446017583897.jpg","T恤","上衣");
