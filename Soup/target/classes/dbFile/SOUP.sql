/* 스터디 / 프로젝트 */

DROP SEQUENCE SOUP_SEQ;
DROP TABLE SOUP PURGE;

CREATE SEQUENCE SOUP_SEQ;
CREATE TABLE SOUP (
	SOUP_NO NUMBER NOT NULL, 				/* 스터디 / 프로젝트 번호 */
	SOUP_GUBUN VARCHAR2(4) NOT NULL, 		/* 스터디 프로젝트 구분 (무료스터디 FS, 유료스터디 PS, 프로젝트 P) */
	SOUP_TITLE VARCHAR2(100) NOT NULL, 		/* 스터디 / 프로젝트 명 */
	SOUP_FIELD1 VARCHAR2(50) NOT NULL, 		/* 분야 대분류 */
	SOUP_FIELD2 VARCHAR2(50) NOT NULL, 		/* 분야 소분류 */
	SOUP_RECRUIT_END_DATE DATE NOT NULL,	/* 모집 마감 기간 */
	SOUP_MEMBER_MIN NUMBER NOT NULL,		/* 최소 인원 */
	SOUP_MEMBER_MAX NUMBER NOT NULL, 		/* 최대 인원 */
	SOUP_CONTENT VARCHAR2(4000) NOT NULL, 	/* 내용 */
	SOUP_CREATE_DATE DATE NOT NULL, 		/* 생성 날짜 */
	SOUP_ADDR1 VARCHAR2(50), 				/* 스터디 지역 시/도 */
	SOUP_ADDR2 VARCHAR2(50), 				/* 스터디 지역 시/군/구 */
	SOUP_START_DATE DATE, 					/* 스터디 시작 날짜 */
	SOUP_END_DATE DATE, 					/* 스터디 종료 날짜 */
	SOUP_DAY VARCHAR2(40), 					/* 스터디 요일 */
	SOUP_START_TIME VARCHAR2(50),			/* 스터디 시작 시간 */
	SOUP_START_END VARCHAR2(50),			/* 스터디 끝 시간 */
	SOUP_PRICE NUMBER, 						/* 스터디 비용 : 유료 */
	SOUP_INTRO_VIDEO VARCHAR2(300), 		/* 스터디 소개 동영상 : 경로*/
	SOUP_STATUS VARCHAR2(30) NOT NULL 		/* 상태 (모집중RECRUIT, 모집완료DONE, 폐기 DROP, 종료 END) */
	--SOUP_RECRUIT_END_TIME VARCHAR2(50) NOT NULL	/* 모집 마감 시간*/
);

SELECT * FROM SOUP;

--모집 마감 시간 컬럼 추가
ALTER TABLE SOUP
	ADD (SOUP_RECRUIT_END_TIME VARCHAR2(50));

ALTER TABLE SOUP
	ADD
		CONSTRAINT PK_SOUP
		PRIMARY KEY (
			SOUP_NO
		);

--프로젝트 테스트 데이터
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'P', '하즈아 테스트1', '외국어', '영어', '2018-02-15', 1, 5, '프로젝트 테스트를 만듭니다.', SYSDATE, NULL, NULL, '2017-08-27', '2018-02-26', NULL, NULL, NULL, NULL, NULL, 'RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'P', '하즈아 테스트2', '외국어', '프랑스어', '2018-02-15', 1, 5, '프랑스어 테스트를 만듭니다.', SYSDATE, NULL, NULL, '2017-08-27', '2018-02-26', NULL, NULL, NULL, NULL, NULL, 'RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'P', '하즈아 테스트3', '프로그래밍', '자바', '2018-02-15', 1, 5, '자바 테스트를 만듭니다.', SYSDATE, NULL, NULL, '2017-08-27', '2018-02-26', NULL, NULL, NULL, NULL, NULL, 'RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'P', '하즈아 테스트4', '프로그래밍', '파이썬', '2018-02-15', 1, 5, '파이썬 테스트를 만듭니다.', SYSDATE, NULL, NULL, '2017-08-27', '2018-02-26', NULL, NULL, NULL, NULL, NULL, 'RECRUIT');

