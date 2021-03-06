--<< 1 >> 부서번호가 10번인 부서의 사람중 사원번호, 이름, 급여를 출력하라.
select empno, ename, sal from emp where deptno=10;

--<<2>>  사원번호가 7369인 사람 중 이름, 입사일자, 부서번호를 출력하라.
select ename, hiredate,deptno from emp where empno=7369;

--<<3>>  이름이 ALLEN인 사람의 모든 정보를 출력하라.
 select * from emp where ename='ALLEN';
 
 --<<4>>  입사일자가 1981-02-20인 사원의 이름, 부서번호, 급여를 출력하라.
 select ename, deptno,sal from emp where hiredate='1981-02-20';
 
 --<<5>>  직업이 MANAGER가 아닌 사람의 모든정보를 출력하라.
 select * from emp where job !='MANAGER';
 
 --<<6>>  입사일자가 1981-04-02 이후에 입사한 사원의 정보를 출력하라.
 select * from emp where hiredate > '1981-04-02';
 
 --<<7>>  급여가 $800이상인 사람의 이름, 급여, 부서번호를 출력하라.
 select ename, sal,deptno from emp where sal>=800;

--<<8>>  부서번호가 20번이상인 사원의 모든정보를 출력하라.
select * from emp where deptno >= 20;

--<<9>>  성명이 K로 시작하는 사람보다 높은 이름을 가진 사람의 모든정보를 출력하라.
select * from emp where ename >='L';

--<<10>>  입사일자가 1981-12-09 보다 먼저 입사한 사람들의 모든정보를 출력하라.
select *from emp where hiredate<'1981-12-09';

--<<11>>  사원번호가 7698 보다 작거나 같은 사람들의 사원번호와 이름을 출력하라.
select empno,ename from emp where empno <= 7698;

--<<12>>  입사일자가 1981-04-02 보다 늦고 1982-12-09 보다 빠른 사원의 이름, 월급, 부서번호를 출력하라.
select ename, sal, deptno from emp where hiredate>'1981-04-02' and hiredate <'1982-12-09';

--<<13>>  급여가 1,600 보다 크고 3,000보다 작은 사람의 이름, 직무, 급여를 출력하라.
select ename, job , sal from emp where sal >1600 and sal < 3000;

--<<14>>  사원번호가 7654와 7782 사이 이외의 사원의 모든정보를 출력하라.
select * from emp where empno not between 7654 and 7782;

--<<15>>  이름이 B와 J 사이의 모든 사원의 정보를 출력하라. between 두번째거 미포함같은데?
select * from emp where ename between 'B' and 'K';  
--JONES 에서 O때문에 J보다 크다고 생각되어 출력되지 않음 따라서 K까지--

--<<16>>  입사일자가 81년 이외에 입사한 사람의 모든정보를 출력하라.
select * from emp where hiredate not BETWEEN '81-01-01' and '81-12-31' ;
select * from emp where to_char(hiredate,'YY')!='81';

--<<17>>  직무가 MANAGER와 SALESMAN인 사람의 모든정보를 출력하라.
select * from emp where job='MANAGER' or job='SALESMAN';
select * from emp where job in ('MANAGER','SALESMAN');

--<<18>>  부서번호가 20,30번을 제외한 모든사람의 이름, 사원번호, 부서번호를 출력하라.
select * from emp where not deptno=20 and not deptno=30;
select * from emp where deptno not in (20,30);

--<<19>>  이름이 S로 시작하는 사원의 사원번호, 이름, 입사일자, 부서번호를 출력하라.
select empno, ename, hiredate, deptno from emp where ename like 'S%';

--<<20>>  입사일자가 81년도인 사람의 모든정보를 출력하라.----------------------------------
select * from emp where to_char(hiredate,'YY') = '81';

--<<21>>  이름중 S자가 들어가있는 사람만 모든정보를 출력하라
select *from emp where ename like'%S%';

--<<22>>  이름이 S로 시작하고 마지막글자가 T인사람의 모든정보를 출력하라 (단, 이름은전체 5자리이다.>>
select * from emp where ename like 'S%T';
select * from emp where ename like 'S%' and ename like '%T';
select * from emp where ename like 'S___T';

--<<23>>  이름이 첫번째 문자는 관계없고 두번째 문자가 A인 사람의 정보를 출력하라.
select * from emp where ename like '_A%';

--<<24>>  커미션이 NULL인 사람의 정보를 출력하라.
select * from emp where comm is null;

--<<25>>  커미션이 NULL이 아닌 사람의 모든정보를 출력하라.
select * from emp where comm is not null;

--<<26>>  부서가 30번 부서이고 급여가 $1,500 이상인 사람의 이름, 부서, 월급을 출력하라.
alter table emp add(danme varchar(50));
update emp set dname='accounting' where deptno=10;
update emp set dname='research' where deptno=20;
update emp set dname='sales' where deptno=30;
select ename ,dname, sal from emp where sal >=1500 and deptno =30;

--<<27>>  이름의 첫글자가 K로시작하거나 부서번호가 30인사람의 사원번호, 이름, 부서번호를 출력하라.
select empno, ename, deptno from emp where ename like 'K%' or deptno=30;

--<<28>>  급여가 $1,500이상이고 부서번호가 30번인 사원중 직업이 MANAGER인 사람의 정보를 출력하라.
select * from emp where sal>=1500 and deptno=30 and job='MANAGER';

--<<29>>  부서번호가 30인 사람중 사원번호를 SORT 하라.
select empno from emp where deptno=30 order by deptno asc;

--<<30>>  급여가 많은순으로 SORT하라.
select sal from emp order by sal desc;

--<<31>>  부서번호로 ASCENDING SORT한 후 급여가 많은 사람순으로 출력하라.
select deptno, sal from emp order by deptno asc , sal desc;

--<<32>>  부서번호로 DESCENDING SORT하고 이름순으로 ASCENDING SORT, 급여순으로 DESCENDING SORT하라.
select deptno ,ename, sal from emp order by deptno ,sal desc , ename asc ;

