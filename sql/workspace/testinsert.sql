create table testinsert (
    fname varchar2(20) not null,
    lname varchar2(30) not null,
    username varchar2(30) primary key,
    email varchar2(100) not null,
    pw varchar2(50) not null,
    tel varchar2(50) not null
);

select * from testinsert;

select * from tboard where boardno=12;

update tboard set subject=? ,content=? where boardno=? and pw=?;

select readcount from tboard where boardno=8;

update tboard set readcount=1 where boardno=8;

create table tcomment (
    commentno number primary key,
    commentName varchar2(100),
    commentreg date default sysdate,
    addcommentno number default 0,
    addlevel number default 0,
    addStep number default 0
);
create sequence tcomment_seq;

create table tsign(
    name varchar2(50),
    id varchar2(50) primary key,
    pw varchar2(50),
    phone varchar2(50),
    birth number (15),
    profile varchar2(200),
    reg date default sysdate
);
alter table tsign modify (birth varchar2(50));
select * from tsign where id='123';

create table tcontentboard (
    bno number primary key,
    subject varchar2(100),
    writer varchar2(50),
    content varchar2(2000),
    bpw varchar2(50),
    img varchar2(100),
    readcount number default 0,
    reg date default sysdate
);
create sequence tcontentboard_seq;

select B.* from(select rownum r, A.* from (select * from tcontentboard order by bno desc) )A )B where r>=1 and r<=10;
