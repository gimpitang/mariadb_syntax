-- not null 제약 조건 추가
alter table author modify column email varchar(255) not null ;

--unique 제약조건 추가
alter table author modify column email varchar(255) unique;

-- 둘 다 하고 싶으면?
alter table author modify column email varchar(255) unique not null ;

--컬럼에 추가--> nuique,pk,not null  테이블차원에 추가 unique, pk,fk 


--foreign key 제약조건 삭제 및 추가
--제약조건의 이름 확인 후 삭제 및 추가 가능

--최초 테이블 만들 때 했던 명령문
create table post(id int primary key, title varchar(255) unique, content varchar(255) not null, author_id int not null, foreign key(author_id)references author(id));
--제약 조건 조회
select * from information_schema.key_column_usage where table_name = 'post';
--제약 조건 삭제
alter table post drop foreign key post_ibfk_1;
--제약 조건 추가
alter table post add constraint post_author_fk foreign key (author_id) references author(id);

--index 자동 설정되는 조건: primary key, foreign key, unique
--delete, update, 관련 제약조건 테스트

-- on delete cascade테스트 (author 데이터 지우면 뽀린키에 있는 데이터 한 줄 다 같이 삭제됨)
--제약조건 삭제
alter table post drop foreign key post_author_fk;
--제약조건 추가
alter table post add constraint post_author_fk foreign key (author_id) references author(id) on delete cascade;

-- on delete set null테스트 (author 데이터 지우면 뽀린키에 있는 author_id 가 null로 설정됨)
--제약조건 삭제
alter table post drop foreign key post_author_fk;
--제약조건 추가

alter table post add constraint post_author_fk foreign key (author_id) references author(id) on delete set null on update set null;


--default option
alter table author modify column name varchar(255) default 'anonymous';
--auto_increment pk는 auto_increment를 거의 넣는다
alter table author modify column id bigint auto_increment;
alter table post modify column id bigint auto_increment;

--uuid
alter table post add column user_id char(36) default (uuid());