--무료스터디 테스트 데이터
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'FS', '하즈아 무료 스터디1', '프로그래밍', '자바', '2018-02-15', 1, 5, '자바 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', NULL, NULL,'RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'FS', '하즈아 무료 스터디2', '프로그래밍', '파이썬', '2018-02-15', 1, 5, '파이썬 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', NULL, NULL,'RECRUIT');

--유료스터디 테스트 데이터
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'PS', '하즈아 유료 스터디1', '프로그래밍', '자바', '2018-02-15', 1, 5, '자바 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', 120000, 'resouces/upload/video/test.mp4','RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'PS', '하즈아 유료 스터디2', '프로그래밍', '파이썬', '2018-02-15', 1, 5, '파이썬 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', 120000, 'resouces/upload/video/test.mp4','RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'PS', '하즈아 유료 스터디3', '외국어', '프랑스어', '2018-02-15', 1, 5, '프랑스어 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', 120000, 'resouces/upload/video/test.mp4','RECRUIT');

--무료스터디 테스트 데이터
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'FS', '하즈아 무료 스터디3', '외국어', '영어', '2018-02-15', 1, 5, '프로젝트 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', NULL, NULL,'RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'FS', '하즈아 무료 스터디4', '외국어', '프랑스어', '2018-02-15', 1, 5, '프랑스어 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', NULL, NULL,'RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'FS', '하즈아 무료 스터디5', '프로그래밍', '자바', '2018-02-15', 1, 5, '자바 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', NULL, NULL,'RECRUIT');

--프로젝트 테스트 데이터
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'P', '하즈아 테스트5', '외국어', '프랑스어', '2018-02-15', 1, 5, '프랑스어 테스트를 만듭니다.', SYSDATE, NULL, NULL, '2017-08-27', '2018-02-26', NULL, NULL, NULL, NULL, NULL, 'END');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'P', '하즈아 테스트6', '프로그래밍', '자바', '2018-02-15', 1, 5, '자바 테스트를 만듭니다.', SYSDATE, NULL, NULL, '2017-08-27', '2018-02-26', NULL, NULL, NULL, NULL, NULL, 'DROP');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'P', '하즈아 테스트7', '외국어', '프랑스어', '2018-02-15', 1, 5, '프랑스어 테스트를 만듭니다.', SYSDATE, NULL, NULL, '2017-08-27', '2018-02-26', NULL, NULL, NULL, NULL, NULL, 'DONE');

--무료스터디 테스트 데이터
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'FS', '하즈아 무료 스터디6', '외국어', '영어', '2018-02-15', 1, 5, '프로젝트 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', NULL, NULL,'RECRUIT');

--유료스터디 테스트 데이터
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'PS', '하즈아 유료 스터디4', '외국어', '프랑스어', '2018-02-15', 1, 5, '프랑스어 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', 120000, 'resouces/upload/video/test.mp4','RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'PS', '하즈아 유료 스터디5', '프로그래밍', '자바', '2018-02-15', 1, 5, '자바 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', 120000, 'resouces/upload/video/test.mp4','RECRUIT');

--무료스터디 테스트 데이터
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'FS', '하즈아 무료 스터디7', '프로그래밍', '파이썬', '2018-02-15', 1, 5, '파이썬 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', NULL, NULL,'RECRUIT');

