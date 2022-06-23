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

insert into EMP_exam values (44,'È«',440000,sysdate,'ºóÁý',1);
insert into EMP_exam values (55,'±æ',5500000,sysdate,'ÅÐÀÌ',2);
insert into EMP_exam values (66,'µ¿',66000000,sysdate,'µµµÏ',3);

insert into dept_exam values (1,'¿­¼èµû','µ¿´ë¹®');
insert into dept_exam values (2,'¼ö»öÇØ','È«´ëÀÔ±¸');
insert into dept_exam values (3,'°¡¹æ³Ö','¼­¿ï¿ª³ë¼÷Áý');

commit;

select * from emp_exam;
select * from dept_exam;