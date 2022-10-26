-- mariaDB 기반

-- myweb.sql

--------------------------------------
CREATE TABLE tb_bbs (
	 bbsno       INT           NOT NULL AUTO_INCREMENT PRIMARY KEY
	,wname       VARCHAR(20)   NOT NULL
	,subject     VARCHAR(100)  NOT NULL
	,content     TEXT          NOT NULL
	,grpno       TINYINT       NOT NULL
	,indent      TINYINT       DEFAULT 0    NOT NULL
	,ansnum      TINYINT       DEFAULT 0    NOT NULL
	,regdt       DATETIME      NOT NULL
	,passwd      VARCHAR(15)   NOT NULL
	,readcnt     INT           DEFAULT 0    NOT NULL
	,ip          VARCHAR(15)   NOT NULL
);

--------------------------------------------------------------
insert into tb_bbs(wname,subject,content,grpno,passwd,ip,regdt)
    values('무궁화','대한민국','오필승코리아',(select ifnull(max(bbsno),0)+1 from tb_bbs as TB),'1234','127.0.0.1',now())
-----------------------------------------
    
    
CREATE TABLE friends (
    id       VARCHAR(10)  NOT NULL, -- 아이디, 중복 안됨, 레코드를 구분하는 컬럼
    passwd   VARCHAR(10)  NOT NULL, -- 패스워드
    mname    VARCHAR(20)  NOT NULL, -- 성명
    tel      VARCHAR(14)  NULL,     -- 전화번호
    email    VARCHAR(50)  NOT NULL  UNIQUE, -- 전자우편 주소, 중복 안됨
    zipcode  VARCHAR(7)   NULL,     -- 우편번호, 101-101
    address1 VARCHAR(255) NULL,     -- 주소 1
    address2 VARCHAR(255) NULL,     -- 주소 2(나머지주소)
    job      VARCHAR(20)  NOT NULL, -- 직업
    hope	 VARCHAR(255) NOT NULL, -- 소원
    mlevel   CHAR(2)      NOT NULL, -- 회원 등급, A1, B1, C1, D1, E1, F1
    mdate    DATE         NOT NULL, -- 가입일   
    PRIMARY KEY (id)
);

insert into friends(id,passwd,mname,tel,email,zipcode,address1,address2,job,hope,mlevel,mdate)
    values('webmaster','kimk0724','김경환','010-4037-1061','stud.hwan22@gmail.com','','','','A02','성장과 행복','A1',now());

show databases;
show tables;
use ;
select * from tb_bbs;

--
    CREATE TABLE tb_pds (
      pdsno       INT            NOT NULL AUTO_INCREMENT PRIMARY KEY
      ,wname      VARCHAR(100)   NOT NULL
      ,subject    VARCHAR(250)   NOT NULL
      ,regdate    DATETIME       NOT NULL
      ,passwd     VARCHAR(15)    NOT NULL
      ,readcnt    INT            DEFAULT 0
      ,filename   VARCHAR(250)   NOT NULL
      ,filesize   INT            DEFAULT 0
    );
    
    
    create table tb_notice(
     noticeno   INT           not null AUTO_INCREMENT PRIMARY KEY -- 일련번호
    ,subject    VARCHAR(255)    not null  -- 제목
    ,content    VARCHAR(4000)   not null  -- 내용
    ,regdt      DATETIME		not null   -- 작성일
   );