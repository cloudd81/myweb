-- bbs.sql
-- 답변 및 댓글형 게시판
-- 작성 시 비밀번호를 입력해야만 수정과 삭제가 가능한 게시판 만들기

-- 테이블 삭제
drop table tb_bbs;

-- 테이블 생성
create table tb_bbs(
  bbsno    number(5)       not null -- 일련번호 -99999~99999
 ,wname    varchar2(20)    not null -- 작성자
 ,subject  varchar2(100)   not null -- 글제목
 ,content  varchar2(2000)  not null -- 글내용
 ,passwd   varchar2(10)    not null -- 글비밀번호
 ,readcnt  number(5)       default 0 not null -- 글조회수
 ,regdt    date            default  sysdate   -- 글작성일
 ,grpno    number(5)       not null  -- 글 그룹번호
 ,indent   number(5)       default 0 -- 들여쓰기
 ,ansnum   number(5)       default 0 -- 글순서
 ,ip       varchar2(15)    not null  -- 사용자 요청 PC의 IP
 ,primary key(bbsno)                 --bbsno 기본키 
);

-- 시퀀스 생성
create sequence bbs_seq;

-- 시퀀스 삭제
drop sequence bbs_seq;
/////////////////////////////////////////////////////////////////////////


-- 새 글 쓰기
bbsno							: 시퀀스를 이용해서 일련번호 입력
wname, subject, content, passwd	: 사용자가 입력
readcnt, regdt, indent, ansnum	: default 값
ip								: 요청 PC의 IP를 저장
grpno							: max(bbsno)+1


-- 그룹 번호(grpno) 만들기
select max(bbsno) from tb_bbs;
-- null값이면 계산 안됨
select max(bbsno)+1 from tb_bbs;
-- nvl()함수를 이용해서 max(bbsno) 값이 비어 있을 때(null) 0으로 바꿈
select nvl(max(bbsno),0) from tb_bbs;
-- nvl()함수를 이용해서 max(bbsno) 값이 비어 있을 때(null) 0으로 바꾼 후 +1
select nvl(max(bbsno),0)+1 from tb_bbs;


-- 행추가
insert into tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno)
values(bbs_seq.nextval, ?, ?, ?, ?, ?, (select nvl(max(bbsno),0)+1 from tb_bbs));

select * from tb_bbs;


-- 전체 목록
select bbsno, wname, subject, readcnt, regdt
from tb_bbs
order by grpno desc, ansnum asc;

-- 상세보기
select * from tb_bbs where bbsno=?

-- 행삭제
delete from tb_bbs where bbsno=? and passwd=?

-- 행수정
update tb_bbs set wname=?, subject=?, content=?, id=?
where bbsno=? and passwd=?

-- 조회수 증가
update tb_bbs set readcnt=readcnt+1 where bbsno=?


-- 답변쓰기 알고리즘

1) 새글 쓰기 : 최초의 부모글
2) 답글 쓰기 : 자식글

- 그룹번호(grpno)	: 부모글 그룹번호와 동일하게
- 들여쓰기(indent)	: 부모글 들여쓰기 + 1
- 글순서(ansnum)	: 부모글 순서에 +1 한 후, 글 순서를 재조정(update)
 정렬 : order by grpno desc, ansnum;

번호		제목			그룹번호	들여쓰기	글순서
 1		제주도			  1		  0		  0
 2		서울			  2		  0		  0
 5		▶ 종로구		  2		  1		  1
 7		▶▶ 관철동		  2		  2		  2
 8		▶▶▶ 보신각	  2       3       3
 6		▶▶ 인사동		  2		  2		  2 -> 3 -> 4
 4		▶ 강남구		  2		  1		  1 -> 2 -> 3 -> 4 -> 5
10		▶▶ 도곡동		  2		  2		  6
 9		▶▶ 역삼동		  2		  2		  6 -> 7
11		▶ 마포구		  2		  1		  8
 3		부산시			  3		  0		  0
 

  
-- 부모글 정보 가져오기
SELECT grpno, ansnum, indent
FROM tb_bbs
WHERE bbsno=?
 > 부모 글이 존재하면 각각 부모글의 들여쓰기 +1, 부모글의 글순서에 +1

- 수정하고 재조정하기
UPDATE tb_bbs SET ansnum=ansnum+1
WHERE grpno=2 and ansnum>=6
//////////////////////////////////////////////////////////////////////////


[검색]
-- 제목+내용에서 '파스타'가 있는지 검색
WHERE subject LIKE %파스타% OR content LIKE %파스타% 

-- 제목에서 '파스타'가 있는지 검색
WHERE subject LIKE %파스타%

-- 내용에서 '파스타'가 있는지 검색
WHERE content LIKE %파스타% 

-- 작성자에서 '파스타'가 있는지 검색
WHERE wname LIKE %파스타%


[과제]
답변이 없는 부모글은 넘어가고

 무궁화
 
 코리아	2 > 목록 페이지에 답글의 갯수를 표기하기;

SELECT grpno, count(indent)-1 as cnt
FROM tb_bbs
GROUP BY grpno;


 
SELECT BB.subject, AA.reply
FROM ( 
    SELECT grpno, count(indent)-1 as reply
    FROM tb_bbs
    GROUP BY grpno
    ) AA inner join tb_bbs BB
ON AA.grpno=BB.grpno
WHERE BB.indent=0;
ORDER BY BB.grpno DESC;

부모글의 grpno와 indent를 받아온다
/////////////////////////////////////


set pagesize 100;
set linesize 100;
col wname for a10;
col subject for a20;

select bbsno, wname, subject, readcnt, indent, regdt
from tb_bbs


[페이징]
- rownum 줄 번호 활용
1);
select bbsno, wname, subject, readcnt, indent, regdt
from tb_bbs
where subject like '%2%'
ORDER BY grpno DESC, ansnum;

2) rownum 추가
select bbsno, wname, subject, readcnt, indent, regdt, rownum
from tb_bbs
ORDER BY grpno DESC, ansnum;

3) 
SELECT bbsno, wname, subject, readcnt, indent, regdt, rownum as rnum
FROM (
    SELECT bbsno, wname, subject, readcnt, indent, regdt
    FROM tb_bbs
    ORDER BY grpno DESC, ansnum
    );
    

4) 줄번호 1-5행 조회하기(1페이지)
SELECT bbsno, wname, subject, readcnt, indent, regdt, rownum
FROM (
    SELECT bbsno, wname, subject, readcnt, indent, regdt
    FROM tb_bbs
    WHERE subject like '%6%'
    ORDER BY grpno DESC, ansnum
    )
WHERE rownum>=1 AND rownum<=5;

5) 줄번호 6-10행 조회하기(2페이지)
SELECT *
FROM (
    SELECT bbsno, wname, subject, readcnt, indent, regdt, rownum as r
    FROM (
        SELECT bbsno, wname, subject, readcnt, indent, regdt
        FROM tb_bbs
        ORDER BY grpno DESC, ansnum
        )
    )
WHERE r>=6 AND r<=10;


6) 페이징 + 검색
SELECT *
FROM (
    SELECT bbsno, wname, subject, readcnt, indent, regdt, rownum as r
    FROM (
        SELECT bbsno, wname, subject, readcnt, indent, regdt
        FROM tb_bbs
        WHERE subject LIKE '%2%'
        ORDER BY grpno DESC, ansnum
        )
    )
WHERE r>=6 AND r<=10;