--사용자 관리



--사용자 목록조회

select * from mysql.user;
--%는 원격 포함한 anyway 접속
create user '사용자명'@'계정이르(localhost, %)' identified by '비밀번호';
create user 'choiyoungjae'@'localhost' identified by '4321';


--사용자에게 select 권한 부여
grant select on board.author to 'choiyoungjae'@'localhost';
--사용자 권한 회수
revoke select on board.author from 'choiyoungjae'@'localhost';
--사용자 계정삭제
drop user 'choiyoungjae'@'localhost';