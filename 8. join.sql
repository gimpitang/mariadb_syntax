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
--한 번이라도 글을 쓴 author 목록 조회
select distinct a.* from author a inner join post p on a.id=p.author_id;
select * from author where id in(select author_id from post);


--select 절 안에 서브쿼리
--author의 email과 author 별로 본인이 쓴 글의 개수를 출력

select a.email, (select count(post_count) from author) from author a; --내가 했던것 (실패함)
select count(*) from post where author_id =2; --이 짓 아이디 별로

select a.email, (select count(*) from post where author_id=a.id) from author a; --정답

--from 절 안에 서브쿼리
select a.name from(select * from author) as a;

-- 없어진 기록 찾기 
-- 서브쿼리 이용
SELECT * FROM ANIMAL_OUTS WHERE ANIMAL_ID NOT IN (SELECT ANIMAL_ID FROM ANIMAL_INS);

-- JOIN 이용
SELECT O.ANIMAL_ID, O.NAME FROM ANIAMAL_OUTS O LEFT JOIN ANIMAL_INS I 
ON O.ANIMAL_ID=I.ANIMAL_ID 
WHERE I.ANIMAL_ID IS NULL;



SELECT O.ANIMAL_ID, O.NAME FROM ANIMAL_OUTS O LEFT JOIN ANIMAL_INS I
ON I.ANIMAL_ID=O.ANIMAL_ID
WHERE I.NAME IS NULL OR I.ANIMAL_ID IS NULL;


--집계함수
-- null은 count에서 제외
select count(id) from author;
select sum(price) from post;
select avg(price) from post;
select around(값, 1) from post;

--group by : 그룹화된 데이터를 하나의 행(row)처럼 취급.
-- author_id로 그룹핑 하였으면, 그 외의 캌ㄹ럼을 조회하는 것은 적철치 않음.
group by author_id from post group by author_id;

--group by와 집계함수
--아래 쿼리에서 *은 그룹화된 데이터 내에서의 개수
select author_id, count(*) from post group by author_id;

--author_id로 그룹핑한 후 원고료 합계
select author_id, count(*), sum(price) from post group by author_id;

--author의 email과 author 별로 본인이 쓴 글의 개수를 출력
select a.email, (select count(*) from post where author_id=a.id) from author a; --정답
--join과 group by, 집계함수를 활용한 글의 개수 출력
select a.email, count(p.author_id) as 개수 from author a left join post p on p.author_id=a.id group by a.email;
select a.email, count(p.id) as 개수 from author a left join post p on p.author_id=a.id group by a.id; --강사님

--where 와 group by
-- 연도 별로 post 글의 개수 출력. 연도가 null 인 값은 제외
select date_format(created_time, '%Y') as year , count(author_id) from post group by year; --test
select date_format(created_time, '%Y') as year , count(author_id) from post where created_time is not null group by year; 
select date_format(created_time, '%Y') as year , count(*) from post where created_time is not null group by year; 

-- 자동차 종류 별 특정 옵션이 포함된 자동차 수 구하기
SELECT CAR_TYPE, COUNT(OPTIONS) AS CARS FROM CAR_RENTAL_COMPANY_CAR 
WHERE OPTIONS LIKE '%시트%'
GROUP BY CAR_TYPE ORDER BY CAR_TYPE;

-- 입양 시각 구하기(1)
SELECT DATE_FORMAT(DATETIME, '%H') AS HOUR, COUNT(ANIMAL_ID) AS COUNT FROM ANIMAL_OUTS 
WHERE  DATE_FORMAT(DATETIME, '%H') >= '09' AND  DATE_FORMAT(DATETIME, '%H') <'20' GROUP BY HOUR ORDER BY HOUR;

--having : group by 를 통해 나온 집계값에 대한 조건
--글을 2개 이상 쓴 사람에 대한 정보 조회
select author_id from post group by author_id having count(*)>=2;
select author_id, count(*) as count from post group by author_id having count>=2; -- 이것도 문제가 업따!

	
--동명 동물 수 찾기
SELECT NAME, COUNT(NAME) AS COUNT FROM ANIMAL_INS GROUP BY NAME HAVING COUNT(NAME)>=2 ORDER BY NAME;
SELECT NAME, COUNT(NAME) AS COUNT FROM ANIMAL_INS where name is not null GROUP BY NAME HAVING COUNT(NAME)>=2 ORDER BY NAME; -- 강사님

--다중열 group by
--post에서 작성자 별로 만든 제목의 개수를 출력하시오.
select author_id, title, count(*) from post group by author_id, title;

--재구매가 일어난 상품과 회원 리스트 구하기

SELECT USER_ID, PRODUCT_ID 
from ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID HAVING COUNT(*) >=2
ORDER BY USER_ID, PRODUCT_ID DESC ;
--정답임


