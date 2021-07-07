/* 
SQL - DDL, DML, DCL
DDL - create, alter, drop
DML(CRUD) - insert, select, update, delete
insert into 테이블명[(속성1,속성2,...,속성n)]
	values(값1, 값2, ..., 값n)[, (값1, 값2, ..., 값n)];
select [all | distinct] 속성1,속성2,..,속성n from 테이블
	[where 조건]
    [group by 속성 [having 조건]]
    [order by 속성 [desc | asc]];
update 테이블명
	set
		속성명1 = 값1,
        속성명2 = 값2,
        ...,
        속성명3 = 값3
	[where 조건];
- update문은 조건이 없으면 모든 튜플에 대해 수정을 적용
- update문에 조건절을 생략하거나 조건절이 기본키에 대한 조건이 아니면
  mysql 워크벤치에서는 안정성을 위해 update문을 실행하지 않음. 
  실행하려면 워크벤치 기본 설정을 변경(Edit > Preference > SQL Editor)
  단, 워크벤치가 아닌 MySQL 8.0 Command Like Client로 접속해서 해당 쿼리를 실행하면
  설정에 상관없이 실행 됨
delete from 테이블명 [where 조건];
- 해당 조건을 만족하는 튜플을 삭제
- 조건이 생략되면 전체 튜플을 삭제
*/
-- P2000135001 교수님의 이름을 고길동으로 수정
update professor set pr_name = '고길동' where pr_num = 'P2000135001';
select * from professor;

create table if not exists board(
	bd_num int auto_increment,
    bd_title varchar(50) not null,
    bd_is_del char(1) not null default 'N',
    primary key(bd_num)
);
-- 게시글 5개 등록
insert into board(bd_title) 
	values('제목1'),('제목2'),('제목3'),('제목4'),('제목5');
-- 1번 게시글 삭제
update board set bd_is_del = 'Y' where bd_num = 1;
-- 삭제되지 않은 게시글 검색
select * from board where bd_is_del = 'N';

/*
정규화 : 데이터베이스를 효율적으로 관리하기 위해 데이터 중복을 제거하면서 무결성을 유지하기 위한 기법(쪼개기)
제1정규화 : 속성의 값이 원자값을 갖도록 테이블을 분해
제2정규화 : 완전 함수 종속을 만족하도록 테이블을 분해
		  기본기의 부분집합으로 속성을 검색하면 안 된다
제3정규화 : 이행종속을 제거하도록 테이블을 분해
- 이행종속이란?
 A->B, B->C, A->C가 성립
 
 반정규화 : 정규화로 테이블이 너무 많아서 검색할 때 너무 많은 join이 필요한 경우 
		  반 정규화를 활용하여 테이블에 속성을 추가
*/
-- sing 테이블에 가수이름을 저장하는 sn_si_name을 추가하여(반정규화) 쿼리문 작성
select so_title from sing
	join `source`
		on so_num = sn_so_num
	where sn_si_name = '소녀시대';
-- list 테이블에 가수 이름을 저장하는 li_st_name을 추가하여(반정규화) 쿼리문 작성
select so_title from `source`
	join `list`
		on so_num = li_so_num
	join album
		on al_num = li_al_num
	where li_si_name = '소녀시대' and al_title like '%3집%'; 