--<< 1 >> �μ���ȣ�� 10���� �μ��� ����� �����ȣ, �̸�, �޿��� ����϶�.
select deptno, ename, sal from emp where deptno=10;

--<<2>>  �����ȣ�� 7369�� ��� �� �̸�, �Ի�����, �μ���ȣ�� ����϶�.
select ename, hiredate,deptno from emp where empno=7369;

--<<3>>  �̸��� ALLEN�� ����� ��� ������ ����϶�.
 select * from emp where ename='ALLEN';
 
 --<<4>>  �Ի����ڰ� 1981-02-20�� ����� �̸�, �μ���ȣ, �޿��� ����϶�.
 select ename, deptno,sal from emp where hiredate='1981-02-20';
 
 --<<5>>  ������ MANAGER�� �ƴ� ����� ��������� ����϶�.
 select * from emp where job !='MANAGER';
 
 --<<6>>  �Ի����ڰ� 1981-04-02 ���Ŀ� �Ի��� ����� ������ ����϶�.
 select * from emp where hiredate > '1981-04-02';
 
 --<<7>>  �޿��� $800�̻��� ����� �̸�, �޿�, �μ���ȣ�� ����϶�.
 select ename, sal,deptno from emp where sal>=800;

--<<8>>  �μ���ȣ�� 20���̻��� ����� ��������� ����϶�.
select * from emp where deptno >= 20;

--<<9>>  ������ K�� �����ϴ� ������� ���� �̸��� ���� ����� ��������� ����϶�.
select * from emp where ename>'K%';

--<<10>>  �Ի����ڰ� 1981-12-09 ���� ���� �Ի��� ������� ��������� ����϶�.
select *from emp where hiredate<='1981-12-09';

--<<11>>  �����ȣ�� 7698 ���� �۰ų� ���� ������� �����ȣ�� �̸��� ����϶�.
select empno,ename from emp where empno <= 7698;

--<<12>>  �Ի����ڰ� 1981-04-02 ���� �ʰ� 1982-12-09 ���� ���� ����� �̸�, ����, �μ���ȣ�� ����϶�.
select ename, sal, deptno from emp where hiredate>'1981-04-02' and hiredate <'1982-12-09';

--<<13>>  �޿��� 1,600 ���� ũ�� 3,000���� ���� ����� �̸�, ����, �޿��� ����϶�.
select ename, job , sal from emp where sal >1600 and sal < 3000;

--<<14>>  �����ȣ�� 7654�� 7782 ���� �̿��� ����� ��������� ����϶�.
select * from emp where empno not between 7654 and 7782;

--<<15>>  �̸��� B�� J ������ ��� ����� ������ ����϶�. between �ι�°�� �����԰�����?
select * from emp where ename between 'B%' and 'K%'; 

--<<16>>  �Ի����ڰ� 81�� �̿ܿ� �Ի��� ����� ��������� ����϶�.
select * from emp where hiredate not BETWEEN '81-01-01' and '81-12-31' ;

--<<17>>  ������ MANAGER�� SALESMAN�� ����� ��������� ����϶�.
select * from emp where job='MANAGER' or job='SALESMAN';

--<<18>>  �μ���ȣ�� 20,30���� ������ ������� �̸�, �����ȣ, �μ���ȣ�� ����϶�.
select * from emp where not deptno=20 and not deptno=30;

--<<19>>  �̸��� S�� �����ϴ� ����� �����ȣ, �̸�, �Ի�����, �μ���ȣ�� ����϶�.
select empno, ename, hiredate, deptno from emp where ename like 'S%';

--<<20>>  �Ի����ڰ� 81�⵵�� ����� ��������� ����϶�.
select * from emp where hiredate like '%81%';

--<<21>>  �̸��� S�ڰ� ���ִ� ����� ��������� ����϶�
select *from emp where ename like'%S%';

--<<22>>  �̸��� S�� �����ϰ� ���������ڰ� T�λ���� ��������� ����϶� (��, �̸�����ü 5�ڸ��̴�.>>
select * from emp where ename like 'S%T';

--<<23>>  �̸��� ù��° ���ڴ� ������� �ι�° ���ڰ� A�� ����� ������ ����϶�.
select * from emp where ename like '_A%';

--<<24>>  Ŀ�̼��� NULL�� ����� ������ ����϶�.
select * from emp where comm is null;

--<<25>>  Ŀ�̼��� NULL�� �ƴ� ����� ��������� ����϶�.
select * from emp where comm is not null;

--<<26>>  �μ��� 30�� �μ��̰� �޿��� $1,500 �̻��� ����� �̸�, �μ�, ������ ����϶�.
select ename ,deptno, sal from emp where sal >=1500 and deptno =30;

--<<27>>  �̸��� ù���ڰ� K�ν����ϰų� �μ���ȣ�� 30�λ���� �����ȣ, �̸�, �μ���ȣ�� ����϶�.
select empno, ename, deptno from emp where ename like 'K%' or deptno=30;

--<<28>>  �޿��� $1,500�̻��̰� �μ���ȣ�� 30���� ����� ������ MANAGER�� ����� ������ ����϶�.
select * from emp where sal>=1500 and deptno=30 and job='MANAGER';

--<<29>>  �μ���ȣ�� 30�� ����� �����ȣ�� SORT �϶�.
select empno from emp where deptno=30 order by deptno asc;

--<<30>>  �޿��� ���������� SORT�϶�.
select sal from emp order by sal desc;

--<<31>>  �μ���ȣ�� ASCENDING SORT�� �� �޿��� ���� ��������� ����϶�.
select deptno, sal from emp order by deptno asc , sal desc;

--<<32>>  �μ���ȣ�� DESCENDING SORT�ϰ� �̸������� ASCENDING SORT, �޿������� DESCENDING SORT�϶�.
select deptno ,ename, sal from emp order by deptno desc , ename asc , sal desc;

