-- select 속성 from 테이블
-- selcet 속성들 from 테이블1 join 테이블2 on 테이블1.외래키 = 테이블2.기본키 where 조건;
/* 소녀시대가 부른 노래를 검색할때 필요한 쿼리문
singer 테이블(가수이름), source 테이블(노래명)
sing 테이블(가수번호, 음원번호)
*/
select so_title from singer 
	join sing 
		on si_num = sn_si_num
    join `source`
		on so_num = sn_so_num
	where si_name = '소녀시대';
-- 소녀시대의 멤버들을 검색하기 위한 쿼리문
select ar_name from singer 
	join `member`
		on si_num = me_si_num
	join artist
		on ar_num = si_num
	where si_name = '소녀시대';
/*소녀시대 3집앨범의 수록곡들을 확인하기 위한 쿼리문
album테이블과 list 테이블 활용*/
select so_title from singer 
	join sing 
		on si_num = sn_si_num
    join `source`
		on so_num = sn_so_num
	join `list`
		on li_so_num = so_num
	join album
		on al_num = li_al_num
	where si_name = '소녀시대' and al_title like '%3집%';
/* join을 하는 경우 순서에 따라 검색시간이 달라짐
*/    
    select so_title from (select * from singer where si_name='소녀시대' ) as singer_serch 
	join sing 
		on si_num = sn_si_num
    join `source`
		on so_num = sn_so_num
	join `list`
		on li_so_num = so_num
	join album
		on al_num = li_al_num
	where al_title like '%3집%';
-- 노래 제목이 거짓말이 들어간 노래를 확인하는 쿼리문
	select so_title from `source` where so_title like '%거짓말%';
-- 노래 제목 또는 가사에 거짓말이 포함된 노래를 확인하는 쿼리문
	select so_title from `source` 
		where so_title like '%거짓말%' or so_lyric like '%거짓말%';
-- SM 소속 아티스트를 목록을 확인하는 쿼리문
	select ar_name from artist where ar_agency = 'SM';
-- 태연이 활동한 그룹들을 확인하는 쿼리문
	select si_name from artist 
		join `member`
			on ar_num = me_ar_num
		join singer
			on ar_num = si_num
		where ar_name like '%태연%';
-- 태연(가수)이 피처링한 노래들을 확인하는 쿼리문
	select so_title from singer
		join sing
			on sn_si_num = si_num
		join `source`
			on so_num = sn_so_num
		where si_name like '%x태연%' and sn_featuring = 'Y' ;
-- 소녀시대의 메인 타이틀곡을 확인하는 쿼리문
select so_title from singer 
	join sing 
		on si_num = sn_si_num
    join `source`
		on so_num = sn_so_num
	join `list`
		on li_so_num = so_num
	join album
		on al_num = li_al_num
	where si_name = '소녀시대' and li_main ='Y';