create database if not exists company2;
use company2;

create table if not exists salary(
	sa_level char(2) not null, 
    em_base_salary int not null default 0,
    em_add_salary int not null default 0,
    primary key(sa_level)
);

create table if not exists employee(
	em_num int not null auto_increment,
    em_name varchar(15) not null,
    em_sa_level char(2) not null, 
    em_year int not null default 1,
    em_salary int not null default 0,
    primary key(em_num),
    foreign key(em_sa_level) references salary(sa_level)
);

create table if not exists payments(
	pa_num int not null auto_increment,
    pa_em_num int not null,
    pa_date datetime default current_timestamp,
    pa_price int not null,
    primary key(pa_num),
    foreign key(pa_em_num) references employee(em_num)
);

insert into salary 
	values('사원', 200, 10),('대리', 220, 15),('과장', 240, 20),('부장', 280, 25)
    ,('전무', 300, 30),('이사', 350, 35);

insert into employee
	values(1, '홍길동', '사원', 2, 220);
-- 직원의 직급이 변경되는 경우 실행하는 프로시저
drop procedure if exists update_level;
delimiter //
create procedure update_level(
	in _num int,
    in _level char(2),
    in _year int
)
begin
	-- 해당 사원의 월급을 변경
	declare _base int default 0; -- 기본급 변수
    declare _add int default 0;-- 호봉 추가금 변수
    declare _salary int default 0; -- 월급
    -- 기본급 가져오기
    set _base = (select sa_base_salary from salary where sa_level = _level);
-- 호봉 기본금 가져오기
	set _add = (select sa_add_salary from salary where sa_level = _level);
-- 연차에 맞게 호봉 추가금 계산하기
    set _add = _add * _year;
-- 사원의 직급과 년차, 월급을 수정
    update employee set
		em_sa_level = _level,
        em_year = _year,
        em_salary = _base + _add
        where em_num = _num;
end //
delimiter ;
call update_level(1 , '과장', 1);

-- 사원에게 월급을 지급하는 프로시저를 생성하세요. 월급 지급액은 월급에서 세금 10%를 제외한 금액 
drop procedure if exists insert_payments;
delimiter //
create procedure insert_payments(
	in _num int
)
begin
	-- payments 테이블 insert
	declare _price int default 0;
    -- 사원의 월급 금액을 가져옴
    set _price = (select em_salary from employee where em_num = _num);
    -- 세금을 제외
    set _price = _price * 0.9;
    -- payment 테이블에 지급 내역을 추가
    insert into payments(pa_em_num, pa_price) values(_num, _price);
end //
delimiter ;
call insert_payments(1);

