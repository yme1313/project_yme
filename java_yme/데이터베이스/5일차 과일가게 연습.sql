select * from delivery ;

select * from sales where sl_name = '사과';

select sl_name, sl_cost from sales;

select sum(sl_cost) as '총 매출액' from sales;

drop trigger if exists update_fruit;
delimiter //
create trigger update_fruit after insert on sales
for each row
begin
	update fruit
		set fr_now_count = fr_now_count -sl_salescount
			where fr_num = new.sl_fr_num;
end //
delimiter ;