--<<1>> EMP�� DEPT TABLE�� JOIN�Ͽ� �μ���ȣ, �μ���, �̸�, �޿��� ����϶�.
select d.deptno , d.dname , e.ename , e.sal from emp e , dept d where d.deptno = e.deptno;

--<<2>> �̸��� 'ALLEN'�� ����� �μ����� ����϶�.
select d.dname from emp e , dept d 
where e.deptno=d.deptno 
and e.ename='ALLEN';

--<<3>> EMP Table�� �����͸� ����ϵ� �ش��������� �����ȣ�� ����Ǽ����� �Բ� ����϶�. 
create table emp2 as select * from emp ;

select a.ename , a.mgr ,b.empno, b.ename 
from emp a , emp2 b 
where a.mgr=b.empno;

drop table emp2 ;
commit;

--<<4>> DEPT Table ���� �����ϴ� �μ��ڵ������� �ش�μ��� �ٹ��ϴ� ����� �������� �ʴ� ����� ����� ����϶�.
select dname from dept where deptno not in 
(select deptno from emp group by deptno having count(deptno)>0);

--<<5>> 'ALLEN'�� ������ ��������� �̸�, �μ���, �޿�, ������ ����϶�.
select ename , dname , sal , job from emp where job=(select job from emp where ename='ALLEN');

--<<6>> 'JONES'�� �����ִ� �μ��� ������� �����ȣ, �̸�, �Ի�����, �޿��� ����϶�. 
select empno, ename, hiredate, sal from emp where dname=(select dname from emp where ename='JONES');

--<<7>> ��ü ����� ����ӱݺ��� ���� ����� �����ȣ, �̸�, �μ���, �Ի���, ����, �޿��� ����϶�.]
select e.empno,e.ename, d.dname ,e.hiredate ,d.loc ,e.sal
from emp e ,dept d 
where d.deptno=e.deptno and
e.sal >(select round(avg(sal),2) from emp);

--<<8>> 10�� �μ�������߿��� 20���μ��� ����� ���� ������ �ϴ� ����� �����ȣ, �̸�, �μ���, �Ի���, ������ ����϶�.
select e.empno, e.ename, d.dname, e.hiredate,d.loc ,e.deptno
from emp e,dept d 
where d.deptno=e.deptno and
e.deptno=10 and job in (select job from emp where deptno=20);

--<<9>> 10�� �μ��߿��� 30���μ����� ���� ������ �ϴ� ����� �����ȣ, �̸�, �μ���, �Ի�����, ������ ����϶�.
select e.empno, e.ename, d.dname, e.hiredate,d.loc ,e.deptno
from emp e,dept d 
where d.deptno=e.deptno and
e.deptno=10 and job not in (select job from emp where deptno=30);

--<<10>> 10�� �μ��� �ٹ��ϴ� ����� �����ȣ, �̸�, �μ���, ����, �޿��� �޿��� ���������� ����϶�.
select e.empno, e.ename, d.dname, d.loc, e.sal from emp e , dept d 
where e.deptno=d.deptno 
and e.deptno=10 order by e.sal desc;

--<<11>> 'MARTIN'�̳� 'SCOTT'�� �޿��� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select empno, ename , sal from emp where 
sal=(select sal from emp where ename='MARTIN')
or sal = (select sal from emp where ename='SCOTT');
-- ������
select empno, ename , sal from emp where 
sal in (select sal from emp where ename in ('SCOTT', 'MARTIN'));

select sal from emp where ename='MARTIN';
select sal from emp where ename='SCOTT';

--<<12>> �޿��� 30�� �μ��� �ְ� �޿� ���� ��������� �����ȣ, �̸�, �޿��� ����϶�.
select empno, ename , sal from emp where sal>(select max(sal)from emp where deptno=30);
select max(sal)from emp where deptno=30;

--<<13>> �޿��� 30�� �μ��� �����޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select empno, ename , sal from emp where sal>(select min(sal)from emp where deptno=30);
select min(sal)from emp where deptno=30;