create database `Eb`;
use `Eb`;

-- 创建表(行为)
drop table if exists user_act;
create table user_act
(
    `act_date` string comment '行为发生的日期（年/月/日）',
    `act_time` string comment '行为发生的时间（时:分:秒）',
    `user`     string comment '序列化的用户唯一标识（数据已脱敏）',
    `act_type` string comment '行为类型：
1.浏览；2.下单；3.关注；4.评论；
5.加入购物车；6.咨询客服；7.投诉；',
    `sku`      int comment '序列化的商品唯一标识（数据已脱敏）'
)
    row format delimited
        fields terminated by ','
        lines terminated by '\n';

-- 创建表(商品)
drop table if exists sku;
create table sku
(
    sku_id int comment "序列化的商品唯一标识（数据已脱敏）",
    price  int comment "商品价格，单位为元。"
) row format delimited
    fields terminated by ','
    lines terminated by '\n';

-- 创建表(用户)
drop table if exists `user`;
create table `user`
(
    id       int comment '序列化的用户唯一标识（数据已脱敏）',
    address  string comment '用户所在城市，精确到所在的市、县',
    birthday string comment '用户生日（年/月/日）',
    gender   string comment '用户性别：女性为female；男性为male'
) row format delimited
    fields terminated by ','
    lines terminated by '\n';


-- 加载数据(行为表)
LOAD DATA LOCAL INPATH '/home/kazoto/data/user_act.csv'
    OVERWRITE INTO TABLE user_act;

-- 加载数据(商品表)
load data local INPATH '/home/kazoto/data/sku.csv'
    overwrite into table sku;

-- 加载数据(用户表)
load data local INPATH '/home/kazoto/data/user.csv'
    overwrite into table `user`;


insert overwrite table user_act
select act_date,
       act_time,
       `user`,
       act_type,
       sku
from user_act
group by act_date,
         act_time,
         `user`,
         act_type,
         sku;

insert overwrite table user_act
select act_date,
       act_time,
       `user`,
       act_type,
       sku
from user_act
where act_date between '2018-01-01' and '2018-12-30';



insert overwrite table user_act
select act_date,
       act_time,
       `user`,
       act_type,
       sku
from user_act
where act_time between '00:00:00' and '23:59:59';

drop table if exists new_user_act;

-- create table if not exists new_user_act as
-- select *
-- from user_act
--          join `user`
--               on `user`.id = user_act.user;

-- 总访问量
create table total_pv as
select count(distinct `user`)      as uv,
       sum(if(act_type = 1, 1, 0)) as pv
from user_act;


drop table day_pv;


-- 日访问量
create table day_pv as
select cast(act_date as date)      as day,
       sum(if(act_type = 1, 1, 0)) as pv,
       count(distinct `user`)      as uv
from user_act
group by cast(act_date as date)
order by day;



drop table user_behavior_count;

-- 每个用户的购物情况
create table user_behavior_count as
select `user`,
       sum(if(act_type = 1, 1, 0)) as pv,   -- 点击数
       sum(if(act_type = 3, 1, 0)) as fav,  -- 收藏数
       sum(if(act_type = 5, 1, 0)) as cart, -- 加购物车数
       sum(if(act_type = 2, 1, 0)) as buy,  -- 购买数
       sum(if(act_type = 6, 1, 0)) as con,  -- 咨询数
       sum(if(act_type = 7, 1, 0)) as com   -- 投诉
from user_act
group by `user`;

select *
from user_behavior_count;

-- 复购率：产生两次或两次以上购买的用户占购买用户的比例
create table repurchase as
select sum(if(buy > 1, 1, 0)) / sum(if(buy > 0, 1, 0)) as repurchase_rate
from user_behavior_count;

--点击/(加购物车+收藏)/购买 , 各环节转化率
create table conversion_rate as
select a.pv,
       a.fav,
       a.cart,
       a.fav + a.cart                     as `fav+cart`,
       a.buy,
       round((a.fav + a.cart) / a.pv, 4)  as pv2favcart,
       round(a.buy / (a.fav + a.cart), 4) as favcart2buy,
       round(a.buy / a.pv, 4)             as pv2buy
from (select sum(pv)   as pv,   --点击数
             sum(fav)  as fav,  --收藏数
             sum(cart) as cart, --加购物车数
             sum(buy)  as buy   --购买数
      from user_behavior_count) as a;

select *
from conversion_rate;

-- 一天的活跃时段分布
create table a_day as
select hour(act_time)              as hour,
       sum(if(act_type = 1, 1, 0)) as pv,   -- 点击数
       sum(if(act_type = 3, 1, 0)) as fav,  -- 收藏数
       sum(if(act_type = 5, 1, 0)) as cart, -- 加购物车数
       sum(if(act_type = 2, 1, 0)) as buy   -- 购买数
from user_act
group by hour(act_time)
order by hour;

