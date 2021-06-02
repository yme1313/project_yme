create database if not exists fruit_shop;
use fruit_shop;

CREATE TABLE if not exists `fruit` (
	`fr_name`	varchar(20)	NOT NULL,
	`fr_price`	int	not NULL default 0,
	`fr_unit`	varchar(10)	not NULL default 'box',
	`fr_amount`	int	not NULL default 0,
    primary key (fr_name)
);

CREATE TABLE if not exists `trade` (
	`tr_num`	int	NOT NULL,
	`tr_amount`	int	not NULL default 0,
	`tr_type`	varchar(4) not NULL default 'seil',
	`tr_price`	int	not NULL default 0,
	`tr_date`	datetime not NULL default current_timestamp, 
    -- current_timestap datetime일때만 가능하며 자료를 입력한 시간을 자동으로 입력해줌
	`tr_fr_name`	varchar(20)	NOT NULL,
    primary key (tr_num),
    foreign key (tr_fr_name) references fruit(fr_name)
);
-- 사과가 입고되기 위해서 fruit 테이블에 사과정보가 등록되어 있어야 한다
-- insert into fruit  values('사과', 10000, 'box', 0);
-- 사과 100상자가 입고 되었다. 상자당 가격은 10000원
-- trade 테이블에 insert 후, fruit 테이블에 재고량을 update
-- insert into trade (tr_num, tr_amount, tr_type, tr_price, tr_fr_name) 
-- 	values(1, 100, 'buy', 1000000,'사과');
-- update fruit
-- 	set fr_amount = fr_amount + 100 where fr_name = '사과';
-- 손님이 사과 1상자를 상자당 20000원에 구매를 했다.
-- trade 테이블에 insert 후, fruit 테이블에 재고량을 update
-- insert into trade (tr_num, tr_amount, tr_type, tr_price, tr_fr_name) 
-- values(2, 1, 'sail', 20000,'사과');
-- update fruit
-- set fr_amount = fr_amount -1 where fr_name = '사과';
select sum(tr_price) from trade 
	where tr_type = 'seil' and tr_date like '2021-06-02%';
-- 총 매출액
/* case when 조건 then 실행
when 조건2 then 실행
else 실행 end) as 속성명
*/
select 
	sum(case when tr_type = 'buy' then  -tr_price
	else tr_price end) as '총매출액'
    from trade;
-- 거래가 일어난 후 재고량의 변화
drop trigger if exists insert_trade;
delimiter //
create trigger insert_trade after insert on trade
for each row 
begin
	if new.tr_type = 'buy' then
		update fruit set fr_amount = fr_amount +new.tr_amount
		where fr_name = new.tr_fr_name;
	else
		update fruit set fr_amount = fr_amount -new.tr_amount
		where fr_name = new.tr_fr_name;
    end if;
end //
delimiter ;
insert into trade (tr_num, tr_amount, tr_type, tr_price, tr_fr_name) 
	values(3, 10, 'seil', 200000,'사과');

drop procedure if exists insert_buy;
delimiter //
create procedure insert_buy(
	in _name varchar(15),
    in _amount int,
    in _price int,
    in _sell_price int
)
begin
	declare _count int default 0; -- 구매하려는 과일이 있는지 없는지 확인
    declare _num int;
    set _count = (select count(*) from fruit where fr_name = _name);
    -- 해당 과일이 없으면 
    if _count =0 then
		-- fruit 테이블에 과일를 추가(이때, 판매가격 설정)
		insert into fruit(fr_name, fr_price)
			values( _name, _sell_price);
    end if;
    -- trade 테이블에 구매 내역 추가
    set _num = (select  max(tr_num) from trade) + 1;
    insert into trade (tr_num, tr_amount, tr_type, tr_price, tr_fr_name) 
		values(_num, _amount, 'buy', _price, _name);
end //
delimiter ;
call insert_buy('포도','100',500000, 10000);


