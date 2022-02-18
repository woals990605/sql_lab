DROP TABLE postTbl;

CREATE TABLE PostTbl
(
    ID NUMBER,
    TITLE VARCHAR2(100 BYTE) NOT NULL,
    CONTENT CLOB NOT NULL,
    USERID NUMBER,
    CONSTRAINT "PostTbl_PK" PRIMARY KEY ("ID"),
    CONSTRAINT "PostTbl_FK" foreign key("USERID") references userTbl (id)
);
drop sequence SEQ_POSTTBL;

CREATE SEQUENCE SEQ_POSTTBL INCREMENT BY 1 START WITH 1;

INSERT INTO posttbl(id, title, content, userId) VALUES(SEQ_POSTTBL.nextval, '제목1', '내용1', 1);
INSERT INTO posttbl(id, title, content, userId) VALUES(SEQ_POSTTBL.nextval, '제목2', '내용2', 2);
INSERT INTO posttbl(id, title, content, userId) VALUES(SEQ_POSTTBL.nextval, '제목3', '내용3', 2);
INSERT INTO posttbl(id, title, content, userId) VALUES(SEQ_POSTTBL.nextval, '제목4', '내용4', 55);

SELECT *
FROM posttbl;

SELECT *
FROM usertbl;

SELECT *
FROM usertbl u inner join postTbl p
on u.id = p.userid;

SELECT *
FROM usertbl u LEFT OUTER join postTbl p
on u.id = p.userid;

-- user(1), post(N) - 드라이빙, FK
SELECT *
FROM postTbl p RIGHT OUTER join usertbl u
on p.userid = u.id;

SELECT *
FROM student;

-- 1. STUDENT (DEPTNO2 = FK) 테이블과 DEPARTMENT (DEPTNO = PK) 테이블 -> 동일조인
SELECT *
FROM student s  inner join department d
on s.deptno2 = d.deptno;

-- 2. 모든 학생을 다 출력하고, 연관된 부전공 정보도 조인해서 보여주세요.
SELECT *
FROM student s  LEFT outer join department d
on s.deptno2 = d.deptno;

-- 3. 모든 학과를 다 출력하고, 연관된 학생의 정보를 조인해서 보여주세요.
SELECT *
FROM department d  left outer join student s
on d.deptno = s.deptno1;