--一周用户的活跃分布
create table a_week as
select DAYOFWEEK(act_date)         as weekday,
       sum(if(act_type = 1, 1, 0)) as pv,   -- 点击数
       sum(if(act_type = 3, 1, 0)) as fav,  -- 收藏数
       sum(if(act_type = 5, 1, 0)) as cart, -- 加购物车数
       sum(if(act_type = 2, 1, 0)) as buy   -- 购买数
from user_act
group by DAYOFWEEK(act_date)
order by weekday;
-- 1 ——> 星期日
-- 2 ——> 星期一
-- 3 ——> 星期二
-- 4 ——> 星期三
-- 5 ——> 星期四
-- 6 ——> 星期五
-- 7 ——> 星期六

-- 消费信息表
create table new_user_act as
select act_date, act_time, `user`, act_type, sku, price
from user_act
         join sku on user_act.sku = sku.sku_id;

-- R
CREATE OR REPLACE VIEW r
AS
SELECT `user`, DATEDIFF('2018-04-15', MAX(act_date)) R
FROM user_act
where act_type = 2
GROUP BY user_act.`user`;
-- 查看视图r
SELECT *
FROM r;



-- F 把一个用户在一天内的多次消费行为，从整体上看作一次，按顾客id分组统计交易次数。
CREATE OR REPLACE VIEW f
as
SELECT `user`, count(*) F
FROM new_user_act
where act_type = 2
GROUP BY `user`;
-- 查看视图f
SELECT *
FROM f;


-- M
CREATE OR REPLACE VIEW m
AS
SELECT `user`, SUM(price) M
FROM new_user_act
where act_type = 2
GROUP BY `user`;
-- 查看视图M
SELECT *
FROM m;


-- 创建视图RFM，联合查询视图r、f、m  联合RFM
CREATE OR REPLACE VIEW RFM
AS
SELECT r.`user`, R, F, M
FROM r
         LEFT JOIN f
                   ON r.`user` = f.`user`
         LEFT JOIN m
                   ON f.`user` = m.`user`;

SELECT *
FROM RFM;

-- 创建视图df，确认打分依据并进行打分。最近一次交易时间间隔R，设定7天为一个跨度进行打分；F和M按数据集的分位数来打分。
CREATE OR REPLACE VIEW df
as
SELECT *,
       (
           CASE
               WHEN R < 7 THEN 5
               WHEN R < 14 THEN 4
               WHEN R < 21 THEN 3
               WHEN R < 28 THEN 2
               ELSE 1
               END) R_s,
       (
           CASE
               WHEN F < 13 THEN 1
               WHEN F < 16 THEN 2
               WHEN F < 17 THEN 3
               WHEN F < 21 THEN 4
               ELSE 5
               END) F_s,
       (CASE
            WHEN M < 813 THEN 1
            WHEN M < 1204 THEN 2 -- 1069为商品的avg平均值
            WHEN M < 1257 THEN 3
            WHEN M < 1545 THEN 4
            ELSE 5
           END)     M_s
FROM RFM;
-- 查看视图df
SELECT *
FROM df;


--#创建视图fl，判断每个顾客的RFM与R、F、M分值并与平均值进行比较，大于平均值记为1，小于平均值记为0。
CREATE OR REPLACE VIEW fl
AS
SELECT *,
       IF(R_S > (SELECT avg(R_S) FROM df), 1, 0) as R_avg, --R是否大于均值
       IF(F_S > (SELECT avg(F_S)
                 FROM df), 1, 0)                 as F_avg, --F是否大于均值
       IF(M_S > (SELECT avg(M_S) FROM df), 1, 0) as M_avg  --M是否大于均值
FROM df;
--#查看视图fl


-- 创建数值视图
CREATE OR REPLACE VIEW score
AS
SELECT *, CONCAT(R_avg, F_avg, M_avg) score
FROM fl;

SELECT *
FROM score;

CREATE OR REPLACE VIEW customer_type
AS
SELECT *,
       (CASE score
            WHEN '111' THEN '重要价值客户'
            WHEN '110' THEN '消费潜力客户'
            WHEN '101' THEN '频次深耕客户'
            WHEN '100' THEN '新客户'
            WHEN '011' THEN '重要价值流失预警客户'
            WHEN '010' THEN '一般客户'
            WHEN '001' THEN '高消费唤回客户'
            ELSE '流失客户'
           END) type
FROM score;

SELECT *
FROM customer_type;


CREATE OR REPLACE VIEW customer_type_count as
select sum(if(score = 111, 1, 0)) as `重要价值客户`,
       sum(if(score = 110, 1, 0)) as `消费潜力客户`,
       sum(if(score = 101, 1, 0)) as `频次深耕客户`,
       sum(if(score = 100, 1, 0)) as `新客户`,
       sum(if(score = 011, 1, 0)) as `重要价值流失预警客户`,
       sum(if(score = 010, 1, 0)) as `一般客户`,
       sum(if(score = 001, 1, 0)) as `高消费唤回客户`
from customer_type;

select *
from customer_type_count;


create table user_el as
select id,
       address,
       cast(birthday as date) as birthday,
       gender
