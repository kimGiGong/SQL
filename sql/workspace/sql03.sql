select * from test;

-- 서브쿼리
select * from (select empno,ename, job,sal  
    from emp) 
    /* 첫번째 select에서는 괄호 안이 테이블이다 따라서 sal이 없으면 에러남*/
where sal>3000;

-- 사원번호 7900의 직무와 같은 직무를 갖고있는 사람의 이름과 직무를 출력
select ename job from emp where job = (select job from emp where empno=7900);

select * from emp;  --사원 정보 테이블 
select * from dept; -- 부서 정보 테이블

-- Join
select * from emp e, dept d
where e.deptno = d.deptno;

-- emp,dept 테이블을 이용하여, 모든 사원번호, 사원이름, 부서이름을 출력.
select e.empno ,e.ename ,d.dname
from emp e, dept d 
where e.deptno = d.deptno;

-- Group by 
select deptno "부서번호",count(*)"사원수" from emp 
group by deptno
order by 2 desc;    -- 사원수 많은 순

select * from emp;

select job "직무", count(*) "사원수", round (avg(sal),2)"평균급여",max(sal)"최고 급여" 
,min(sal)"최소급여", sum(sal)"급여합계"from emp
group by job;



-- HAVING
-- 부서별 사원수가 5명 이상인 부서 번호와 사원수 출력
select deptno "부서번호",count(*)"사원수" from emp 
group by deptno
having count(*) >=5;    

-- 직무별 전체월급이 5000을 초과하는 직무와 급여합계를 조회
-- 단, SALESMAN 제외, 급여 합계기준 내림차순으로
select job, sum(sal)
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sum(sal) desc;


-- 시퀀스 생성 : 테이블명_seq, seq_테이블명
create sequence test_seq nocache;
-- 시퀀스 번호표 하나 뽑아서 출력
select test_seq.nextval from dual; -- 다음번호 뽑기
select test_seq.currval from dual; -- 현재사용된 번호 상태
-- test 테이블
select * from test;
insert into test values('java10', '1234', test_seq.nextval, sysdate, null);
commit;

-- 시퀀스 삭제
drop  sequence test_seq;
commit;
