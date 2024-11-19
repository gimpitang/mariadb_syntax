--author table 에 post _conut 컬럼 추가
alter table add column post_count int default 0;
--post에 글 쓴 후에, author 테이블에 post_count값에 +1을 시키는 트랙잭션 테스트

start transaction;
update author set post_count = post_count+1 where id = 2;
insert into post(title, contents, author_id) values('hello java', 'hello java is...', 100);
commit; -- 또는 rollback;

--위 transaction은 실패 시 자동으로 rollback 어려움
-- stored procedure 를 활용하여 자동화된 rollback 프로그래밍
DELIMITER //
CREATE PROCEDURE 트랜잭션테스트()
BEGIN
    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        ROLLBACK;

    END;
    start transaction;
    update author set post_count = post_count+1 where id = 2;
    insert into post(title, contents, author_id) values('hello java', 'hello java is...', 2);
    commit; --또는 rollback;


END //
DELIMITER ;

--procedure 호출
CALL 트랜잭션테스트();

--사용자에게 입력받을 수 있는 프로시저 생성

DELIMITER //
CREATE PROCEDURE 트랜잭션테스트2(in titleInput varchar(255),in contentsInput varchar(255),in idiInput bigint)
BEGIN
    DECLARE exit handler for SQLEXCEPTION
    BEGIN
        ROLLBACK;

    END;
    start transaction;
    update author set post_count = post_count+1 where id = 4; --post table에 있어야함!
    insert into post(title, contents, author_id) values(titleInput, contentsInput, idiInput);
    commit; 


END //
DELIMITER ;