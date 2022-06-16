select * from test;
-- ���ڵ� �߰�
-- #1. �÷��� �ۼ��Ͽ� �߰�
insert into test(id,pw,age,reg) VALUES('java','1234',10,sysdate);
commit; -- DB�� ��������
insert into test(pw,id,age,reg) VALUES('java1','1234',10,sysdate);

-- #2. �÷��� �����ϰ� �߰� -> ��ü �÷��� �ش��ϴ� ������ �����������
insert into test VALUES('java2','1234',10,sysdate);
-- ����Ʈ ������ ������� ��� ���� �Է��ؾ��Ѵ�

-- #3. ���ϴ� �÷��� ������ �߰� -- age�� reg�� default �ɾ�а��� �����
insert into test(id,pw) values('java3','1111');
insert into test(id,age) values ('java4',20); -- pw�� not null�̶� ������� �߻�

insert into test values ('java4','1111',20,sysdate);
insert into test values('java5','9999',30,sysdate);
insert into test values('java6','1111',50,sysdate);
insert into test values('java7','1111',11,sysdate);
insert into test values('java8','1111',6,sysdate);

-- ���ڵ� ���� : UPDATE ���̺� SET �÷�=��,...;
-- #1. �ϰ� ���� : UPDATE ���̺� SET �÷�=��,...;
update test set pw='0000';
commit;

-- #2. Ư�� ���ڵ� ���� : UPDATE ���̺� SET �÷�=��, .... WHERE ����;
-- id�� java�� ����� pw�� 1234fh ���� : > >= < <= != =(����)
update test set pw='1234' where id='java';
-- age�� 10���� ū ���ڵ��� pw�� '9999'�� ����
update test set pw='9999' where age>10;
-- age�� 10���� ũ�ų� ����, 30������ ���ڵ��� pw�� 0102�� ���� : && => and , || => or
update test set pw='0102' where age >=10 and age<=30;

-- id�� java�� ����� ��� ������ �˻�
select * from test where id='java';
-- age�� 10�� ����� ��� ������ �˻�
select * from test where age=10;

select * from test;

-- ���ڵ� ���� : DELETE
-- #1. Ư�� ���ڵ� ����
-- id�� '1234' �� ���ڵ� ����
delete from test where id='1234';
commit;
-- pw�� '0000'�� ���ڵ� ����
delete from test where pw='0000';

-- #2. �ϰ�����
delete from test;

-- �÷� �߰� : ALTER - ADD
alter table test add(name varchar2(50));
-- �÷� Ÿ�Ժ��� : ALTER - MODIFY
alter table test modify(name number);
-- �÷� �̸����� : ALTER - RENAME
alter table test rename column name to nickname;
-- �÷� ���� : ALTER - DROP
alter table test drop column nickname;

desc test;
select * from test;
commit;

-- ALIAS ��Ī
select id ���̵�, pw "��� ��ȣ", age ���� , reg "���� ��¥"
from test;

select t.id, t.pw , t.age
from test t;

-- ���������
select * from test;
select id,age, age+100 "100���" from test;

-- ���� �Լ�
select * from emp;
-- count(�����÷���)
select count(*) from emp; -- ���̺� ��ü ���ڵ� ����
select count(comm) from emp;  -- comm �÷��� ������ ����
-- emp ���̺��� sal�� ���� ū ����?
select max(sal) from emp;
select min(sal) from emp;
select avg(comm) from emp;
select sum(sal) from emp;

-- where ��
select * from emp
where sal != 1500;

-- EMP ���̺��� �μ���ȣ�� 10���� ����� �����ȣ, �̸��� �˻�
select empno, ename, deptno from emp where deptno = 10;
-- �̸��� SMITH�� ��� ��ü���� �˻� (�̸� :��ҹ��ڱ���)
select * from emp where ename='SMITH';
-- IN ������  (�����ϴ� ���� ������ �������)
select * from emp where empno not in (7369,7900,7782,5000);
select */*����÷�*/ from emp where empno = 7369 or empno=7900 or empno= 7782 or empno=5000;

-- BETWEEN ������
-- SAL�� 2450�̻� 3000���ϸ� ��ü ��� ���� �˻�
select count(*) from emp where sal between 2450 and 3000;
select * from emp where sal >= 2450 and sal <= 3000;

-- LIKE ������(����Ű���� �˻��� ����)
select * from emp where ename like 'SMITH'; -- ename = 'SMITH'
select * from emp where ename like 'S%';    -- ename�� 'S'�� �����ϴ�
select * from emp where ename like 'M%';    -- ename�� 'M'�� �����ϴ�
select * from emp where ename like '%H';    -- ename�� 'H'�� ������
select * from emp where ename like '%A%';   -- 'A'�� ���ԵȰ�
select * from emp where ename like '__A%';   -- '_'�Ѱ��� ���� ���� ���ڰ� A�ΰ�

-- IS NULL ������
select * from emp where comm is not null;

-- ���� ORDER BY
select * from emp order by sal; -- �������� asc ����
select *from emp order by sal desc; -- ���� ����
select * from emp order by 6 desc; -- �÷����� �÷���ȣ�� ������� (6��° �÷� sal)

    -- �̸� ����
select * from emp where sal>2000 order by sal desc;
select * from emp order by ename;
select * from emp order by hiredate ; -- �Ի��� ������ ��������



select * from emp;

--SQL �Լ�

-- �����Լ�
-- LOWER(),UPPER()- �ҹ���ȭ, �빮��ȭ
select ename, lower(ename),job, LOWER(job) from emp;

-- CONCAT() - ���� ����
select ename ,job,concat (ename, job)"concat" from emp;

--SUBSTR() -- ������ idx ���� ������ŭ ����
select substr ('abcde',3,2) from dual;  --dual(=�������̺�)

-- LPAD(), RPAD()
select LPAD(ename,10,'*') from emp;
select RPAD(ename,10,'*') from emp;


-- �����Լ�
-- ROUND() -�ڸ����� �ݿø�
select round(123.456,2), round(123.456,0), round(123.456,-1)
from dual;
-- TRUNC() -�ڸ����� ������
select trunc(987.987,2), trunc(987.987,0),trunc(987.987,-1)
from dual;
-- MOD() 100%3
select mod(100,3) from dual;
-- �ø� , ���� , ����
select ceil (123.55), floor(123.456), power(2,4)
from dual;