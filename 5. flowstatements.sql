-- case문
select column1, column2, column3
-- if (컬럼4==비교값1){결과값1출력}wlese if(컬럼==비교값2){결과값2출력}else{결과값3출력}
 case column4 when 비교값1 then 결과값1
when 비교값2 then 결과값 2
else 결과값3
end from 테이블명;

select id, email, 
case  when name is null '익명사용자'
else name 
end as '사용자'
from author; 

--ifnull(a,b) : 만약에 a가 null이면 b반환, null 아니면 a반환
select id, email, ifnull(name, '익명사용자') as '사용자명' from author;

--if구문
-- id(a,b,c) : a조건이 참이면 b반환, a조건이 거짓이면 c반환
select id, email, if(name is null, '익명사용자', name) as '사용자명' from author;

