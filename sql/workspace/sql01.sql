-- �ּ�
-- ���̺� ����
-- creat table ���̺�� (�÷��� Ÿ�� �ɼ�, �÷��� Ÿ�� �ɼ�,....);
create table test( -- test ���̺�
    id varchar2(50) primary key,    -- column��
    pw varchar2(50) not null,
    age number default 1,
    reg date default sysdate
);  
-- ���� ��� : ctrl+Enter (Ŀ�� ��ġ�߿�)
-- sysdate : ����ý��۽ð� ��ɾ�
-- NULLABLE : null �Է� ���ɿ���

-- ���̺� ���� Ȯ�� : desc(description(����)) ���̺��;
desc test;
-- ����ڰ� ������ ��� ���̺� ��ȸ
select table_name from user_tables;

-- ** SELECT **

-- #1. ��ü ���ڵ� ��ȸ ( ���̺� ����� ��ü�÷� + ��ü���ڵ� ��ȸ ) : select * from ���̺��;
select * from test;
select * from dept;
select * from salgrade;
select * from emp;  -- �������
-- #2. Ư�� �÷��� ���ڵ� ��ȸ : emp ���̺��� empno(no=number), ename, deptno �÷��� ��ȸ
select empno, ename,deptno from emp;
-- #3. �÷�+ǥ���� ���ڵ� ��ȸ -- SMITH's job : CLERK
select ename, '''s job : ', job from emp; -- ���ڿ�='���ڿ�' Ȭ����ǥ=''
-- #4. ���� ������ : ||
select ename || '''s job : ' || job from emp;
-- #5. �÷��� ��Ī �޾Ƽ� ��ȸ 
select ename || '''s job : ' || job "Hello SQL" from emp;
select ename || '''s job : ' || job Hello from emp;
-- '' : ���ڿ� ������
-- "" : ��Ī (��ȣ�� ���Ⱑ ��Ī�� ���ϸ� ����, ��ȣ���� �� �ܾ��� ��쿡�� �����ǥ ��������)

select empno "�����ȣ",ename "����̸�" from emp;

-- #6. ALL/ DISTINCT
select all deptno from emp; -- ALL= defualt (��������) �׷��� ���� ����
select distinct deptno,ename from emp; -- �ߺ� ���� + (�ش�Ǵ� �÷���ü�� �������� �ߺ�����)















