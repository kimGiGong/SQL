-- ȸ������
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

-- �Խ���
create table board (
    num number primary key, -- DB�������� �� ������ȣ
    writer varchar2(50) not null,
    subject varchar2(100) not null,
    email varchar2(100),
    content varchar2 (4000), -- maximum 
    pw varchar2(100),
    reg date default sysdate,   -- �ۼ���
    readcount number default 0 
);
-- �Խñ� ���� ��ȣ�� ������ ������ ����
create sequence board_seq nocache;

desc board;

select * from board where num >= 1
and num <=10
order by reg desc;
delete from board;

commit;
select count(*) from board;

select rownum r, A.* from     -- rownum ��� ���ڵ忡 1���� ��ȣ ����
    (select * from board order by reg desc) A   -- �������� A�� ����
where rownum >=1            -- 2������ �����ϸ� �ȶ�
and rownum <= 30;


select B.* from
    (select rownum r, A.* from     -- rownum�� ��ȣ�� ���� ���̺� 
        (select * from board order by reg desc) A   -- �������� A�� ����
     ) B   
where r >= 11
and r <= 20;

select * from board;

commit;

-- ��� ���̺�
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







