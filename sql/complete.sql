show databases;

use visual;

create table week
(
    week   int,
    pv     int,
    follow int,
    cart   int,
    buy    int
);

insert into week (week, pv, follow, cart, buy)
values (1, 5112174, 67342, 134899, 321521);
insert into week (week, pv, follow, cart, buy)
values (2, 4615479, 59661, 82575, 296040);
insert into week (week, pv, follow, cart, buy)
values (3, 4257141, 59293, 82211, 301578);
insert into week (week, pv, follow, cart, buy)
values (4, 4039160, 59484, 78272, 300367);
insert into week (week, pv, follow, cart, buy)
values (5, 5125558, 66211, 76468, 332665);
insert into week (week, pv, follow, cart, buy)
values (6, 4919415, 63940, 72993, 320066);
insert into week (week, pv, follow, cart, buy)
values (7, 5079663, 66029, 69845, 320824);


create table customer_type_count
(
    重要价值用户         int,
    消费潜力用户         int,
    频次深耕用户         int,
    新客户               int,
    重要价值流失预警客户 int,
    一般客户             int,
    高消费客户           int
);

insert into customer_type_count (重要价值用户, 消费潜力用户, 频次深耕用户, 新客户, 重要价值流失预警客户, 一般客户, 高消费客户)
values (1586, 0, 198069, 318813, 478, 5, 364586);


