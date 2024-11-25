--여러 사용자가 1개의 글을 수정할 수 있다 가정 후 db 리뉴얼
-- author 와 post n:m 관계가 되어 관계 테이블을 별도로 실행
creat table  author(id bigint auto_increment, 
email varchar(255) not null unique,    ----------------유니크 빼먹음 
name varchar(255),
created_time datetime default current_timestamp());

creat table  post(id bigint auto_increment, 
title varchar(255) not null,    
contents varchar(3000),----------------3000자빼먹음 
created_time datetime default current_timestamp());


--1:1 관계인 author_address
--1:1 관계의 보장은 author_id unique 설정
creat table author_post(id bigint auto_increment, primary key, 
country varchar(255),    
city varchar(255),
street varchar(3000),
author_id --------unique
created_time datetime default current_timestamp());

--author_post는 연결테이블로 생성
create table author_post(id bigint auto_increment, primary key, 
author_id bigint not null, post_id bigint not null,
foreign key(author_id) references author(id),
foreign key(post_id) references post(id)
)


--복합키로 author_post 생성
create table author_post2(
author_id bigint not null,
post_id bigint not null,
primary(author_id, post_id),
foreign key(author_id) references author(id),
foreign key(post_id) references post(id);

)

--설정 확인
select * from information_schema.key_column_usage where table_name = 'author_post2';


-- 내 id로 내가 쓴 글 조회
select p.* from post p inner join author_post ap on p.id=ap.post_id 
where ap.author_id = 1;

-- 글 2번 이상 쓴 사람에 대한 정보 조회
select a.* from author a inner join author_post ap on a.id = ap.author_id 
group by a.id having count(a.id)>=2 order by author_id;

--글 2번 이상 쓴 사람이 무슨 글을 썼나?

