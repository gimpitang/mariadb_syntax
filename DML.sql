-- insert into : 테이블에 데이터 삽입
insert into 테이블명(컬럼명1, 컬럼명2, 컬럼명3) values(데이터1, 데이터2, 데이터3);

--문자열은 일반적으로 작은 따옴표를 ''를 사용
insert into author(id, name, email) values(5, 'min', '3@mjf.com');

-- select :데이터 조회, *: 모든 컬럼을 의미
select * from author
select name, email from author;

--post 데이터 1줄 추가
insert into post (id, title, contents, author_id) values(1, 'abc', '가나다라', 1);
insert into author(id, name, email) values(5, 'min', 'fjf@naver.com');

--테이블 제약조건 조회
selecr * from information_schema.key_column_usage where table_name = 'post';

--ui이용해서 보드 조회: ui에서 우클릭, select lows --> 쿼리 새로 만들어줌
--명령어 검색 구글 - mysql fk 정보 조회

--insert문을 통해 author 데이터 2개정도 추가, post 데이터 2개 추가 (1개는 익명)
insert into author(id, name, email) values (7, '최영재', '1@.츠');
insert into post (id, title, contents, author_id) values (2, 'ddd', '내용', null);
insert into post (id, title, contents, author_id) values (3, 'sfsa', 'gjjfj', 7);

--update: 데이터 수정
--where문을 빠뜨리게 될 경우, 모든 데이터에 update문이 실행됨에 유의.
update author set name='홍길동' where id=1;
update author set name='홍길동', email='honggildong,naver.com' where id=2;

--delete: 데이터 삭제
-- where조건을 생략할 경우 모든 데이터가 삭제됨에 유의
delete from author where id = 5;

--select : 조회
select * from author;  --어떠한 조회조건 없이 컬럼 조회
select * from author where id=1; --where 쥐에 조회조건을 통해 조회
select * from author where di>2 and name='lee'; --또는은 or사용하면됨

--중복제거 조회 :distinct
select name from author; 
select distinct name from author;

--정렬 : order by + 컬럼명
--아무런 정렬 조건 없이 조회할 경우에는  pk 기준으로 오름차순
--asc : 오름차순(안넣어도 디폴트가 오름차순임), desc: 내림차순
select * from author order by name desc;

--멀티컬럼  order by : 여러컬럼으로 정렬 --> 먼저 쓴 컬럼 우선 정렬. 중복 시 다음 정렬 옵션 적용.
select * from author order by name desc, email asc; --name으로 먼저 정렬 후, name이 중복되면 email로 정렬

--결과값 개수 제한
select * from author limit 2; --컬럼에서 상위 2개 제한
select * from author order by id desc limit 2; --컬럼에서 id 중 마지막 2개 제한 검색

-- 별칭(alias)을 이용한 select
select name as '이름',  email as '이메일' from author;
select a.name, a.email from author as a;
select a.name, a.email from author a;

--null을 조회조건으로 활용
select * from author where password is null;
select * from author where password is not null;

--상위 n개 레코드