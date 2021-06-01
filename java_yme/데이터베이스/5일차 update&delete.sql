-- p200135001 교수님의 이름을 고길동으로 수정
update professor set pr_name = '고길동' where pr_num = 'p200135001';
    
select * from professor;
/*
delete from 테이블명 [where 조건];
- 해당 조건을 만족하는 튜플을 삭제
- 조건이 생략되면 전체 튜플을 삭제
*/
create table if not exists board(
	bd_num int auto_increment,
    bd_title varchar(50) not null,
    bd_is_del char(1) not null default 'N',
    primary key(bd_num)
    );
    
insert into board(bd_title) 
	values('제목1'),('제목2'),('제목3'),('제목4'),('제목5') ;
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