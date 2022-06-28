-- 회원가입
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

-- 게시판
create table board (
    num number primary key, -- DB로직상의 글 고유번호
    writer varchar2(50) not null,
    subject varchar2(100) not null,
    email varchar2(100),
    content varchar2 (4000), -- maximum 
    pw varchar2(100),
    reg date default sysdate,   -- 작성일
    readcount number default 0 
);
-- 게시글 고유 번호로 적용할 시퀀스 생성
create sequence board_seq nocache;

desc board;

select * from board where num >= 1
and num <=10
order by reg desc;
delete from board;

commit;
select count(*) from board;

select rownum r, A.* from     -- rownum 결과 레코드에 1부터 번호 증가
    (select * from board order by reg desc) A   -- 서브쿼리 A에 저장
where rownum >=1            -- 2번부터 실행하면 안뜸
and rownum <= 30;


select B.* from
    (select rownum r, A.* from     -- rownum로 번호가 붙은 테이블 
        (select * from board order by reg desc) A   -- 서브쿼리 A에 저장
     ) B   
where r >= 11
and r <= 20;

select * from board;

commit;

-- 댓글 테이블
create table replyBoard(
    replyNum number primary key,
    reply varchar2(600) not null,
    replyer varchar2(100),
    replyReg date default sysdate,
    boardNum number not null,
    replyGrp number,
    replyLevel number,
    replyStep number
);
select * from replyboard;
commit;

create sequence reply_seq nocache;







