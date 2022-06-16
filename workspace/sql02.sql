select * from test;
-- 레코드 추가
-- #1. 컬럼명 작성하여 추가
insert into test(id,pw,age,reg) VALUES('java','1234',10,sysdate);
commit; -- DB에 최종저장
insert into test(pw,id,age,reg) VALUES('java1','1234',10,sysdate);

-- #2. 컬럼명 생략하고 추가 -> 전체 컬럼에 해당하는 값들을 지정해줘야함
insert into test VALUES('java2','1234',10,sysdate);
-- 디폴트 설정과 상관없이 모든 값을 입력해야한다

-- #3. 원하는 컬럼만 데이터 추가 -- age와 reg는 default 걸어둔것이 적용됨
insert into test(id,pw) values('java3','1111');
insert into test(id,age) values ('java4',20); -- pw가 not null이라 실행오류 발생

insert into test values ('java4','1111',20,sysdate);
insert into test values('java5','9999',30,sysdate);
insert into test values('java6','1111',50,sysdate);
insert into test values('java7','1111',11,sysdate);
insert into test values('java8','1111',6,sysdate);

-- 레코드 수정 : UPDATE 테이블 SET 컬럼=값,...;
-- #1. 일괄 수정 : UPDATE 테이블 SET 컬럼=값,...;
update test set pw='0000';
commit;

-- #2. 특정 레코드 수정 : UPDATE 테이블 SET 컬럼=값, .... WHERE 조건;
-- id가 java인 사람의 pw를 1234fh 수정 : > >= < <= != =(같다)
update test set pw='1234' where id='java';
-- age가 10보다 큰 레코드의 pw를 '9999'로 수정
update test set pw='9999' where age>10;
-- age가 10보다 크거나 같고, 30이하인 레코드의 pw를 0102로 수정 : && => and , || => or
update test set pw='0102' where age >=10 and age<=30;

-- id가 java인 사람의 모든 정보를 검색
select * from test where id='java';
-- age가 10인 사람의 모든 정보를 검색
select * from test where age=10;

select * from test;

-- 레코드 삭제 : DELETE
-- #1. 특정 레코드 삭제
-- id가 '1234' 인 레코드 삭제
delete from test where id='1234';
commit;
-- pw가 '0000'인 레코드 삭제
delete from test where pw='0000';

-- #2. 일괄삭제
delete from test;

-- 컬럼 추가 : ALTER - ADD
alter table test add(name varchar2(50));
-- 컬럼 타입변경 : ALTER - MODIFY
alter table test modify(name number);
-- 컬럼 이름변경 : ALTER - RENAME
alter table test rename column name to nickname;
-- 컬럼 삭제 : ALTER - DROP
alter table test drop column nickname;

desc test;
select * from test;
commit;

-- ALIAS 별칭
select id 아이디, pw "비밀 번호", age 나이 , reg "가입 날짜"
from test;

select t.id, t.pw , t.age
from test t;

-- 산술연산자
select * from test;
select id,age, age+100 "100년뒤" from test;

-- 집계 함수
select * from emp;
-- count(기준컬럼명)
select count(*) from emp; -- 테이블 전체 레코드 갯수
select count(comm) from emp;  -- comm 컬럼의 데이터 갯수
-- emp 테이블에서 sal이 가장 큰 값는?
select max(sal) from emp;
select min(sal) from emp;
select avg(comm) from emp;
select sum(sal) from emp;

-- where 절
select * from emp
where sal != 1500;

-- EMP 테이블에서 부서번호가 10번인 사람의 사원번호, 이름을 검색
select empno, ename, deptno from emp where deptno = 10;
-- 이름이 SMITH인 사람 전체정보 검색 (이름 :대소문자구분)
select * from emp where ename='SMITH';
-- IN 연산자  (포함하는 값이 없으면 결과없음)
select * from emp where empno not in (7369,7900,7782,5000);
select */*모든컬럼*/ from emp where empno = 7369 or empno=7900 or empno= 7782 or empno=5000;

-- BETWEEN 연산자
-- SAL이 2450이상 3000이하만 전체 사원 정보 검색
select count(*) from emp where sal between 2450 and 3000;
select * from emp where sal >= 2450 and sal <= 3000;

-- LIKE 연산자(문자키워드 검색에 용이)
select * from emp where ename like 'SMITH'; -- ename = 'SMITH'
select * from emp where ename like 'S%';    -- ename이 'S'로 시작하는
select * from emp where ename like 'M%';    -- ename이 'M'로 시작하는
select * from emp where ename like '%H';    -- ename이 'H'로 끝나는
select * from emp where ename like '%A%';   -- 'A'가 포함된것
select * from emp where ename like '__A%';   -- '_'한개당 갯수 다음 문자가 A인것

-- IS NULL 연산자
select * from emp where comm is not null;

-- 정렬 ORDER BY
select * from emp order by sal; -- 오름차순 asc 생략
select *from emp order by sal desc; -- 내림 차순
select * from emp order by 6 desc; -- 컬럼명대신 컬럼번호로 기준잡기 (6번째 컬럼 sal)

    -- 이름 정렬
select * from emp where sal>2000 order by sal desc;
select * from emp order by ename;
select * from emp order by hiredate ; -- 입사일 빠른순 오름차순



select * from emp;

--SQL 함수

-- 문자함수
-- LOWER(),UPPER()- 소문자화, 대문자화
select ename, lower(ename),job, LOWER(job) from emp;

-- CONCAT() - 문자 연결
select ename ,job,concat (ename, job)"concat" from emp;

--SUBSTR() -- 문자의 idx 부터 갯수만큼 추출
select substr ('abcde',3,2) from dual;  --dual(=가상테이블)

-- LPAD(), RPAD()
select LPAD(ename,10,'*') from emp;
select RPAD(ename,10,'*') from emp;


-- 숫자함수
-- ROUND() -자리에서 반올림
select round(123.456,2), round(123.456,0), round(123.456,-1)
from dual;
-- TRUNC() -자리에서 버리기
select trunc(987.987,2), trunc(987.987,0),trunc(987.987,-1)
from dual;
-- MOD() 100%3
select mod(100,3) from dual;
-- 올림 , 내림 , 제곱
select ceil (123.55), floor(123.456), power(2,4)
from dual;