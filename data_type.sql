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




