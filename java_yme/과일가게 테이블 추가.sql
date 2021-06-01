create database fruit_shop;
use fruit_shop;
/*
create table  fruit(
	fr_num int auto_increment,
    fr_name varchar(20) not null,
    fr_cost int not null,
    fr_now_count int,
    fr_indate datetime not null,
    primary key (fr_num)
);

create table sales(
	sl_num int auto_increment,
    sl_fr_num int not null,
    sl_salesdate datetime not null,
    sl_salescount int not null,
    sl_name varchar(20) not null,
    primary key (sl_num),
    foreign Key(sl_fr_num) references fruit(fr_num)
);

create table fruitwholesale(
	fw_num int auto_increment,
    fw_name varchar(20) not null,
    fw_fr_num int not null,
    fw_outside datetime not null,
    fw_out_count int not null,
    primary key (fw_num),
    foreign key (fw_fr_num) references fruit(fr_num)
);

create table delivery(
	de_num int auto_increment,
    de_fr_num int not null,
    de_fw_num int not null,
    de_put_count int not null,
    de_put_cost int not null,
    primary key (de_num),
    foreign key (de_fr_num) references fruit(fr_num),
    foreign key (de_fw_num) references fruitwholesale(fw_num)
);
*/
insert into delivery(de_put_count,de_put_cost, de_name)
	values(100, 10000,'사과');
    
insert into sales(sl_salesdate, sl_salescount, sl_name, sl_count)
	values('2021-06-01',1 ,'사과', 2000);
    
insert into sales(sl_salesdate, sl_salescount, sl_name, sl_cost)
	values('2021-06-01',1 ,'딸기', 5000);
    
insert into fruit(fr_name, fr_cost, fr_now_count,fr_indate)
	values('사과', 6000, 50, '2021-06-01');
    
