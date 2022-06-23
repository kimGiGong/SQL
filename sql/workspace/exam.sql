create table EMP_exam(
    empno number(4) primary key not null,
    ename varchar(50) not null,
    pay number(10),
    hiredate varchar2(50),
    job char(10),
    deptno number(2) not null
);

create table DEPT_exam(
    deptno number(2)primary key not null,
    dname varchar2(10) unique,
    loc varchar2(20)
);

insert into EMP_exam values (44,'ȫ',440000,sysdate,'����',1);
insert into EMP_exam values (55,'��',5500000,sysdate,'����',2);
insert into EMP_exam values (66,'��',66000000,sysdate,'����',3);

insert into dept_exam values (1,'�����','���빮');
insert into dept_exam values (2,'������','ȫ���Ա�');
insert into dept_exam values (3,'�����','���￪�����');

commit;

select * from emp_exam;
select * from dept_exam;