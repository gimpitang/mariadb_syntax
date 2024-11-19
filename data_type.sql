--tinyint는 -128~127까지 표현(1byte 할당)
--authot 테이블에 age 컬럼 추가

alter table author add column age tinyint;
--data insert 테스트: 200 살 insert
insert into author(id, age) values(10,200);
--보수(8개의 방 중 양수 음수 결정하는 인자)
alter table author modify column age tinyint unsigned;

--decimal실습
--decimal (정수부자릿수, 소수부자릿수)
alter table post add column price decimal(10, 3);

--decimal 소수점 초과 후 값 짤림 현성
insert into post (id, title, price) values (2, 'java programming', 10.554565566);

--문자열 실습
alter table author add column self_introduction text;
insert into author(id, self_introduction) values(9,'안녕 나는 영재야');

--blob(바이너리 데이터) 타입
--바이너리(binary)데이터: 2진법 형태의 데이터 --> 이미지나 동영상을 바이너리 데이터로 변환 

alter table author add column profile_image longblob;
--경로는 속성 들어감. 그리고 위치와 확장자 잘 맞춰서 기입
insert into author(id, profile_image) values(11, LOAD_FILE('C:\Users\Playdata\Desktop\my_image.png'))
--실제로는 클라우드에 이미지파일 넣어서 경로만 데이터에 넣는 경우가 많음

--enum: 삽입될 수 있는 데이터의 종류를 한정하는 데이터 타입
-- role칼럼 추가
alter table author add column role enum('user', 'admin') not null default 'user';
--user 값 세팅 후 insert
insert into author(id, role) values(13, 'user');
--uesr 값 세팅 후 insert(잘못 된 값)
insert into author(id, role) values(14, 'users');
-- 아무것도 안넣고 insert (default값)
insert into author(id) values(14);

--date:  날짜, datetime: 날짜 및 시분초(m) 쓰면 microseconds
--datetime은 입력, 수정, 조회 시에 문자열 형식을 사용
alter table post add column created_time datetime default current_timestamp();
update post set created_time = " 2024-11-18 19:12:16" where id =7;

--조회 시 비교연산자
select * from author where id >= 2 and id <=4;
select * from author where id between 2 and 4; -- 위 >= and 4<= 구문과 같은 구문
select * from author where id not(id <2 or id >4 );
select * from author where id in(2,3,4);
-- select * from authot where id in(select author_id from post); 로도 활용 가능
select * from author where id not in(1,5); --전체데이터가 1~5까지밖에 없다는 가정.

--------11/19 강의 시작-------------

--like: 특정 문자를 포함하는 데이터를 조회하기 위해 사용하는 키워드
select * from post where title like '%h'; --h로 끝나는 title 검색
select * from post where title like 'h%'; --h로 시작하는 title 검색
select * from post where title like '%h%'; --단어의 중간에 h라는 키워드가 있는 경우 검색

--regexp : 정규표현식을 활용한 조회
--not regexp도 활용 가능
select * from post where title regexp '[a-z]'; --하나라도 알파벳 소문자가 포함되어 있으면.
select * from post where title regexp '[가-힣]'; --하나라도 한글이 포함되어 있으면.

--날짜 변환 cast, convert : 숫자 -> 날짜, 날짜 -> 숫자

select cast(20241119 as date);--cast와 () 사이 띄어쓰면 안됨
select cast('20241119' as date);
select convert(20241119, date);
select convert('20241119', date);
--문자 ---> 숫자 변환
select cast('12'as int);

-- created_time에서 시간 부분의 문자를 뽑고, 숫자(unsigned, int)로 변환하는데 10시보다 큰 숫자만 뽑을테야
select * from post where case(date_format(created_time, %H)as unsigned) >10; 

--날짜 조회 방법
--like패턴, 부등호 활용, date_format
--like pattern
select * from post where created_time like '2024-11&'; --문자열 조회
select * form post where created_time >= '2024-01-01' and created_time < '2025-01-01';

-- date_format활용
select date_format(created_time, '%Y-%m-%d') from post;
select date_format(created_time, '%H-%i-%s') from post;
select id, title, contents, date_format(created_time, '%Y-%m-%d') from post;
--2024년만 조회해바라
select * from post where date_format(created_time, '%Y') = '2024';
select * from post where cast (date_format (created_time, '%Y') as unsigned) = 2024;
--오늘 현재 시간 (Y-M-D H-I-S)
select now();

