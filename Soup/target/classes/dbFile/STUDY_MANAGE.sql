
CREATE TABLE study_memo (
	member_no NUMBER NOT NULL,
	soup_no NUMBER NOT NULL,
	memo_content varchar2(4000),
	memo_date date NOT NULL
);

select * from study_memo;
delete from study_memo where member_no=57;


CREATE TABLE study_schedule (
	study_schedule_dday varchar(15) NOT NULL,
	member_no NUMBER NOT NULL,
	soup_no NUMBER NOT NULL,
	study_schedule_title varchar2(500) NOT NULL,
	study_schedule_content varchar2(2000) NOT NULL,	
	study_schedule_write_date date NOT NULL,
	study_schedule_latitude NUMBER NOT NULL,
	study_schedule_longtude NUMBER NOT NULL,
	study_schedule_ismain varchar(5)
);

select * from study_schedule;
insert into study_schedule values(sysdate,121,233,'a','b',sysdate,2,1,'y');
insert into study_schedule values('2018_01_27',121,233,'a','b','2017-01-26',2,1,'n');
delete from study_schedule;
drop table study_schedule;
select * from study_schedule where member_no=123 and soup_no=321 and study_schedule_dday=20180101 and study_schedule_title='01-01 테스스'
update study_schedule set study_schedule_latitude=37.6, study_schedule_longtude=126.9376195 where study_schedule_title='01-15 2번째'

CREATE TABLE study_board (
	MEMBER_NO NUMBER NOT NULL,
	SOUP_NO NUMBER NOT NULL,
	title varchar2(1000) NOT NULL,
	contents varchar2(4000) NOT NULL,
	board_no NUMBER NOT NULL,
	date_created date NOT NULL,
	name varchar(15) NOT NULL,
	notice_check varchar(5) NOT NULL,
	hits NUMBER NOT NULL,
	file_name varchar2(500),
	file_route varchar2(500),
	enable varchar(15) NOT NULL
);
select * from study_board;
delete from study_board where board_no=24

CREATE TABLE study_curriculum (
	SOUP_NO NUMBER NOT NULL,
	curi_no NUMBER NOT NULL,
	title varchar2(500) NOT NULL,
	date_close Date NOT NULL
);

select * from study_curriculum;


CREATE TABLE study_evaluate (
	MEMBER_NO NUMBER NOT NULL,
	SOUP_NO NUMBER NOT NULL,
	curi_no NUMBER NOT NULL,
	item varchar2(100) NOT NULL,
	item_val varchar2(500) NOT NULL
);

select * from study_evaluate;
select count(distinct MEMBER_NO) from study_evaluate where SOUP_NO=57 group by curi_no
select * from study_evaluate where not MEMBER_NO=57 and item='코멘트';
select * from study_evaluate where not MEMBER_NO=57 and item='코멘트' group by curi_no;
select * from study_evaluate where SOUP_NO=57 and not MEMBER_NO=57 and item='코멘트';
select curi_no from study_evaluate where SOUP_NO=57 and not MEMBER_NO=57 and item='코멘트' group by curi_no;
select ROUND(avg(item_val),2) from study_evaluate where SOUP_NO=57 and not MEMBER_NO=57 and not item='코멘트' group by curi_no;