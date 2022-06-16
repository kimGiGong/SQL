-- 주석
-- 테이블 생성
-- creat table 테이블명 (컬럼명 타입 옵션, 컬럼명 타입 옵션,....);
create table test( -- test 테이블
    id varchar2(50) primary key,    -- column들
    pw varchar2(50) not null,
    age number default 1,
    reg date default sysdate
);  
-- 실행 명령 : ctrl+Enter (커서 위치중요)
-- sysdate : 현재시스템시간 명령어
-- NULLABLE : null 입력 가능여부

-- 테이블 정보 확인 : desc(description(설명)) 테이블명;
desc test;
-- 사용자가 소유한 모든 테이블 조회
select table_name from user_tables;

-- ** SELECT **

-- #1. 전체 레코드 조회 ( 테이블에 저장된 전체컬럼 + 전체레코드 조회 ) : select * from 테이블명;
select * from test;
select * from dept;
select * from salgrade;
select * from emp;  -- 사원내역
-- #2. 특정 컬럼의 레코드 조회 : emp 테이블에서 empno(no=number), ename, deptno 컬럼만 조회
select empno, ename,deptno from emp;
-- #3. 컬럼+표현식 레코드 조회 -- SMITH's job : CLERK
select ename, '''s job : ', job from emp; -- 문자열='문자열' 홑따옴표=''
-- #4. 연결 연산자 : ||
select ename || '''s job : ' || job from emp;
-- #5. 컬럼에 별칭 달아서 조회 
select ename || '''s job : ' || job "Hello SQL" from emp;
select ename || '''s job : ' || job Hello from emp;
-- '' : 문자열 테이터
-- "" : 별칭 (기호나 띄어쓰기가 별칭에 속하면 묶고, 기호없는 한 단어일 경우에는 겹따옴표 생략가능)

select empno "사원번호",ename "사원이름" from emp;

-- #6. ALL/ DISTINCT
select all deptno from emp; -- ALL= defualt (생략가능) 그래서 값이 같다
select distinct deptno,ename from emp; -- 중복 제거 + (해당되는 컬럼전체를 기준으로 중복제거)