create table day_pv
(
    date date,
    pv   int,
    uv   int
);
insert into day_pv (date, pv, uv)
values ('2018-02-01', 735005, 141054);
insert into day_pv (date, pv, uv)
values ('2018-02-02', 655075, 132500);
insert into day_pv (date, pv, uv)
values ('2018-02-03', 722515, 141231);
insert into day_pv (date, pv, uv)
values ('2018-02-04', 828307, 152688);
insert into day_pv (date, pv, uv)
values ('2018-02-05', 736592, 150155);
insert into day_pv (date, pv, uv)
values ('2018-02-06', 799620, 150573);
insert into day_pv (date, pv, uv)
values ('2018-02-07', 663087, 138528);
insert into day_pv (date, pv, uv)
values ('2018-02-08', 608541, 130657);
insert into day_pv (date, pv, uv)
values ('2018-02-09', 567990, 126255);
insert into day_pv (date, pv, uv)
values ('2018-02-10', 562124, 123376);
insert into day_pv (date, pv, uv)
values ('2018-02-11', 492385, 110795);
insert into day_pv (date, pv, uv)
values ('2018-02-12', 423961, 99662);
insert into day_pv (date, pv, uv)
values ('2018-02-13', 378331, 91303);
insert into day_pv (date, pv, uv)
values ('2018-02-14', 289377, 77049);
insert into day_pv (date, pv, uv)
values ('2018-02-15', 206239, 59270);
insert into day_pv (date, pv, uv)
values ('2018-02-16', 240232, 62944);
insert into day_pv (date, pv, uv)
values ('2018-02-17', 285343, 70316);
insert into day_pv (date, pv, uv)
values ('2018-02-18', 307524, 74252);
insert into day_pv (date, pv, uv)
values ('2018-02-19', 335310, 78978);
insert into day_pv (date, pv, uv)
values ('2018-02-20', 355252, 84769);
insert into day_pv (date, pv, uv)
values ('2018-02-21', 394294, 93669);
insert into day_pv (date, pv, uv)
values ('2018-02-22', 445773, 104581);
insert into day_pv (date, pv, uv)
values ('2018-02-23', 489152, 116144);
insert into day_pv (date, pv, uv)
values ('2018-02-24', 501093, 118780);
insert into day_pv (date, pv, uv)
values ('2018-02-25', 485045, 117073);
insert into day_pv (date, pv, uv)
values ('2018-02-26', 483851, 121591);
insert into day_pv (date, pv, uv)
values ('2018-02-27', 493702, 124937);
insert into day_pv (date, pv, uv)
values ('2018-02-28', 483486, 123521);
insert into day_pv (date, pv, uv)
values ('2018-03-01', 465981, 120431);
insert into day_pv (date, pv, uv)
values ('2018-03-02', 439559, 116018);
insert into day_pv (date, pv, uv)
values ('2018-03-03', 480692, 123445);
insert into day_pv (date, pv, uv)
values ('2018-03-04', 490897, 122779);
insert into day_pv (date, pv, uv)
values ('2018-03-05', 462620, 122781);
insert into day_pv (date, pv, uv)
values ('2018-03-06', 480180, 125046);
insert into day_pv (date, pv, uv)
values ('2018-03-07', 489358, 127823);
insert into day_pv (date, pv, uv)
values ('2018-03-08', 469391, 123899);
insert into day_pv (date, pv, uv)
values ('2018-03-09', 450608, 122411);
insert into day_pv (date, pv, uv)
values ('2018-03-10', 442282, 114195);
insert into day_pv (date, pv, uv)
values ('2018-03-11', 451203, 117019);
insert into day_pv (date, pv, uv)
values ('2018-03-12', 451590, 121240);
insert into day_pv (date, pv, uv)
values ('2018-03-13', 467519, 120274);
insert into day_pv (date, pv, uv)
values ('2018-03-14', 499020, 120908);
insert into day_pv (date, pv, uv)
values ('2018-03-15', 539660, 127619);
insert into day_pv (date, pv, uv)
values ('2018-03-16', 457931, 115204);
insert into day_pv (date, pv, uv)
values ('2018-03-17', 478367, 118291);
insert into day_pv (date, pv, uv)
values ('2018-03-18', 501236, 122436);
insert into day_pv (date, pv, uv)
values ('2018-03-19', 482660, 120926);
insert into day_pv (date, pv, uv)
values ('2018-03-20', 483679, 121420);
insert into day_pv (date, pv, uv)
values ('2018-03-21', 466906, 117952);
insert into day_pv (date, pv, uv)
values ('2018-03-22', 447734, 114785);
insert into day_pv (date, pv, uv)
values ('2018-03-23', 429964, 113727);
insert into day_pv (date, pv, uv)
values ('2018-03-24', 433632, 109388);
insert into day_pv (date, pv, uv)
values ('2018-03-25', 447433, 113881);
insert into day_pv (date, pv, uv)
values ('2018-03-26', 456543, 115331);
insert into day_pv (date, pv, uv)
values ('2018-03-27', 1261, 39606);
insert into day_pv (date, pv, uv)
values ('2018-03-28', 4087, 45433);
insert into day_pv (date, pv, uv)
values ('2018-03-29', 430293, 110581);
insert into day_pv (date, pv, uv)
values ('2018-03-30', 396780, 105562);
insert into day_pv (date, pv, uv)
values ('2018-03-31', 408801, 103626);
insert into day_pv (date, pv, uv)
values ('2018-04-01', 382468, 102603);
insert into day_pv (date, pv, uv)
values ('2018-04-02', 371439, 105061);
insert into day_pv (date, pv, uv)
values ('2018-04-03', 382522, 108092);
insert into day_pv (date, pv, uv)
values ('2018-04-04', 347701, 97015);
insert into day_pv (date, pv, uv)
values ('2018-04-05', 381503, 99207);
insert into day_pv (date, pv, uv)
values ('2018-04-06', 407265, 107025);
insert into day_pv (date, pv, uv)
values ('2018-04-07', 393032, 104609);
insert into day_pv (date, pv, uv)
values ('2018-04-08', 376661, 105819);
insert into day_pv (date, pv, uv)
values ('2018-04-09', 410913, 110950);
insert into day_pv (date, pv, uv)
values ('2018-04-10', 415075, 110828);
insert into day_pv (date, pv, uv)
values ('2018-04-11', 401844, 110850);
insert into day_pv (date, pv, uv)
values ('2018-04-12', 395438, 107958);
insert into day_pv (date, pv, uv)
values ('2018-04-13', 384859, 104145);
insert into day_pv (date, pv, uv)
values ('2018-04-14', 371782, 101774);
insert into day_pv (date, pv, uv)
values ('2018-04-15', 349015, 95325);

