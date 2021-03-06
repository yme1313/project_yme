/* 가수 테이블(소녀시대와 같은 그룹) - singer
- 가수번호(기본키), 가수명, 데뷔년도, 소속사
가수번호 : si_num, int, auto_increment, 기본키
가수명 : si_name, varchar(50)
데뷔년도 : si_start_year, int
소속사 : si_agency, vachar(30)
*/
create table if not exists singer(
	si_num int auto_increment,
    si_name varchar(50),
    si_start_year int ,
    si_agency varchar(30),
    primary key(si_num),
    check(si_start_year >= 0 and si_start_year <= 9999)
    );
/*
아티스트 테이블(태연, 유리) - artist
- 아티스트번호(기본키), 아티스트명, 생일, 현재소속사, 본명 등
아티스트번호 : ar_num int auto_increment, 기본키
생일 : ar_birth datetime
소속사 : ar_agency varchar(30)
아티스트명 : ar_name varchar(50)
본명 : ar_rname varchar(30)
*/
create table if not exists artist(
	ar_num int auto_increment,
    ar_birth datetime not null,
    ar_agency varchar(30),
    ar_name varchar(50),
    ar_rnmae varchar(30),
    primary key(ar_num)
);
/*
멤버 테이블(소녀시대에 태연이 소속, 태티서에 태연이 소속) - member
- 번호(기본키), 가수번호, 아티스트번호, 포지션 등
번호 : me_num int auto_increment 기본키
가수번호 : me_si_num int 외래키
아티스트번호 : me_ar_num int 외래키
포지션 : me_position varchar(20)
*/
create table if not exists member(
	me_num int auto_increment,
	me_si_num int not null,
	me_ar_num int not null,
	me_position varchar(20),
    primary key(me_num),
    foreign key(me_si_num) references singer(si_num),
    foreign key(me_ar_num) references artist(ar_num)
);
/*
음원 테이블 - source
- 음원번호, 제목, 가사, 공개일, 작곡가, 작사가
음원번호: so_num , int auto_increment
제목 : so_title varchar(50) not null
가사 : so_lyric longtext not null
공개일 : so_public_day datetime not null
작곡가 : so_songwirtter varchar(50) not null
작사가 : so_lyricist varchar(50) not null
*/
create table if not exists source(
	so_num  int auto_increment,
	so_title varchar(50) not null,
	so_lyric longtext not null,
	so_public_day datetime not null,
	so_songwirtter varchar(50) not null,
	so_lyricist varchar(50) not null,
    primary key(so_num)
);
/*
음원포함된가수 테이블 - sing
- 음포가번호, 음원번호, 가수번호, 피처링여부
음포가번호: sn_num int auto_increment
음원번호 : sn_so_num int not null
가수번호 : sn_si_num int not null
피처링여부 : sn_featuring char(1) not null
*/
create table if not exists sing(
	sn_num int auto_increment,
	sn_so_num int not null,
	sn_si_num int not null,
	sn_featuring char(1) not null,
	primary key(sn_num),
    foreign key(sn_so_num) references `source`(so_num),
    foreign key(sn_si_num) references singer(si_num)
);
/*
앨범 테이블 - album
- 앨범번호, 앨범 타이틀명, 발매일
앨범번호 : al_num int auto_increment
타이틀명 : al_title varchar(50) not null
발매일 : al_issue_date datetime not null
*/
create table if not exists album(
	al_num int auto_increment,
	al_title varchar(50) not null,
	al_issue_date datetime not null,
	primary key(al_num)
);
/*
앨범포함된가수 테이블 - issue
- 앰포가번호, 앨범번호, 가수번호
앰포가번호 : is_num  int auto_increment
앨범번호 : is_al_num int not null 외래키
가수번호 : is_si_num int not null 외래키
*/
create table if not exists issue(
	is_num  int auto_increment,
	is_al_num int not null,
	is_si_num int not null,
	primary key(is_num),
    foreign key(is_al_num) references album(al_num),
    foreign key(is_si_num) references singer(si_num)
);
/*
앨범에 포함된 음원 테이블 - list
- 앨포음번호, 앨범번호, 음원번호, 대표곡여부
앨포음 번호 : li_num int auto_increment
앨범번호 : li_al_num int not null 외래키
음원번호 : li_so_num int not null 외래키
대표곡여부 : li_main char(1) not null
*/
create table if not exists list(
	li_num int auto_increment,
	li_al_num int not null,
	li_so_num int not null,
	li_main char(1) not null,
	primary key(li_num),
    foreign key(li_al_num) references album(al_num),
    foreign key(li_so_num) references `source`(so_num)
);