--유료스터디 테스트 데이터
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'PS', '하즈아 유료 스터디6', '외국어', '영어', '2018-02-15', 1, 5, '프로젝트 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', 120000, 'resouces/upload/video/test.mp4','RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'PS', '하즈아 유료 스터디7', '외국어', '프랑스어', '2018-02-15', 1, 5, '프랑스어 테스트를 만듭니다.', SYSDATE, '서울', '여의도', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', 120000, 'resouces/upload/video/test.mp4','RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'PS', '1', '취업', '토익', '2018-02-15', 1, 5, '1.', SYSDATE, '서울특별시', '강남구', '2017-08-27', '2018-02-26', '월/화/수/목/금', '09:00', '18:00', 120000, 'resouces/upload/video/test.mp4','RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'PS', '2', '취업', '토익', '2018-02-15', 1, 5, '1.', SYSDATE, '서울특별시', '강남구', '2017-08-27', '2018-02-26', '목 금 토', '09:00', '18:00', 120000, 'resouces/upload/video/test.mp4','RECRUIT');
INSERT INTO SOUP VALUES(SOUP_SEQ.NEXTVAL, 'PS', '4', '취업', '토익', '2018-02-15', 1, 5, '1.', SYSDATE, '서울특별시', '강남구', '2017-08-27', '2018-02-26', '금/토/일', '09:00', '18:00', 120000, 'resouces/upload/video/test.mp4','RECRUIT');

SELECT * FROM SOUP WHERE SOUP_GUBUN='P' ORDER BY SOUP_CEATE_DATE DESC
SELECT * FROM SOUP;


SELECT ROWNUM, A.*
FROM
	(SELECT *
	FROM SOUP 
	WHERE SOUP_GUBUN='P' AND SOUP_STATUS='RECRUIT'
	ORDER BY SOUP_CEATE_DATE DESC)A
WHERE ROWNUM <= 6


<![CDATA[
		SELECT ROWNUM, A.*
			FROM
			(SELECT *
			FROM SOUP
			WHERE SOUP_GUBUN='P' AND SOUP_STATUS='RECRUIT'
			ORDER BY SOUP_CEATE_DATE DESC)A
		WHERE ROWNUM <= 6
		]]>


		SELECT SOUP_NO, SOUP_GUBUN, SOUP_TITLE, SOUP_FIELD1, SOUP_FIELD2, SOUP_RECRUIT_END_DATE, SOUP_RECRUIT_END_TIME,
				SOUP_MEMBER_MIN, SOUP_MEMBER_MAX, SOUP_CONTENT, SOUP_CEATE_DATE, SOUP_ADDR1, SOUP_ADDR2, SOUP_START_DATE, 
				SOUP_END_DATE, SOUP_DAY, SOUP_START_TIME, SOUP_END_TIME, SOUP_PRICE, SOUP_INTRO_VIDEO, SOUP_STATUS,
				MEMBER_NO, MEMBER_EMAIL, MEMBER_NAME, MEMBER_FACE
		FROM  SOUP
		INNER JOIN 
			(SELECT MEMBER_NO, MEMBER_EMAIL, MEMBER_NAME, MEMBER_FACE, SOUP_NO
			FROM MEMBER
			INNER JOIN SOUP_MEMBER
			USING (MEMBER_NO)
			WHERE MEMBER_ENA='Y'
			AND SOUP_MEMBER_GUBUN='L')
		USING (SOUP_NO)
		WHERE SOUP_STATUS='RECRUIT'
			  AND SOUP_NO=209		
		
		
UPDATE SOUP SET SOUP_START_DATE = '2017-08-27', SOUP_END_DATE='2018-02-26' WHERE SOUP_GUBUN='P';

SELECT SOUP_INTRO_VIDEO FROM SOUP order by soup_no desc

SELECT soup_price FROM SOUP order by soup_no desc

SELECT * FROM SOUP where soup_gubun='P' order by soup_no desc

SELECT * FROM SOUP_MEMBER

INSERT ALL
INTO soup values (SOUP_SEQ.currval,'FS','보영찡','취업',
								'토익','2018-08-02',4,6,
								'ehlfkd bb',SYSDATE,'서울특별시','강남구','2018-01-02',
								'2018-02-03','월 화 수 목 금',"19:00","22:00",NULL,NULL,
								'RECRUIT',"20:00")

