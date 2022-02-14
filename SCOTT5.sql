--PIVOT 별 5개(오라클만 있음)

SELECT * FROM cal;

SELECT week, 
1 일,
2 월,
3 수,
4 목,
5 금,
6 토,
7 일
FROM cal
GROUP BY week
ORDER BY week;

SELECT
week,
DECODE(day,'일',num_day),
DECODE(day,'월',num_day),
DECODE(day,'화',num_day),
DECODE(day,'수',num_day),
DECODE(day,'목',num_day),
DECODE(day,'금',num_day),
DECODE(day,'토',num_day)
FROM cal;

SELECT
week,
sum(DECODE(day,'일',num_day)) 일,
sum(DECODE(day,'월',num_day)) 월,
sum(DECODE(day,'화',num_day)) 화,
sum(DECODE(day,'수',num_day)) 수,
sum(DECODE(day,'목',num_day)) 목,
sum(DECODE(day,'금',num_day)) 금,
sum(DECODE(day,'토',num_day)) 토
FROM cal
GROUP BY week
ORDER BY week;

SELECT 
sum(DECODE(job, 'MANAGER', sal)) MANAGER,
sum(DECODE(job, 'ANALYST', sal)) ANALYST,
sum(DECODE(job, 'CLERK', sal)) CLERK,
sum(DECODE(job, 'SALESMAN', sal)) SALESMAN,
sum(DECODE(job, 'PRESIDENT', sal)) PRESIDENT
FROM emp;

SELECT *
FROM emp;

SELECT job,sal
FROM emp;

SELECT day
FROM cal
GROUP BY day;

SELECT *
FROM cal
PIVOT (sum(num_day) for day in ('일','월','화','수','목','금','토'))
ORDER BY week;

SELECT *
FROM (SELECT job,sal FROM emp)
PIVOT (sum(sal) for job in ('MANAGER','ANALYST','CLERK','SALESMAN','PRESIDENT'));

SELECT 
avg(decode(deptno,10,sal)),
avg(decode(deptno,20,sal)),
avg(decode(deptno,30,sal))
FROM emp;

SELECT *
FROM (SELECT deptno,sal FROM emp)
PIVOT (avg(sal) for deptno in (10,20,30));

-- PROFESSOR 테이블에서 POSITION 별 평균 PAY를 구하시오.
SELECT *
FROM professor;

SELECT position, avg(pay) 평균임금 
FROM professor
GROUP BY position;

SELECT 
avg(decode(position,'정교수',pay)) 정교수,
avg(decode(position,'전임강사',pay)) 전임강사,
avg(decode(position,'조교수',pay)) 조교수
FROM professor;

SELECT *
FROM (SELECT position,pay FROM professor)
PIVOT (avg(pay) for position in ('정교수','전임강사','조교수'));