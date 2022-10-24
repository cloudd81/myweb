-- member.sql

-- 회원 테이블
A1: 관리자
B1: 중간 관리자
C1: 우수 사용자
D1: 일반 사용자 (기본)
E1: 비회원
F1: 탈퇴한 회원


-- 회원 테이블
CREATE TABLE friends (
    id       VARCHAR(10)  NOT NULL, -- 아이디, 중복 안됨.
    passwd   VARCHAR(10)  NOT NULL, -- 패스워드
    mname    VARCHAR(20)  NOT NULL, -- 성명
    tel      VARCHAR(14)  NULL,     -- 전화번호
	email    VARCHAR(50)  NOT NULL  UNIQUE, -- 전자우편 주소, 중복 안됨
    zipcode  VARCHAR(7)   NULL,     -- 우편번호, 12345
    address1 VARCHAR(255) NULL,     -- 주소 1
    address2 VARCHAR(255) NULL,     -- 주소 2(나머지주소)
    job      VARCHAR(20)  NOT NULL, -- 직업
   	hope     VARCHAR(255) NOT NULL,	-- 소원
    mlevel   CHAR(2)      NOT NULL, -- 회원 등급, A1, B1, C1, D1, E1, F1
    mdate    DATE         NOT NULL, -- 가입일    
    PRIMARY KEY (id)
);

commit;

select email from friends;

select * from friends where mlevel!='F1';

update friends set mlevel='D1' where id='ginggang';

commit;

insert into friends(id, passwd, mname, tel, email, zipcode, address1, address2, job, hope, mlevel, mdate)
values('webmaster', '12341234', '웹마스터', '123-4567', 'webmaster@itwill.com'
     , '12345', '서울시 강남구 역삼동', '삼원타워4층', 'A02', '세계평화' ,'A1', sysdate);
insert into friends(id, passwd, mname, tel, email, zipcode, address1, address2, job, hope, mlevel, mdate)
values('itwill', '12341234', '웹마스터', '123-4567', 'itwill@itwill.com'
     , '12345', '서울시 강남구 역삼동', '삼원타워4층', 'A02', '세계평화', 'D1', sysdate);
insert into friends(id, passwd, mname, tel, email, zipcode, address1, address2, job, hope, mlevel, mdate)
values('user1', '12341234', '웹마스터', '123-4567', 'user1@soldesk.com'
     , '12345', '서울시 종로구 관철동', '코아빌딩8층', 'A02', '세계평화', 'F1', sysdate);
     
     
-- 로그인
-- 아이디와 비번이 일치하면 회원등급 가져오기
select mlevel
from friends
where id='webmaster' and passwd='12341234' and mlevel IN ('A1', 'B1', 'C1', 'D1');

select mlevel
from friends
where id='itwill' and passwd='12341234' and mlevel IN ('A1', 'B1', 'C1', 'D1');

select mlevel
from friends
where id='user1' and passwd='12341234' and mlevel IN ('A1', 'B1', 'C1', 'D1');

SELECT count(id)
FROM friends
WHERE mlevel IN ('A1', 'B1', 'C1', 'D1') AND id = 'itwill';

INSERT INTO friends(id, passwd, mname, tel, email, zipcode, address1, address2, job, hope, mlevel, mdate)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'D1', sysdate)

UPDATE friends
SET passwd = ? 
WHERE mname = ? AND email = ?

-- 회원 정보 수정
-- 1) 수정하고자 하는 행 가져오기 read() 함수

-- 2) 새로 입력한 값으로 행 수정하기 -> modifyProc() 함수
-- 	(id는 수정 불가, mlevel은 운영자가 수정, mdate는 수정 안함)
UPDATE friends
SET passwd=?, mname=?, tel=?, email=?, zipcode=?, address1=?, address2=?, job=?
WHERE id=?