select * from soup where soup_no in (select max(soup_no) from soup);

INSERT INTO SOUP_MEMBER VALUES(SOUP_SEQ.CURRVAL,29,'L','BELONG',SYSDATE);

select * from soup_apply;


		SELECT DISTINCT SOUP_NO, MEMBER_NO
		FROM SOUP JOIN JJIM USING(SOUP_NO) JOIN MEMBER USING(MEMBER_NO)
		WHERE SOUP_GUBUN='P'
			  AND SOUP_STATUS='RECRUIT'
			  AND SOUP_FIELD1 LIKE '%%'
			  AND SOUP_FIELD2 LIKE '%'
			  AND SOUP_ADDR1 LIKE '%%' or SOUP_ADDR1 is null
			  AND SOUP_ADDR2 LIKE '%%' or SOUP_ADDR2 is null
			  AND SOUP_DAY LIKE '%%' or SOUP_DAY is null
			  AND  (SOUP_TITLE LIKE '%%' 
			  	   OR SOUP_ADDR1 LIKE '%%' or SOUP_ADDR1 is null
			  	   OR SOUP_ADDR2 LIKE '%%' or SOUP_ADDR2 is null
			  	   OR MEMBER_NAME LIKE '%%')
		ORDER BY SOUP_CEATE_DATE DESC;

		SELECT SOUP_NO, MEMBER_NO, SOUP_GUBUN
		FROM SOUP JOIN JJIM USING(SOUP_NO) JOIN MEMBER USING(MEMBER_NO)
		WHERE SOUP_GUBUN='P'
		GROUP BY SOUP_NO, MEMBER_NO, SOUP_GUBUN
		ORDER BY SOUP_CEATE_DATE DESC;

SELECT * FROM MEMBER

--검색쿼리문 BY 영철 

-- 조건 X AND PAGING
SELECT ROWNUM,A.SOUP_NO, A.SOUP_GUBUN, A.SOUP_TITLE, A.SOUP_FIELD1, A.SOUP_FIELD2, A.SOUP_RECRUIT_END_DATE, 
	       A.SOUP_MEMBER_MIN, A.SOUP_MEMBER_MAX, A.SOUP_ADDR1, A.SOUP_ADDR2, A.SOUP_START_DATE, A.SOUP_END_DATE,
	       A.SOUP_DAY, A.SOUP_START_TIME, A.SOUP_END_TIME, A.SOUP_PRICE,
	       A.MEMBER_NO, A.MEMBER_EMAIL, A.MEMBER_NAME, A.MEMBER_FACE
FROM 
	(SELECT SOUP_NO, SOUP_GUBUN, SOUP_TITLE, SOUP_FIELD1, SOUP_FIELD2, SOUP_RECRUIT_END_DATE, 
	       SOUP_MEMBER_MIN, SOUP_MEMBER_MAX, SOUP_ADDR1, SOUP_ADDR2, SOUP_START_DATE, SOUP_END_DATE,
	       SOUP_DAY, SOUP_START_TIME, SOUP_END_TIME, SOUP_PRICE,
	       MEMBER_NO, MEMBER_EMAIL, MEMBER_NAME, MEMBER_FACE
	FROM SOUP
	INNER JOIN
	    (SELECT MEMBER_NO, MEMBER_EMAIL, MEMBER_NAME, MEMBER_FACE, SOUP_NO
	    FROM MEMBER
	    INNER JOIN SOUP_MEMBER
	    USING (MEMBER_NO)
	    WHERE MEMBER_ENA = 'Y'
	    AND SOUP_MEMBER_GUBUN = 'L')
	USING (SOUP_NO)
	WHERE SOUP_STATUS = 'RECRUIT'
		  AND SOUP_RECRUIT_END_DATE > SYSDATE
		  AND SOUP_GUBUN='P'
	ORDER BY SOUP_CEATE_DATE DESC)A
