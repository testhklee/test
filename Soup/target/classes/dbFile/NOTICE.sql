
CREATE SEQUENCE NOTICE_SEQ

/* 공지사항 */
CREATE TABLE NOTICE (
	NOTICE_NO NUMBER NOT NULL, /* 공지사항 글 번호 */
	NOTICE_TITLE VARCHAR2(500) NOT NULL, /* 글 제목 */
	NOTICE_CONTENT VARCHAR2(4000) NOT NULL, /* 글 내용 */
	NOTICE_DATE DATE NOT NULL, /* 글 작성일 */
	NOTICE_HIT NUMBER NOT NULL /* 글 조회수 */
);

INSERT INTO NOTICE values(NOTICE_SEQ.NEXTVAL,'공지사항 TEST','TEST',SYSDATE,0)

SELECT * FROM NOTICE WHERE NOTICE_NO=2

select * from NOTICE

CREATE UNIQUE INDEX PK_NOTICE
	ON NOTICE (
		NOTICE_NO ASC
	);

ALTER TABLE NOTICE
	ADD
		CONSTRAINT PK_NOTICE
		PRIMARY KEY (
			NOTICE_NO
		);