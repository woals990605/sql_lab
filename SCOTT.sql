-- 1. distinct 중복제거
SELECT DISTINCT deptno
FROM emp;

SELECT DISTINCT job
FROM emp;

-- 2. 결합 연산자 ||
SELECT '나의 이름은' || ename FROM emp;

-- 3. 별칭
SELECT '나의 이름은' || ename as "자기소개" FROM emp;
SELECT '나의 이름은' || ename 자기소개 FROM emp;
SELECT sal*12 연봉 FROM emp;

-- 4. NVL null값 변경하기 (DB는 null이 들어가 있으면 연산이 안된다)
SELECT ename, sal+nvl(comm,0) as "월급"
FROM emp;

-- 5. decode (조건문)
SELECT decode(comm, null, 0, comm) as "보너스"
FROM emp;

--SELECT name || '"s ID : ' as "ID AND WEIGHT"

SELECT ename || '(' ||job || '),' || ename || '''' || job ||'''' as "NAME AND JOB"
FROM emp;