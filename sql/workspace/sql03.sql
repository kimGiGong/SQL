select * from test;

-- ��������
select * from (select empno,ename, job,sal  
    from emp) 
    /* ù��° select������ ��ȣ ���� ���̺��̴� ���� sal�� ������ ������*/
where sal>3000;

-- �����ȣ 7900�� ������ ���� ������ �����ִ� ����� �̸��� ������ ���
select ename job from emp where job = (select job from emp where empno=7900);

select * from emp;  --��� ���� ���̺� 
select * from dept; -- �μ� ���� ���̺�

-- Join
select * from emp e, dept d
where e.deptno = d.deptno;

-- emp,dept ���̺��� �̿��Ͽ�, ��� �����ȣ, ����̸�, �μ��̸��� ���.
select e.empno ,e.ename ,d.dname
from emp e, dept d 
where e.deptno = d.deptno;

-- Group by 
select deptno "�μ���ȣ",count(*)"�����" from emp 
group by deptno
order by 2 desc;    -- ����� ���� ��

select * from emp;

select job "����", count(*) "�����", round (avg(sal),2)"��ձ޿�",max(sal)"�ְ� �޿�" 
,min(sal)"�ּұ޿�", sum(sal)"�޿��հ�"from emp
group by job;



-- HAVING
-- �μ��� ������� 5�� �̻��� �μ� ��ȣ�� ����� ���
select deptno "�μ���ȣ",count(*)"�����" from emp 
group by deptno
having count(*) >=5;    

-- ������ ��ü������ 5000�� �ʰ��ϴ� ������ �޿��հ踦 ��ȸ
-- ��, SALESMAN ����, �޿� �հ���� ������������
select job, sum(sal)
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sum(sal) desc;


-- ������ ���� : ���̺��_seq, seq_���̺��
create sequence test_seq nocache;
-- ������ ��ȣǥ �ϳ� �̾Ƽ� ���
select test_seq.nextval from dual; -- ������ȣ �̱�
select test_seq.currval from dual; -- ������� ��ȣ ����
-- test ���̺�
select * from test;
insert into test values('java10', '1234', test_seq.nextval, sysdate, null);
commit;

-- ������ ����
drop  sequence test_seq;
commit;
