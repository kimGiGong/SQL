-- 회원가입 테이블 생성
create table signup (
    id varchar2(50) primary key,
    pw varchar2(50) not null,
    name varchar2(20) not null,
    email varchar2(50),
    gender varchar2(20),
    music varchar2(20)
    sports varchar2(20)
    travel varchar2(20)
    movies varchar2(20),
    job varchar2(20)
    bio varchar2(1000),
    reg date default sysdate
);




select * from signup where id='java' and pw='1111';