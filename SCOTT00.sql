-- 1. 데이터베이스는 테이블의 모임
-- 2. 테이블은 데이터의 모임
-- 3. 테이블은 행(레코드)과 열(프로젝션)을 가진다. (컬럼은 제목)
-- 4. 오라클을 설치하면 DBS(세팅)와 DBMS(설치)가 세팅된다.
-- 5. DBMS에 SQL을 전송하려면 SqlDevelop(툴)을 설치하면 좋다.
--    설치 안해도 되긴함. 버퍼 달아서 던지면 됨.
-- 6. 검색은 SELECT
-- 7. 검색을 위한 조건이 테이블을 퍼올려야 한다. (하드 -> 메모리) FROM
--     SELECT와 FROM은 키워드기 때문에 대문자로 쓴다.
-- 8. 스키마 보는 법 : DESC 테이블명
-- 9. 특정 레코드 보는 법(가로) : WHERE
-- 10. 문자는 홑따옴표로 감싸야 한다. 'MANAGER'
-- 11. FROM 1번 WHERE 2번 SELECT 3번
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp;

SELECT *
FROM emp;

SELECT deptno, dname, loc
FROM dept;

DESC dept;

SELECT *
FROM emp
WHERE sal = 800;

SELECT *
FROM emp
WHERE job = 'MANAGER';



-- WHERE 문법 : 행을 추려내는 기술

-- 1. = 같다
SELECT *
FROM emp
WHERE empno = 7900;

-- 2. < > <= >=크다, 작다
SELECT *
FROM emp
WHERE sal <= 3000;

-- 3. 문자열 검색
SELECT *
FROM emp
WHERE ename = 'SMITH';

-- 4. 부정 != 같지 않다. <> 같지 않다.
SELECT *
FROM emp
WHERE ename != 'SMITH';

-- 5. OR
SELECT *
FROM emp
WHERE job = 'MANAGER' OR job = 'CLERK';
SELECT *
FROM emp
WHERE job in ('MANAGER', 'CLERK');

-- 6. AND, BETWEEN
-- tip. 날짜(date타입) /, - 둘다 가능
SELECT hiredate
FROM emp
WHERE hiredate >= '1981/02/20' AND hiredate <= '1982/02/22';
SELECT hiredate
FROM emp
WHERE hiredate BETWEEN '1981/02/20' AND '1982/02/22';

-- 7. NULL 찾는 법
SELECT *
FROM emp
WHERE comm is null;
SELEcT *
FROM emp
WHERE comm is not null;

-- 8. 연산된 데이터를 찾는 법
SELECT sal*12 연봉
FROM emp
WHERE sal > 9000;

-- LIKE (검색)
SELECT *
FROM emp
WHERE ename LIKE 'S%';
SELECT *
FROM emp
WHERE ename LIKE '%M%';
SELECT *
FROM emp
WHERE ename LIKE '_M%';
SELECT *
FROM emp
WHERE ename LIKE '%H';
SELECT *
FROM emp
WHERE ename LIKE '__I%';

-- ORDER BY 정렬 (무조건 제일 마지막) ASC 오름차순(디폴트), DESC 내림차순
SELECT *
FROM emp
WHERE job = 'MANAGER'
ORDER BY ename ASC;

SELECT sal, ename, empno
FROM emp
ORDER BY sal DESC, ename ASC;

SELECT mod(sal, 500) as "나머지", ename
FROM emp
ORDER BY 1 DESC;

-- 그룹 연산자 max, count, min, sum, avg (프로젝션 연산)
SELECT max(sal) -- 단독으로만 사용 가능
FROM emp;

SELECT min(sal)
FROM emp;

SELECT sum(sal)
FROM emp;

SELECT avg(sal)
FROM emp;

SELECT count(sal)
FROM emp;

SELECT sum(sal)
FROM emp
WHERE job = 'MANAGER';

SELECT max(sal)
FROM emp
WHERE job = 'MANAGER';

-- UNION ALL (두개의 집합 더하기 - 조건 : 칼럼의 개수가 같아야 한다. 보통 null을 추가)
SELECT empno, ename, sal
FROM emp
WHERE job = 'SALESMAN'
UNION ALL
SELECT null, '합계', avg(sal)
FROM emp
WHERE job = 'SALESMAN';