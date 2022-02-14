SELECT job,max(sal)
FROM emp
GROUP BY job
having max(sal) > 2500;

SELECT * 
FROM
(
    SELECT job,max(sal) money
    FROM emp
    GROUP BY job
)
WHERE money > 2500;

SELECT avg(point),g1
FROM
    (
        SELECT gname,point, ceil(rownum/5) g1 FROM gogak
    )
GROUP BY g1; --group by가 행의 길이를 결정한다.

SELECT sum(point),g1
FROM
    (
        SELECT gname,point, mod(rownum,2) g1 FROM gogak
    )
GROUP BY g1;

-- student 테이블에서 담당교수가 관리하고 있는 학생들을 카운팅하시오.
SELECT count(id),profno
FROM student
WHERE profno is not null
GROUP BY profno;

-- stundent 테이블에서 비만인 그룹에 몸무게 평균과 마른 그룹에 몸무게 평균을 구하시오.
-- 60키로 이상(비만), 60키로 미만(마른)
SELECT trunc(avg(weight)),g1
FROM
(
    SELECT name,floor(weight/60) as g1,weight
    FROM student
    ORDER BY weight
)
GROUP BY g1;

SELECT round(avg(weight),2) as 평균몸무게,decode(g1,1,'비만','마름') 비만도
FROM
(
    SELECT name, weight, floor(weight/60) g1
    FROM student 
    ORDER BY weight
)
GROUP BY g1;

SELECT round(avg(weight)) as 평균몸무게,g1 as 비만도
FROM
(
SELECT name,weight,
    case when weight <=60 then '마른'
         else '비만'
    end as g1
    FROM student
)
GROUP BY g1;

-- 순위 구하기 1,3 4,6 7,9

-- rank() over()
SELECT ename, rank() OVER (ORDER BY sal DESC),sal 
FROM emp;

-- dense_rank() over()
SELECT ename, dense_rank() OVER (ORDER BY sal DESC),sal 
FROM emp;

-- PARTITION BY (그룹핑)
SELECT sal ,
deptno,
rank() OVER (ORDER BY sal DESC)
FROM emp
WHERE deptno = 10
UNION ALL
SELECT sum(sal),null,null FROM emp WHERE deptno = 10
UNION ALL
SELECT sal ,
deptno,
rank() OVER (ORDER BY sal DESC)
FROM emp
WHERE deptno = 20
UNION ALL
SELECT sum(sal),null,null FROM emp WHERE deptno = 20
UNION ALL
SELECT sal ,
deptno,
rank() OVER (ORDER BY sal DESC)
FROM emp
WHERE deptno = 30
UNION ALL
SELECT sum(sal),null,null FROM emp WHERE deptno = 30
UNION ALL
SELECT sum(sal),null,null FROM emp ;

SELECT deptno, rank() OVER (PARTITION BY deptno ORDER BY sal DESC)
FROM emp;

-- ROLL UP (원데이터와 함께 총계,소계 구하기)
SELECT deptno, sum(sal)
FROM emp
GROUP BY rollup(deptno);

-- 1번 deptno, job 롤업
-- 2번 앞에거(deptno) 소계를 구한다.
-- 3번 전체를 소계를 구한다.
SELECT  deptno,ename, sum(sal)
FROM emp
GROUP BY rollup(deptno,ename); 

SELECT  deptno,ename,job, sum(sal)
FROM emp
GROUP BY rollup(deptno,job,ename); 

-- PIVOT