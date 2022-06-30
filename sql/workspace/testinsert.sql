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

