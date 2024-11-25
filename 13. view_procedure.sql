--view : 실제 데이터를 참조만 하는 가상의 테이블
-- 사용목적 1) 복잡한 쿼리 대신, 2) 테이블의 컬럼까지 권한 분리

--view 생성
create view author_for_marketing as select name, email form author;

--view 조회
select * from author_for _marketing;

--view 권한부여

grant select on board.author_for_marketing to '계정명'@'localhost';

--view 삭제
drop view author_for_marketing;

--procedure 생성
delimiter //
create procedure hello_procedure()
begin
    select 'hello world';
end
// DELIMITER ;


--프로시저 호출

call hello_procedure();

--프로시저 삭제
drop procedure hello_procedure;


--게시물 목록 조회 프로시저 생성
delimiter //
create procedure 게시물목록조회()
begin
    select * from post;
end
// delimiter ;

call 게시물목록조회();

--게시글 id단건조회
delimiter //
create procedure 게시물id단건조회(in postid bigint)
begin
    select * from post where id = postid;
end
// delimiter ;

call 게시물id단건조회(1);


--프로시저 예제

--본인이 쓴 글 목록 조회, 자신의 이메일만 알고 있을 경우
--본인이 쓴 글 목록조회, 본인의 email을 입력값으로 조회. 목록조회의 결과는 *


delimiter //
create procedure 게시글목록조회byemail(in inputEmail varchar(255))
begin
    select p.id, p.title, p.contents from post where id = inputEmail;
end
// delimiter ;



-----------------------------------------------------------------------------------------------
delimiter //
create procedure 게시글목록조회byemail(in inputEmail varchar(255))
begin
    select p.id, p.title, p.contents from post p 
    inner join author_post ap on p.id=ap.id
    inner join author a on a.id=ap.id where a.id = inputEmail;
end
// delimiter ;


a.email   author_post ap-----------------------복습 해야돼...ㅅㅄㅄㅅㅂ 준혁씨가 준 구문이 정답


-- 글쓰기


delimiter //
create procedure 글쓰기(in inputTitle varchar(255), in inputContents varchar(3000),in inputEmail varchar(255) )
begin
    declare authorId bigint;
    declare postId bigint;
    --post 테이블에 insert
    insert into post (title, contents) values(inputTitle, inputContents);
    select id into postId from post order by id desc limit 1;
    select id into authorId from author where email = inputEmail;
    --author_post 테이블 insert: 넣기위해선 author id, post id 필요함
    insert into author_post(author_id, post_id) values( authorId, postId);
end
// delimiter ;



-- 글삭제
--입력값은 글id, 본인 email


delimiter //
create procedure 글삭제(in inputPostId varchar(255),in inputEmail varchar(255) )
begin
    declare authorPostCount bigint;
    declare authorId bigint;
    select count(*) into authorPostCount from author_post where post_id = inputPostId;
    select id into authorId from author where email = inputEmail;
    if authorPostCount>=2 then
    --elseif까지 사용 가능
            delete from author_post where post_id =inputPostId and author_id=authorId;  

    else 
    delete from author_post where post_id=inputPostId and author_id=authorId;
    delete from post where id=inputPostId;


    end if;

end
// delimiter ;



--반복문을 통해 post 대량생성 : 글 title, 글쓴이 email


delimiter //
create procedure 글도배(in count int, in inputEmail varchar(255) )

begin
    declare countValue int default 0;
    declare authorId bigint;
    declare postId bigint;

    while countValue<count do

        insert into post (title) values("안녕하세요");
        select id into postId from post order by id desc limit 1;
        select id into authorId from author where email = inputEmail;
        insert into author_post(author_id, post_id) values( authorId, postId);

        set countValue = countValue+1;
    end while;

end
// delimiter ;


