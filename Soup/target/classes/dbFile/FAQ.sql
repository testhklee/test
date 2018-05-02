DROP TABLE FAQ PURGE;
DROP SEQUENCE FAQ_SEQ;

/* FAQ */
CREATE TABLE FAQ (
	FAQ_NO NUMBER NOT NULL, /* FAQ 글 번호 */
	FAQ_QUESTION VARCHAR2(1000) NOT NULL, /* 질문 */
	FAQ_ANSWER VARCHAR2(2000) NOT NULL, /* 답변 */
	FAQ_GUBUN VARCHAR2(20) NOT NULL /* 질문 분류 (사이트이용(site), 스터디관련(study), 프로젝트관련(project), 결제(pay), 환불(refund), 기타(etc)*/
);

SELECT FAQ_NO, FAQ_QUESTION, FAQ_ANSWER, FAQ_GUBUN  
FROM FAQ
ORDER BY FAQ_GUBUN DESC, FAQ_NO ASC 

CREATE SEQUENCE FAQ_SEQ

INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'결제 질문1','결제 답변1','pay');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'결제 질문2','결제 답변2','pay');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'결제 질문3','결제 답변3','pay');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'결제 질문4','결제 답변4','pay');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'결제 질문5','결제 답변5','pay');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'환불 질문1','환불 답변1','refund');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'환불 질문2','환불 답변2','refund');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'환불 질문3','환불 답변3','refund');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'환불 질문4','환불 답변4','refund');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'환불 질문5','환불 답변5','refund');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'기타 질문1','기타 답변1','etc');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'기타 질문2','기타 답변2','etc');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'기타 질문3','기타 답변3','etc');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'기타 질문4','기타 답변4','etc');
INSERT INTO FAQ values(FAQ_SEQ.NEXTVAL,'기타 질문5','기타 답변5','etc');

