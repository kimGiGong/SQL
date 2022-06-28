create table testinsert (
    fname varchar2(20) not null,
    lname varchar2(30) not null,
    username varchar2(30) primary key,
    email varchar2(100) not null,
    pw varchar2(50) not null,
    tel varchar2(50) not null
);

select * from testinsert;