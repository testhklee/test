/* 티쳐 */
DROP SEQUENCE TEACHER_SEQ;
DROP TABLE TEACHER PURGE;

/* 티쳐 */
CREATE SEQUENCE TEACHER_SEQ;
CREATE TABLE TEACHER (
	TEACHER_NO NUMBER NOT NULL, /* 강사 번호 */
	MEMBER_NO NUMBER NOT NULL, /* 회원 번호 */
	TEACHER_DD VARCHAR2(14) NOT NULL, /* 주민등록번호 */
	TEACHER_CERTIFICATE VARCHAR2(2000) NOT NULL, /* 자격증 / 어학점수 */
	TEACHER_PRVIDEO VARCHAR(300) NOT NULL, /* 지원 PR 동영상 */
	TEACHER_STATUS VARCHAR2(20) NOT NULL /* 지원 결과 (대기(WAIT), 탈락(FAIL), 통과(PASS))  */
);

SELECT * FROM TEACHER

CREATE UNIQUE INDEX PK_TEACHER
	ON TEACHER (
		TEACHER_NO ASC
	);

CREATE INDEX FK_MEMBER_TO_TEACHER
	ON TEACHER (
		MEMBER_NO ASC
	);

CREATE UNIQUE INDEX UNIQ_TEACHER_RR
	ON TEACHER (
		TEACHER_DD ASC
	);

ALTER TABLE TEACHER
	ADD
		CONSTRAINT PK_TEACHER
		PRIMARY KEY (
			TEACHER_NO
		);

ALTER TABLE TEACHER
	ADD
		CONSTRAINT UK_TEACHER
		UNIQUE (
			TEACHER_DD
		);

ALTER TABLE TEACHER
	ADD
		CONSTRAINT FK_MEMBER_TO_TEACHER
		FOREIGN KEY (
			MEMBER_NO
		)
		REFERENCES MEMBER (
			MEMBER_NO
		) ON DELETE CASCADE;
		
INSERT INTO TEACHER VALUES(TEACHER_SEQ.NEXTVAL, 20, '000000-0000001', '없음', '없음', 'WAIT');
INSERT INTO TEACHER VALUES(TEACHER_SEQ.NEXTVAL, 21, '000000-0000002', '없음', '없음', 'WAIT');
INSERT INTO TEACHER VALUES(TEACHER_SEQ.NEXTVAL, 22, '000000-0000003', '없음', '없음', 'WAIT');
INSERT INTO TEACHER VALUES(TEACHER_SEQ.NEXTVAL, 23, '000000-0000004', '없음', '없음', 'FAIL');
INSERT INTO TEACHER VALUES(TEACHER_SEQ.NEXTVAL, 24, '000000-0000005', '없음', '없음', 'PASS');
INSERT INTO TEACHER VALUES(TEACHER_SEQ.NEXTVAL, 25, '000000-0000006', '없음', '없음', 'FAIL');
INSERT INTO TEACHER VALUES(TEACHER_SEQ.NEXTVAL, 26, '000000-0000007', '없음', '없음', 'WAIT');
INSERT INTO TEACHER VALUES(TEACHER_SEQ.NEXTVAL, 27, '000000-0000008', '없음', '없음', 'PASS');
INSERT INTO TEACHER VALUES(TEACHER_SEQ.NEXTVAL, 28, '000000-0000009', '없음', '없음', 'WAIT');
INSERT INTO TEACHER VALUES(TEACHER_SEQ.NEXTVAL, 29, '000000-0000010', '없음', '없음', 'PASS');
INSERT INTO TEACHER VALUES(TEACHER_SEQ.NEXTVAL, 30, '000000-0000011', '없음', '없음', 'PASS');
INSERT INTO TEACHER VALUES(TEACHER_SEQ.NEXTVAL, 31, '000000-0000012', '없음', '없음', 'WAIT');