create database if not exists cinema;
use cinema;

CREATE TABLE if not exists `movie` (
	`mo_num`	int	NOT NULL,
	`mo_title`	varchar(50)	not NULL,
	`mo_contents`	longtext	not NULL,
	`mo_director`	varchar(100)	not NULL,
	`mo_main_actor`	longtext	not NULL,
	`mo_sub_actor`	longtext	NULL,
	`mo_opening_date`	date	NULL,
	`mo_genre`	varchar(100)	not NULL,
	`mo_runtime`	int	not NULL,
	`mo_rating`	int	not NULL,
    primary key (mo_num)
);

CREATE TABLE if not exists `theater` (
	`th_branch`	varchar(50)	NOT NULL,
	`th_address`	varchar(50)	NULL,
	`th_trannsport`	longtext	NULL,
    primary key (th_branch)
);

CREATE TABLE `screen` (
	`sc_num`	int	NOT NULL,
	`sc_mo_num`	int	NOT NULL,
	`sc_start_time`	char(5)	not NULL,
	`sc_end_time`	char(5)	not NULL,
	`sc_date`	date  not NULL,
	`sc_sr_num`	int	NOT NULL,
	`sc_type`	varchar(10)	not NULL default '2D',
    primary key(sc_num),
    Foreign Key(sc_mo_num) references movie(mo_num),
    Foreign Key(sc_sr_num) references screen_room(sr_num)
);

CREATE TABLE `screen_room` (
	`sr_num`	int	NOT NULL,
	`sr_th_branch`	varchar(50)	NOT NULL,
	`sr_name`	varchar(10)	NULL,
	`sr_personnal`	int	NULL default 0,
	`sr_location`	varchar(50)	not NULL,
    primary key (sr_num),
    Foreign Key(sr_th_branch) references theater(th_branch)
);

CREATE TABLE `reservation` (
	`re_num`	int	NOT NULL,
	`re_me_id`	varchar(20)	NOT NULL,
	`re_sc_num`	int	NOT NULL,
	`re_se_num`	int	NOT NULL,
	`re_price`	int	not NULL default 0,
	`re_ti_num`	int	NOT NULL,
	primary key (re_num),
    Foreign Key(re_me_id) references `member`(me_id),
    Foreign Key(re_sc_num) references screen(sc_num),
    Foreign Key(re_se_num) references seat(se_num),
    Foreign Key(re_ti_num) references ticket(ti_num)
);

CREATE TABLE `ticket` (
	`ti_num`	int	NOT NULL,
	`ti_personnel`	int	not NULL default 1,
    primary key (ti_num)
);

CREATE TABLE `member` (
	`me_id`	varchar(20)	NOT NULL,
	`me_name`	varchar(50)	not NULL,
	`me_level`	varchar(10)	not NULL default 'bronze',
	`me_point`	int	not NULL default 0,
    primary key(me_id)
);

CREATE TABLE `seat` (
	`se_num`	int	NOT NULL,
	`se_sr_num`	int	NOT NULL,
	`se_name`	char(3)	NULL,
    primary key (se_num),
    Foreign Key (se_sr_num) references screen_room(sr_num)
);

/* 영화정보 확인하는 쿼리문 - 컨저링3 */
select * from movie 
	where mo_title like '%컨저링 3%';
    
/* 컨저링3의 오늘 상영시간을 확인하는 쿼리문*/
select sc_start_time from screen
	join movie on sc_mo_num = mo_num
		where mo_title like '%컨저링 3%' and sc_date like '2021-06-03&';
        
/* 컨저링 3의 CGV청주성암길 지점의 상영 정보를 확인하는 쿼리문 */
select mo_title, sr_th_branch, screen.* from screen 
	join screen_room on sr_num = sc_sr_num
	join movie on mo_num = sr_mo_num	
    where mo_tilte like '%컨저링 3%' and sr_th_branch like 'CGV청주성안길';
