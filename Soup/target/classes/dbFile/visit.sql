SELECT * FROM VISIT


SELECT COUNT(*)
  FROM VISIT
 WHERE VISIT_DATE BETWEEN TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM-DD')) 
 					  AND SYSDATE
 