create table member(
    id varchar2(50) primary key,
    pw varchar2(50) not null,
    name varchar2(20) not null, 
    gender varchar2(20),
    email varchar2(50),
    reg date default sysdate
);

desc member;
select * from member;

create table testmember02(
    id varchar2(50) primary key,
    pw varchar2(50) not null,
    name varchar2(50) not null,
    birth date not null,
    gender varchar2(50) not null,
    email varchar2(100),
    tel varchar2(50) not null
);
alter table testmember02 add (since date default sysdate);
desc testmember02;
select * from testmember02; 
alter table testmember02 modify(gender null);
commit;

