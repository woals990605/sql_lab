SELECT *
FROM emp;

SELECT *
FROM student
WHERE jumin Like '__12%';

-- 아무것도 아닌 연습테이블(dual)
-- 유효성 검사 시에 사용한다.
SELECT LOWER('Ssar')
FROM dual;

-- 길이 4 = 4자
-- length는 글자수 / lengthb는 바이트크기
SELECT length('ABCD')
FROM dual;


SELECT length('가나다라')
FROM dual;
-- 영어 1Byte (UTF-8)
SELECT lengthb('ABCD')
FROM dual;
-- 한글 3Byte (UTF-8)
SELECT lengthb('가나다라')
FROM dual;

-- 앞에 인수는 인덱스번호(시작번호는 1), 두번째 인수는 개수
SELECT substr('가나다라',1,2)
FROM dual;

SELECT name,substr(jumin,1,7) || '******' 
FROM STUDENT;

SELECT name,substr(jumin,1,6) ||'-'|| substr(jumin,7,1) || '******' 
FROM STUDENT;
-- 지역번호 추출하기
SELECT '-)$' from dual;
SELECT instr('-)$', '$') FROM dual;
SELECT instr(tel, ')')-1 FROM student;

SELECT substr(tel,1,instr(tel,')')-1), tel
FROM STUDENT;
