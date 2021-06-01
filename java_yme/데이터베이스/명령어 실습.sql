-- insert 기본 문법
-- insert into 테이블명[(속성명1, 속성명2, ..., 속성명n)]
-- values(값1,값2, ... 값n);

-- 테이블명 옆에 속성명들이 생략되면 values에서 값들을 순서대로 넣어주어야 한다


-- stundent 테이블에 학생 정보 추가
-- desc student;
insert into 
	student(st_num, st_id, st_res_num, st_pw, st_dep, st_name)
	values('2020160001', 'abc123', '010524-3456789', 'abc123', '컴공', '가나');
-- 위의 insert와 속성 순서가 다른 경우
insert into 
	student(st_id, st_num, st_res_num, st_pw, st_dep, st_name)
	values('abc124', '2020160002', '010528-3456789', 'abc123', '컴공', '가나');
-- 테이블명 옆에 속성을 생략한 경우 학번, 아이디, 주민번호, 비번, 이름, 학과 순으로 추가해야한다
-- desc student;
insert into student
	values('2020160003', 'abc125', '010529-3456789', 'abc123', '가나', '컴공');
-- 여러 행을 추가하는 경우
insert into student
	values('2020160005', 'abc789', '010510-4456789', 'abc789', '다라', '컴공'),
    ('2020160006', 'qwe123', '010410-4156789', 'qwe123', '라마', '컴공');
select * from student;
    