select screen.* from screen
	where sc_mo_num = (select mo_num from movie where mo_title like '%컨저링 3%')
		and sc_sr_num = 
			(select sr_num from screen_room where sr_th_branch like 'CGV청주성안길');
/* CGV청주성안길 지점의 1관의 예매 가능한 좌석 정보를 확인하는 쿼리문 */
select se_name from seat
	join screen_room on se_sr_num = sr_num
		where sr_th_branch like 'CGV청주성안길' and sr_name like '1관';
select se_name from seat
	where se_sr_num = 
		(select sr_num from screen_room 
			where sr_th_branch like 'CGV청주성안길' and sr_name like '1관');
/* CGV청주성안길 컨저링 3가 오늘 9:00에 있을 때 해당 영화의 선택 가능한 좌석을 확인
-- 해당 영화의 상영관 정보를 알아야 좌석 정보를 알 수 있다 
-- 해당 영화의 상영관시간 번호와 상영관 번호를 확인
-- 해당 영화 예매 내역 중 예약된 좌석 형환
-- 해당 영화의 예매 가능한 좌석 정보를 확인*/

-- CGV청주성안길점에서 오늘 9:00에서 시작하는 상영관의 좌석 중 예약가능한 좌석 확인
-- 해당 영화의 상영관 정보를 알아야 좌석 정보를 알 수 있다 
-- 해당 영화의 상영관시간 번호와 상영관 번호를 확인
-- 해당 영화 예매 내역 중 예약된 좌석 형환
-- 해당 영화의 예매 가능한 좌석 정보를 확인

-- CGV청주성안길점에서 오늘 9:00에서 시작하는 상영관번호
select sc_num as '상영시간번호',sc_sr_num '상영관번호' from screen 
		where sc_sr_num = 
			(select sr_num from screen_room where sr_th_branch like 'CGV청주성안길' 
		and sc_start_time like '9:00'
		and sc_date like '2021-06-03%'
		and sc_mo_num =(select mo_num from movie where mo_title like '컨저링 3%')	);
        
-- 해당 영화 예매 내역 중 예약된 좌석 현황
select se_name from seat where se_num in
	(select re_se_num from reservation 
    where re_sc_num = (select sc_num,sc_sr_num from screen 
		where sc_sr_num = 
			(select sr_num from screen_room where sr_th_branch like 'CGV청주성안길' 
		and sc_start_time like '9:00'
		and sc_date like '2021-06-03%'
		and sc_mo_num =(select mo_num from movie where mo_title like '컨저링 3%')	)));

-- 해당 영화에서(오늘 9:00 컨저링 3) 예약 가능한 좌석 찾기
select se_name from seat
	where se_sr_num= (select sc_num,sc_sr_num from screen 
		where sc_sr_num = 
			(select sr_num from screen_room where sr_th_branch like 'CGV청주성안길' 
		and sc_start_time like '9:00'
		and sc_date like '2021-06-03%'
		and sc_mo_num =(select mo_num from movie where mo_title like '컨저링 3%')	))
    and se_name not in (select se_name from seat where se_num in
	(select re_se_num from reservation 
    where re_sc_num = (select sc_num,sc_sr_num from screen 
		where sc_sr_num = 
			(select sr_num from screen_room where sr_th_branch like 'CGV청주성안길' 
		and sc_start_time like '9:00'
		and sc_date like '2021-06-03%'
		and sc_mo_num =(select mo_num from movie where mo_title like '컨저링 3%')	))));
        
-- abc123 회원이 관람했던 영화 리스트를 확인
select mo_title from movie
	join screen on mo_num = sc_mo_num
    join reservation on sc_num = re_sc_num
    where re_me_id = 'abc123';
select mo_title from movie
	where mo_num in 
    (select sc_mo_num from screen 
    join reservation on sc_num = re_sc_num
    where re_me_id = 'abc123');