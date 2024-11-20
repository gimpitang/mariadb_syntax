-- inner join
-- 두 테이블 사이에 지정된 조건에 맞는 레코드만 반환. on조건을 통해 교집합 찾기
select * from author inner join post on author.id=post.author_id;
select * from author a inner join post p on a.id=p.author_id;
--출력 순서만 달라질 뿐 조회결과는 동일.
select * from post p inner join author a on a.id=p.author_id;
-- 글쓴이가 있는 글 목록과 글쓴이의 이메일을 출력하시오
-- post의 글쓴이가 없는 데이터는 포함x, 글쓴이 중 글을 한 번도 안쓴 사람 포함 x
select p.*, a.email from post p inner join author a on a.id=p.author_id;

--글의 제목, 내용 그리고 그리고 글쓴이의 이메일만 츨력하시오
select p.title, p.contents, a.email from post p inner join author a on a.id=p.author_id;

--모든 글목록을 출력하고, 만약에 글쓴이가 있다면 이메일 정보를 출력
--left outer join -> left join으로 생략 가능
-- 글을 한번도 안 쓴 글쓴이 정보는 포함x
select p.*, a.email from post p left join author a on a.id=p.author_id;

--글쓴이를 기준으로 left join할 경우, 글쓴이가 n개의 글을 쓸 수 있으므로 같은 글쓴이가 여러번 출력 될 수 있음.
--author와 post가 1:n관계이므로.
-- 글쓴이가 없는 글은 포함 x. (익명 게시자)
select * from author a left join post p on a.id=p.author_id;

--글쓴이가 있는 글 중이에서 글의 title과 email만을 출력하되, 저자의 나이가 30세 이상인 글만 출력
select p.title, a.email from author a inner join post p on a.id=p.author_id where a.age>=30;
select p.title, a.email from author a left join post p on a.id=p.author_id where a.age>='30';


--글의 내용과 글의 저자의 이름이 있는, 글 목록을 출력하되, 2024년 6월 이후에 만들어진 글만 출력.
select p.title from author a left join post p on a.id=p.author_id where p.contents is not null , p.created_time>='2024-06'; 
select p.* from post p inner join author a on a.id=p.author_id where p.contents is not null and p.created_time>='2024-06-01'; --내가 한것
select p.* from post p inner join author a on a.id=p.author_id where p.contents is not null and date_format(p.created_time>='2024-06-01');
select p.* from post p inner join author a on a.id=p.author_id where p.contents is not null and p.created_time like '2024-06%';

--조건에 맞는 도서와 저자 리스트 출력, 프로그래머스

SELECT B.BOOK_ID, A.AUTHOR_NAME, date_format(B.PUBLISHED_DATE, '%Y-%m-%d') AS 'PUBLISHED_DATE' from BOOK AS B 
INNER JOIN AUTHOR A ON A.AUTHOR_ID=B.AUTHOR_ID WHERE B.CATEGORY LIKE '경제' ORDER BY date_format(PUBLISHED_DATE, '%Y-%m-%d'); --내 답

SELECT B.BOOK_ID AS BOOK_ID, A.AUTHOR_NAME AS AUTHOR_NAME, date_format(B.PUBLISHED_DATE, '%Y-%m-%d') AS 'PUBLISHED_DATE' from BOOK AS B 
INNER JOIN AUTHOR A ON A.AUTHOR_ID=B.AUTHOR_ID WHERE B.CATEGORY LIKE '경제' ORDER BY PUBLISHED_DATE; --강사님 답. 군더더기 및 의심의 여지가 없음


--union : 두 테이블의 select 결과를 횡으로 결합(기본적으로 distinct 적용)
--컬럼의 개수와 컬럼의 타입이 같아야함에 유의
--union all : 중복까지 모두 포함

select name, email from author union select title, contents from post;

서브쿼리: select 문 안에 또다른 select문을 서브쿼리라 한다.
--where 절 안에 서브쿼리




--select 절 안에 서브쿼리




--from 절 안에 서브쿼리