create table user_address_count
(
    `北京市`   int,
    `天津市`   int,
    `河北省`   int,
    `山西省`   int,
    `内蒙古`   int,
    `辽宁省`   int,
    `吉林省`   int,
    `黑龙江省` int,
    `上海市`   int,
    `江苏省`   int,
    `浙江省`   int,
    `安徽省`   int,
    `福建省`   int,
    `江西省`   int,
    `山东省`   int,
    `河南省`   int,
    `湖北省`   int,
    `湖南省`   int,
    `广东省`   int,
    `广西`     int,
    `海南省`   int,
    `重庆市`   int,
    `四川省`   int,
    `贵州省`   int,
    `云南省`   int,
    `西藏`     int,
    `陕西省`   int,
    `甘肃省`   int,
    `青海省`   int,
    `宁夏`     int,
    `新疆`     int
);

INSERT INTO user_address_count (`北京市`, `天津市`, `河北省`, `山西省`, `内蒙古`, `辽宁省`, `吉林省`, `黑龙江省`,
                                `上海市`, `江苏省`, `浙江省`, `安徽省`, `福建省`, `江西省`, `山东省`, `河南省`,
                                `湖北省`, `湖南省`, `广东省`, `广西`, `海南省`, `重庆市`, `四川省`, `贵州省`, `云南省`,
                                `西藏`, `陕西省`, `甘肃省`, `青海省`, `宁夏`, `新疆`)
VALUES (140034, 6901, 65410, 39110, 14286, 29830, 17195, 20686, 240805, 48103, 46927, 38393, 36519, 35949, 73658, 70250,
        40672, 49267, 343201, 33276, 7621, 18457, 68004, 31102, 16713, 6017, 36403, 15194, 5927, 2931, 9867);


create table user_age_count
(
    age   int,
    count int
);

INSERT INTO user_age_count (age, count)
VALUES (12, 80509);
INSERT INTO user_age_count (age, count)
VALUES (1, 80410);
INSERT INTO user_age_count (age, count)
VALUES (13, 80684);
INSERT INTO user_age_count (age, count)
VALUES (16, 80298);
INSERT INTO user_age_count (age, count)
VALUES (6, 80354);
INSERT INTO user_age_count (age, count)
VALUES (3, 80504);
INSERT INTO user_age_count (age, count)
VALUES (20, 62911);
INSERT INTO user_age_count (age, count)
VALUES (5, 80179);
INSERT INTO user_age_count (age, count)
VALUES (19, 80399);
INSERT INTO user_age_count (age, count)
VALUES (15, 80474);
INSERT INTO user_age_count (age, count)
VALUES (17, 80072);
INSERT INTO user_age_count (age, count)
VALUES (9, 80454);
INSERT INTO user_age_count (age, count)
VALUES (4, 80628);
INSERT INTO user_age_count (age, count)
VALUES (8, 80912);
INSERT INTO user_age_count (age, count)
VALUES (7, 80570);
INSERT INTO user_age_count (age, count)
VALUES (10, 80143);
INSERT INTO user_age_count (age, count)
VALUES (11, 80689);
INSERT INTO user_age_count (age, count)
VALUES (14, 80716);
INSERT INTO user_age_count (age, count)
VALUES (2, 80188);
INSERT INTO user_age_count (age, count)
VALUES (0, 17019);
INSERT INTO user_age_count (age, count)
VALUES (18, 80595);

create table male_ratio
(
    male float
);

insert into male_ratio (male)
values (0.500243362845611);

create table total_pv
(
    pv int,
    uv int
);
insert into total_pv (pv, uv)
values (1608706, 33148590);

