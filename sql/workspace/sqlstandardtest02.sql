--<<1>> EMP와 DEPT TABLE을 JOIN하여 부서번호, 부서명, 이름, 급여를 출력하라.
select d.deptno , d.dname , e.ename , e.sal from emp e , dept d where d.deptno = e.deptno;

--<<2>> 이름이 'ALLEN'인 사원의 부서명을 출력하라.
select d.dname from emp e , dept d 
where e.deptno=d.deptno 
and e.ename='ALLEN';

--<<3>> EMP Table의 데이터를 출력하되 해당사원에대한 상관번호와 상관의성명을 함께 출력하라. 
create table emp2 as select * from emp ;

select a.ename , a.mgr ,b.empno, b.ename 
from emp a , emp2 b 
where a.mgr=b.empno;

drop table emp2 ;
commit;

--<<4>> DEPT Table 에는 존재하는 부서코드이지만 해당부서에 근무하는 사람이 존재하지 않는 경우의 결과를 출력하라.
select dname from dept where deptno not in 
(select deptno from emp group by deptno having count(deptno)>0);

--<<5>> 'ALLEN'의 직무와 같은사람의 이름, 부서명, 급여, 직무를 출력하라.
select ename , dname , sal , job from emp where job=(select job from emp where ename='ALLEN');

--<<6>> 'JONES'가 속해있는 부서의 모든사람의 사원번호, 이름, 입사일자, 급여를 출력하라. 
select empno, ename, hiredate, sal from emp where dname=(select dname from emp where ename='JONES');

--<<7>> 전체 사원의 평균임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하라.]
select e.empno,e.ename, d.dname ,e.hiredate ,d.loc ,e.sal
from emp e ,dept d 
where d.deptno=e.deptno and
e.sal >(select round(avg(sal),2) from emp);

--<<8>> 10번 부서사람들중에서 20번부서의 사원과 같은 업무를 하는 사원의 사원번호, 이름, 부서명, 입사일, 지역을 출력하라.
select e.empno, e.ename, d.dname, e.hiredate,d.loc ,e.deptno
from emp e,dept d 
where d.deptno=e.deptno and
e.deptno=10 and job in (select job from emp where deptno=20);

--<<9>> 10번 부서중에서 30번부서에는 없는 업무를 하는 사원의 사원번호, 이름, 부서명, 입사일자, 지역을 출력하라.
select e.empno, e.ename, d.dname, e.hiredate,d.loc ,e.deptno
from emp e,dept d 
where d.deptno=e.deptno and
e.deptno=10 and job not in (select job from emp where deptno=30);

--<<10>> 10번 부서에 근무하는 사원의 사원번호, 이름, 부서명, 지역, 급여를 급여가 많은순으로 출력하라.
select e.empno, e.ename, d.dname, d.loc, e.sal from emp e , dept d 
where e.deptno=d.deptno 
and e.deptno=10 order by e.sal desc;

--<<11>> 'MARTIN'이나 'SCOTT'의 급여와 같은 사원의 사원번호, 이름, 급여를 출력하라.
select empno, ename , sal from emp where 
sal=(select sal from emp where ename='MARTIN')
or sal = (select sal from emp where ename='SCOTT');
-- 같은것
select empno, ename , sal from emp where 
sal in (select sal from emp where ename in ('SCOTT', 'MARTIN'));

select sal from emp where ename='MARTIN';
select sal from emp where ename='SCOTT';

--<<12>> 급여가 30번 부서의 최고 급여 보다 높은사원의 사원번호, 이름, 급여를 출력하라.
select empno, ename , sal from emp where sal>(select max(sal)from emp where deptno=30);
select max(sal)from emp where deptno=30;

--<<13>> 급여가 30번 부서의 최저급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select empno, ename , sal from emp where sal>(select min(sal)from emp where deptno=30);
select min(sal)from emp where deptno=30;