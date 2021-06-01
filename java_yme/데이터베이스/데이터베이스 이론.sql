/*
SQL - DDL, DML, DCL
DDL -create, alter, drop
DML(CRUD) - insert, select, update, delete
insert into 테이블명[(속성1,속성2,....속성n)]
	values(값1,값2,...,값n)[, (값1,값2,..., 값n)];
selcet [all | distinct] 속성, 속성2,... ,속성n from 테이블
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
- update문은 조건이 없으면 모든 튜블에 대해 수정을 적용
- update문에 조건절을 생략하면 mysql 워크벤치에서는 안정성을 위해 update문을 실행하지 않음
  실행하려면 워크벤치 기본 설정을 변경
- 단, 워크벤치가 아닌 MySQL 8.0 Command like Client로 접속해서 해당 쿼리를 실행하면 설정에 상관없이 실행
*/