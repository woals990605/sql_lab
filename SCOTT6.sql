-- DDL (테이블생성) - Create (테이블 생성, 유저 생성), DROP (삭제), ALTER (수정)
  CREATE TABLE USERTBL
   (	
    NO NUMBER, 
	USERNAME VARCHAR2(20 BYTE), 
	PASSWORD VARCHAR2(13 BYTE), 
	GENDER CHAR(3 BYTE), 
	 CONSTRAINT "USERTBL_PK" PRIMARY KEY ("NO")
   );

    ALTER TABLE USERTBL MODIFY password VARCHAR2(20);
    
    desc usertbl;
    
    drop table usertbl2;

    SELECT *
    FROM usertbl;

-- insert
INSERT INTO usertbl(NO, USERNAME, PASSWORD, GENDER) VALUES(1, 'ssar', 'ssar1234', '남');

INSERT INTO usertbl(NO, USERNAME, PASSWORD, GENDER) VALUES(2, 'cos', 'cos1234', '여');

INSERT INTO usertbl(NO, USERNAME, PASSWORD) VALUES(3, 'love', 'love1234');

alter table usertbl add unique(username);

SELECT *
FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'USERTBL';

INSERT INTO usertbl(NO, USERNAME, PASSWORD) VALUES(4, 'love', 'love1234');

-- delete
DELETE FROM usertbl WHERE username = 'ssar';
DELETE FROM usertbl WHERE no = '2';

-- update
UPDATE usertbl SET password = 'love5678' WHERE no = 3;
UPDATE usertbl SET password = 'love1234', gender = '여' WHERE no = 3;

-- join (테이블 2개를 병합) 엄청 중요★
SELECT *
FROM emp;

SELECT *
FROM DEPT;


SELECT e.ename, e.deptno, d.dname, d.loc
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno;


SELECT *
FROM dept
WHERE deptno =
(
SELECT deptno
FROM emp
WHERE ename = 'SMITH'
);