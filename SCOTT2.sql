SELECT substr(tel,1,instr(tel,')')-1),tel FROM student;

SELECT tel, substr(tel,1,instr(tel,')')+1)  FROM student;
SELECT tel, substr(tel,1,instr(tel,'-')-1) FROM student;
SELECT tel, substr(tel, instr(tel,')')+1, instr(tel,'-')-instr(tel,')')-1) as 가운데자리
FROM student;

-- 숫자 관련 함수
SELECT avg(sal) FROM emp;

-- ROUND 5부터 반올림 됨. 두번째 인수는 소수점 몇자리까지 표현할 것인지
SELECT ROUND(987.654,2) FROM dual;

-- TRUNK 자리수까지만 표현하고 다 버림
SELECT TRUNC(987.654,2) FROM dual;

-- MOD 나머지 
SELECT MOD(6,4) FROM dual;

-- 날짜
-- sysdate(시스템의 시간 출력)
SELECT sysdate FROM dual;

SELECT * FROM emp;

SELECT ename, TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12) as 근속년도,
decode(TRUNC(MONTHS_BETWEEN(SYSDATE,hiredate)/12) , 40,'축하','없음') as "40주년"
FROM emp;

SELECT ADD_MONTHS(sysdate, 3) FROM dual;

SELECT last_day(sysdate) FROM dual;

-- 형변환 함수 to_number(), to_char(), to_date()
SELECT 2 + to_number('2') FROM dual;

SELECT to_date('2020/04/01') FROM dual;

-- YYYY MM DD hh mm ss
SELECT to_char(hiredate, 'YYYY-MM-DD hh:mm') as 년도  from emp;

-- 오라클에서만 : DAY 요일을 알려준다
SELECT to_char(hiredate, 'DAY') as 년도  from emp;

SELECT to_char(1530, '$9999') FROM dual;
SELECT to_char(1530, '$9,999') FROM dual;

SELECT to_char(sal, '$9,999,999') FROM emp;

-- 실습
SELECT name,tel, substr(tel,1,4) || '***' || substr(tel,instr(tel,'-'),5) as REPLACE 
FROM student
WHERE deptno1 = 102;

SELECT name,tel,substr(tel,1,instr(tel,'-')) || '****' as REPLACE
FROM student
WHERE deptno1 = 101;

SELECT ename, substr(ename,1,1) || '--' || substr(ename,4,Length(ename))
FROM emp
WHERE deptno = 20;

SELECT name,jumin,substr(jumin,1,6) || '-/-/-/-'
FROM student
WHERE deptno1 = 101;

-- 1
SELECT empno,ename,sal 
FROM emp 
WHERE deptno = 10;

-- 2
SELECT ename,to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE,deptno 
FROM emp 
WHERE empno = 7369;

-- 3
SELECT empno,ename,job,mgr,to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE,sal,comm,deptno 
FROM emp 
WHERE ename = 'ALLEN';

-- 4
SELECT ename,deptno,sal 
FROM emp 
WHERE HIREDATE = '1980/12/17';

-- 5
SELECT empno, ename, job, mgr, to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE , sal, comm, deptno  
FROM emp 
WHERE job != 'MANAGER';

-- 6
SELECT empno, ename, job, mgr, to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE , sal, comm, deptno  
FROM emp
WHERE HIREDATE >= '1981/04/02';

-- 7
SELECT ename,sal,deptno  
FROM emp
WHERE sal >= 800;

-- 8
SELECT empno, ename, job, mgr, to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE , sal, comm, deptno   
FROM emp
WHERE deptno >= 20;

-- 9
SELECT empno, ename, job, mgr, to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE , sal, comm, deptno   
FROM emp
WHERE hiredate <= '1981/12/09';

-- 10
SELECT empno,ename
FROM emp
WHERE empno <= 7698;

-- 11
SELECT ename,sal,deptno
FROM emp
WHERE hiredate BETWEEN '1981/04/03' AND '1982/12/08' ;

-- 12
SELECT ename,job,sal
FROM emp
WHERE sal BETWEEN 1601 AND 2999 ;

-- 13
SELECT empno, ename, job, mgr, to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE , sal, comm, deptno   
FROM emp
WHERE empno BETWEEN 7655 AND 7781 ;

-- 14
SELECT empno, ename, job, mgr, to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE , sal, comm, deptno   
FROM emp
WHERE ename BETWEEN 'C' AND 'I' ;

-- 15
SELECT empno, ename, job, mgr, to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE , sal, comm, deptno   
FROM emp
WHERE substr(hiredate,1,2) != '81' ;

-- 16
SELECT empno, ename, job, mgr, to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE , sal, comm, deptno   
FROM emp
WHERE job IN('MANAGER','SALESMAN') ;

-- 17
SELECT empno, ename, deptno   
FROM emp
WHERE deptno != 20 AND deptno != 30 ;

-- 18
SELECT empno, ename,to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE, deptno   
FROM emp
WHERE ename Like 'S%' ;

-- 19
SELECT empno, ename, job, mgr, to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE , sal, comm, deptno   
FROM emp
WHERE substr(hiredate,1,2) = '81' ;

-- 20
SELECT empno, ename, job, mgr, to_char(hiredate,'YYYY-MM-DD hh:mm:ss') as HIREDATE , sal, comm, deptno   
FROM emp
WHERE ename Like '%S%' ;