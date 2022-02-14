-- 서브쿼리 (인라인뷰, 스칼라 서브쿼리, 서브쿼리)
-- 프로젝션은 행을 채워나가는 과정
-- SELECT *시에는 컬럼 추가 불가능 
-- SELECT 안에 SELECT가 있는 것을 서브쿼리라고 한다.

-- 스칼라 서브쿼리(하나의 row에 스칼라가 들어가야 한다.)(컬럼에)
SELECT e.*,(SELECT avg(sal) FROM emp) FROM emp e ORDER BY deptno;

-- 서브쿼리 (WHERE절) (in으로 인해서 or이 되니까 스칼라가 아니어도 된다.)
SELECT max(sal) FROM emp;

SELECT * FROM emp WHERE sal = (SELECT max(sal) FROM emp);

SELECT sal FROM emp WHERE sal > 2000;

SELECT * FROM emp WHERE sal in (SELECT sal FROM emp WHERE sal > 2000);

-- 인라인뷰 ( 뷰 - 가짜 FROM에 붙음)
-- rownum 프로젝션시에 붙임.
SELECT ename,sal,rownum FROM (SELECT ename, sal FROM emp ORDER BY sal DESC);

SELECT ename, sal FROM emp ORDER BY sal DESC;

-- rownum 특징 (앞에거를 안 거치면 뒤에거를 알 수가 없다.)
SELECT ename, sal, rownum FROM emp WHERE rownum >3;

-- student 테이블에 키 순위 5위 ~ 8위까지 출력하세요.
SELECT name,height, 순위 
FROM (SELECT name, height , rownum 순위
FROM(SELECT name, height, rownum 순위 FROM student ORDER BY height DESC))
WHERE 순위 BETWEEN 5 AND 8;

-- 해설
SELECT name, height, rank
FROM
(
    SELECT e1.*,rownum rank
    FROM
    (
        SELECT name, height FROM student ORDER BY height DESC
    ) e1 
)
WHERE rank>=5 AND rank<=8;

-- GROUP 그룹 (세로 연산) - sum, avg, count, max, min
-- 다 보여주는데 그룹을 지어서 보여준다. (값이 같아야 묶인다)
SELECT sum(sal), job
FROM emp
GROUP BY job;

-- 같은 나이별 키의 평균을 구한다. -> 인라인뷰 활용
SELECT year,avg(height)
FROM(
    SELECT substr(jumin,1,2) year,height
    FROM student
)
GROUP BY year;

-- 같은 지역별 키의 평균을 구한다.
SELECT region,trunc(avg(height),1)
FROM(
    SELECT substr(tel,1,instr(tel,')')-1) region,height
    FROM student
)
GROUP BY region;

-- gogak 테이블을 순서대로 5명씩 끊어서 포인트의 평균을 구해주세요.
SELECT 그룹,avg(point)
FROM(
    SELECT gname,point,rownum,ceil((rownum/5)) as 그룹 
    FROM(
        SELECT gname,point,rownum 
        FROM gogak
    )data
)
GROUP BY 그룹;

-- GOGAK 테이블에서 짝수, 홀수로 그룹핑하여 포인트의 합을 구하시오.
SELECT 홀짝,sum(point)
FROM(
    SELECT gname,point,mod(rownum,2)+1 as 홀짝
    FROM(
        SELECT gname,point,rownum
        FROM gogak
    )
)
GROUP BY 홀짝;