WHERE ROWNUM <= 6

--조건 추가
SELECT SOUP_NO, SOUP_GUBUN, SOUP_TITLE, SOUP_FIELD1, SOUP_FIELD2, SOUP_RECRUIT_END_DATE, 
        SOUP_MEMBER_MIN, SOUP_MEMBER_MAX, SOUP_ADDR1, SOUP_ADDR2, SOUP_START_DATE, SOUP_END_DATE,
        SOUP_DAY, SOUP_START_TIME, SOUP_END_TIME, SOUP_PRICE,
        MEMBER_NO, MEMBER_EMAIL, MEMBER_NAME, MEMBER_FACE
  FROM SOUP
 INNER JOIN
	    (SELECT MEMBER_NO, MEMBER_EMAIL, MEMBER_NAME, MEMBER_FACE, SOUP_NO
	    FROM MEMBER
	    INNER JOIN SOUP_MEMBER
	    USING (MEMBER_NO)
	    WHERE MEMBER_ENA = 'Y'
	    AND SOUP_MEMBER_GUBUN = 'L')
 USING (SOUP_NO)
 WHERE SOUP_STATUS = 'RECRUIT'
   AND SOUP_RECRUIT_END_DATE > SYSDATE		
--스프구분
   AND SOUP_GUBUN = #{soupGubun}
--분야
   AND SOUP_FIELD1 = #{soupField1}
   AND SOUP_FIELD2 = #{soupField2}
--지역
   AND SOUP_ADDR1 = #{soupAddr1}
   AND SOUP_ADDR2 = #{soupAddr2}
--요일
   AND SOUP_DAY LIKE ${soupDay}
--검색 query 추가 필요

   
   
   
   
   ---------------------------------------------------------------------------------------------
   
   
   SELECT ROWNUM,A.SOUP_NO, A.SOUP_GUBUN, A.SOUP_TITLE, A.SOUP_FIELD1, A.SOUP_FIELD2, A.SOUP_RECRUIT_END_DATE, 
	       A.SOUP_MEMBER_MIN, A.SOUP_MEMBER_MAX, A.SOUP_ADDR1, A.SOUP_ADDR2, A.SOUP_START_DATE, A.SOUP_END_DATE,
	       A.SOUP_DAY, A.SOUP_START_TIME, A.SOUP_END_TIME, A.SOUP_PRICE,
	       A.MEMBER_NO, A.MEMBER_EMAIL, A.MEMBER_NAME, A.MEMBER_FACE
		FROM 
			(SELECT SOUP_NO, SOUP_GUBUN, SOUP_TITLE, SOUP_FIELD1, SOUP_FIELD2, SOUP_RECRUIT_END_DATE, 
			       SOUP_MEMBER_MIN, SOUP_MEMBER_MAX, SOUP_ADDR1, SOUP_ADDR2, SOUP_START_DATE, SOUP_END_DATE,
			       SOUP_DAY, SOUP_START_TIME, SOUP_END_TIME, SOUP_PRICE,
			       MEMBER_NO, MEMBER_EMAIL, MEMBER_NAME, MEMBER_FACE
			FROM SOUP
			INNER JOIN
			    (SELECT MEMBER_NO, MEMBER_EMAIL, MEMBER_NAME, MEMBER_FACE, SOUP_NO
			    FROM MEMBER
			    INNER JOIN SOUP_MEMBER
			    USING (MEMBER_NO)
			    WHERE MEMBER_ENA = 'Y'
			    AND SOUP_MEMBER_GUBUN = 'L')
			USING (SOUP_NO)
			WHERE SOUP_STATUS = 'RECRUIT'
				  AND SOUP_RECRUIT_END_DATE > SYSDATE
				  AND SOUP_GUBUN='P'
			ORDER BY SOUP_CEATE_DATE DESC)A
		WHERE ROWNUM <= 6
