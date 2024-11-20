--외워야 하는 것 **

-- mariadb 서버에 접속
mariadb -u root -p

-- 스키마(database) 목록 조회
show databases;

-- **스키마(database) 생성 (대문자로 쓰는 것이 정석임. 소문자도 인식됨) **********************
CREATE DATABASE board;

--스키마 삭제
drop database board;

--**데이터베이스 선택 ********************
use board;

--**테이블목록조회 ************
show tables;

--문자 인코딩(체계) 조회
show variables like 'character_set_server';

--문자 인코딩 변경
alter database board default character set = utf8mb4;

--테이블 생성
create table author(id INT PRIMARY KEY, name VARCHAR(255), email VARCHAR(255), password VARCHAR(255));

--테이블 컬럼 조회 ********************
describe author;

--테이블 컬럼 상세조회(참고)
show full columns from author;

--자주 쓰는 toll(GUI-마이셸너무 ui구림) : mysql workbench, dbeaver, data grip

--테이블 생성 명령문 조회
show create table author;

--post table 신규 생성(id, title, content, author_id)
create table post(id int PRIMARY key, title VARCHAR(255), content VARCHAR(255), author_id int not null, foreign key(author_id) references author(id));

--table index 조회(성능향상 옵션)
show index from author;

--alter 문 : 테이블의 구조를 변경
--테이블의 이름 변경
alter tabel post rename posts;

--테이블 컬럼 추가 : ***************
alter table author add column age int;

--테이블 컬럼 삭제
alter table author drop column age;

--테이블 컬럼명 변경
alter table post change column content contests varchar(255);

-- 테이블 컬럼 타입과 제약조건 변경 -> 덮어쓰기 됨에 유의******************************************
alter table author modify column email varchar(100) not null;

--실습 : author table에 address 컬럼추가/ varchar 255
alter table author add address varchar(255)

--post 테이블에 title은 not null로 변경, contents 3000자로 변경
alter  table post modify column title varchar not null, modify column content varchar(3000):;

--테이블 삭제
show create table post;
drop table post;