from `user`
where birthday IS NOT NULL;

-- 年龄分布
create table user_age_count as
select year(current_date) - year(birthday) as age,
       count(*)
from user_el
group by age;

-- 性别分布
create table male_ratio as
select sum(if(gender = 'male', 1, 0)) /
       count(*) as `male_ratio` -- 所有用户中男性的占比
from user_el;


-- 地理信息分析
create table user_address_count as
select sum(if((address like '北京市%'), 1, 0))   as `北京市`,
       sum(if((address like '天津市%'), 1, 0))   as `天津市`,
       sum(if((address like '河北省%'), 1, 0))   as `河北省`,
       sum(if((address like '山西省%'), 1, 0))   as `山西省`,
       sum(if((address like '内蒙古%'), 1, 0))   as `内蒙古`,
       sum(if((address like '辽宁省%'), 1, 0))   as `辽宁省`,
       sum(if((address like '吉林省%'), 1, 0))   as `吉林省`,
       sum(if((address like '黑龙江省%'), 1, 0)) as `黑龙江省`,
       sum(if((address like '上海市%'), 1, 0))   as `上海市`,
       sum(if((address like '江苏省%'), 1, 0))   as `江苏省`,
       sum(if((address like '浙江省%'), 1, 0))   as `浙江省`,
       sum(if((address like '安徽省%'), 1, 0))   as `安徽省`,
       sum(if((address like '福建省%'), 1, 0))   as `福建省`,
       sum(if((address like '江西省%'), 1, 0))   as `江西省`,
       sum(if((address like '山东省%'), 1, 0))   as `山东省`,
       sum(if((address like '河南省%'), 1, 0))   as `河南省`,
       sum(if((address like '湖北省%'), 1, 0))   as `湖北省`,
       sum(if((address like '湖南省%'), 1, 0))   as `湖南省`,
       sum(if((address like '广东省%'), 1, 0))   as `广东省`,
       sum(if((address like '广西%'), 1, 0))     as `广西`,
       sum(if((address like '海南省%'), 1, 0))   as `海南省`,
       sum(if((address like '重庆市%'), 1, 0))   as `重庆市`,
       sum(if((address like '四川省%'), 1, 0))   as `四川省`,
       sum(if((address like '贵州省%'), 1, 0))   as `贵州省`,
       sum(if((address like '云南省%'), 1, 0))   as `云南省`,
       sum(if((address like '西藏%'), 1, 0))     as `西藏`,
       sum(if((address like '陕西省%'), 1, 0))   as `陕西省`,
       sum(if((address like '甘肃省%'), 1, 0))   as `甘肃省`,
       sum(if((address like '青海省%'), 1, 0))   as `青海省`,
       sum(if((address like '宁夏%'), 1, 0))     as `宁夏`,
       sum(if((address like '新疆%'), 1, 0))     as `新疆`
from user_el;

show tables;

insert overwrite local directory '/home/kazoto/export/a-week'
select *
from a_week;

select *
from customer_type_count;

-- 导出
-- 周数据
insert overwrite local directory '/home/kazoto/export/a-week'
    row format delimited fields terminated by '\t'
    collection items terminated by '#'
select *
from a_week;

select *
from a_week;

-- 转化率
insert overwrite local directory '/home/kazoto/export/conversion_rate'
    row format delimited fields terminated by '\t'
    collection items terminated by '#'
select *
from conversion_rate;


select *
from user_age_count;

-- 用户标签
insert overwrite local directory '/home/kazoto/export/customer-type-count'
    row format delimited fields terminated by '\t'
    collection items terminated by '#'
select *
from customer_type_count;

select *
from customer_type_count;

-- 日访问量
insert overwrite local directory '/home/kazoto/export/day-pv'
    row format delimited fields terminated by '\t'
    collection items terminated by '#'
select *
from day_pv;

show tables;

-- 性别比例
insert overwrite local directory '/home/kazoto/export/male-ratio'
    row format delimited fields terminated by '\t'
    collection items terminated by '#'
select *
from male_ratio;
-- 总浏览量
insert overwrite local directory '/home/kazoto/export/total-pv'
    row format delimited fields terminated by '\t'
    collection items terminated by '#'
select *
from total_pv;

-- 地理位置分布
insert overwrite local directory '/home/kazoto/export/user-address-count'
    row format delimited fields terminated by '\t'
    collection items terminated by '#'
select *
from user_address_count;

-- 年龄分布
insert overwrite local directory '/home/kazoto/export/user-age-count'
    row format delimited fields terminated by '\t'
    collection items terminated by '#'
select *
from user_age_count;

insert overwrite local directory '/home/kazoto/export/total-pv'
    row format delimited fields terminated by '\t'
    collection items terminated by '#'
select *
from total_pv;

select *
from user_behavior_count;

insert overwrite local directory '/home/kazoto/export/total-pv'
    row format delimited fields terminated by '\t'
    collection items terminated by '#'
select *
from total_pv;