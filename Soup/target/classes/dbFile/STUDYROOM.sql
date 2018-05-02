ALTER TABLE STUDYROOM
	DROP
		CONSTRAINT FK_BUSINESS_TO_STUDYROOM
		CASCADE;

ALTER TABLE STUDYROOM
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

/* 스터디룸 */
DROP TABLE STUDYROOM PURGE
DROP SEQUENCE STUDYROOM_SEQ;

CREATE SEQUENCE STUDYROOM_SEQ;
	
/* 스터디룸 */
CREATE TABLE STUDYROOM (
	STUDYROOM_NO NUMBER NOT NULL, /* 스터디룸 번호 */
	STUDYROOM_THUMBNAIL VARCHAR2(300) NOT NULL, /* 썸네일 경로 */
	STUDYROOM_NAME VARCHAR2(100) NOT NULL, /* 스터디룸 이름 */
	STUDYROOM_PRICE VARCHAR2(500) NOT NULL, /* 비용 */
	BUSINESS_NO NUMBER NOT NULL, /* 비즈니스 번호 */
	STUDYROOM_CONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
	STUDYROOM_ADDR1 VARCHAR2(100) NOT NULL, /* 주소 시/도 */
	STUDYROOM_ADDR2 VARCHAR2(100) NOT NULL, /* 주소 시/군/구 */
	STUDYROOM_ADDR VARCHAR2(300) NOT NULL, /* 위도 */
	STUDYROOM_DATE DATE NOT NULL, /* 작성일 */
	STUDYROOM_HIT NUMBER NOT NULL /* 조회수 */
);
INSERT INTO STUDYROOM VALUES(STUDYROOM_SEQ.NEXTVAL,'resources\upload\studyRoom\table021516845018274.jpg','예스브로','1시간 2500원',2,'내용','서울특별시','강서구','서울특별시 강서구 공항동 12-29',SYSDATE,'1');
INSERT INTO STUDYROOM VALUES(STUDYROOM_SEQ.NEXTVAL,'resources\upload\studyRoom\table021516845018275.jpg','두유노','1시간 2300원',2,'내용','서울특별시','영등포구','서울 영등포구 선유로 248-13',SYSDATE,'1');
INSERT INTO STUDYROOM VALUES(STUDYROOM_SEQ.NEXTVAL,'resources\upload\studyRoom\table021516845018276.jpg','강남스타일','1시간 10000원',2,'내용','서울특별시','영등포구','서울 영등포구 경인로 775',SYSDATE,'1');
INSERT INTO STUDYROOM VALUES(STUDYROOM_SEQ.NEXTVAL,'resources\upload\studyRoom\table021516845018277.jpg','헤이맨','1시간 3000원',2,'내용','서울특별시','영등포구','서울 영등포구 영신로 228-6',SYSDATE,'1');
INSERT INTO STUDYROOM VALUES(STUDYROOM_SEQ.NEXTVAL,'resources\upload\studyRoom\table021516845018278.jpg','헤이걸','1시간 3000원',2,'내용','서울특별시','영등포구','서울 영등포구 영신로 228-6',SYSDATE,'1');


<![CDATA[
SELECT *
FROM
	(SELECT ROWNUM AS RN, A.*,C.*
	FROM 
		(SELECT * 
		FROM STUDYROOM ORDER BY STUDYROOM_NO DESC) A, 
		(SELECT COUNT(STUDYROOM_NO) 
		FROM STUDYROOM) C
		WHERE ROWNUM <= 2*9)
	WHERE 2*9-8 <= RN
]]>


UPDATE STUDYROOM SET STUDYROOM_THUMBNAIL='resources\upload\studyRoom\table021516845018270.png' WHERE STUDYROOM_NO=3
UPDATE STUDYROOM SET STUDYROOM_THUMBNAIL='resources\upload\studyRoom\table021516845018271.jpg' WHERE STUDYROOM_NO=21
UPDATE STUDYROOM SET STUDYROOM_THUMBNAIL='resources\upload\studyRoom\table021516845018272.jpg' WHERE STUDYROOM_NO=22
UPDATE STUDYROOM SET STUDYROOM_THUMBNAIL='resources\upload\studyRoom\table021516845018273.jpg' WHERE STUDYROOM_NO=23
UPDATE STUDYROOM SET STUDYROOM_THUMBNAIL='resources\upload\studyRoom\table021516845018274.jpg' WHERE STUDYROOM_NO=24
UPDATE STUDYROOM SET STUDYROOM_THUMBNAIL='resources\upload\studyRoom\table021516845018275.jpg' WHERE STUDYROOM_NO=25
UPDATE STUDYROOM SET STUDYROOM_THUMBNAIL='resources\upload\studyRoom\table021516845018276.jpg' WHERE STUDYROOM_NO=26
UPDATE STUDYROOM SET STUDYROOM_THUMBNAIL='resources\upload\studyRoom\table021516845018277.jpg' WHERE STUDYROOM_NO=27
UPDATE STUDYROOM SET STUDYROOM_THUMBNAIL='resources\upload\studyRoom\table021516845018278.jpg' WHERE STUDYROOM_NO=28

SELECT * FROM STUDYROOM;

COMMENT ON TABLE STUDYROOM IS '스터디룸';

COMMENT ON COLUMN STUDYROOM.STUDYROOM_NO IS '스터디룸 번호';

COMMENT ON COLUMN STUDYROOM.STUDYROOM_THUMBNAIL IS '썸네일 경로';

COMMENT ON COLUMN STUDYROOM.STUDYROOM_NAME IS '스터디룸 이름';

COMMENT ON COLUMN STUDYROOM.STUDYROOM_PRICE IS '비용';

COMMENT ON COLUMN STUDYROOM.BUSINESS_NO IS '비즈니스 번호';

COMMENT ON COLUMN STUDYROOM.STUDYROOM_CONTENT IS '내용';

COMMENT ON COLUMN STUDYROOM.STUDYROOM_ADDR1 IS '주소 시/도';

COMMENT ON COLUMN STUDYROOM.STUDYROOM_ADDR2 IS '주소 시/군/구';

COMMENT ON COLUMN STUDYROOM.STUDYROOM_ADDR IS '위도';

COMMENT ON COLUMN STUDYROOM.STUDYROOM_DATE IS '작성일';

COMMENT ON COLUMN STUDYROOM.STUDYROOM_HIT IS '조회수';

CREATE UNIQUE INDEX PK_STUDYROOM
	ON STUDYROOM (
		STUDYROOM_NO ASC
	);

CREATE INDEX FK_BUSINESS_TO_STUDYROOM
	ON STUDYROOM (
		BUSINESS_NO ASC
	);

ALTER TABLE STUDYROOM
	ADD
		CONSTRAINT PK_STUDYROOM
		PRIMARY KEY (
			STUDYROOM_NO
		);

ALTER TABLE STUDYROOM
	ADD
		CONSTRAINT FK_BUSINESS_TO_STUDYROOM
		FOREIGN KEY (
			BUSINESS_NO
		)
		REFERENCES BUSINESS (
			BUSINESS_NO
		);