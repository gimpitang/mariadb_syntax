#덤프파일 생성
mysqldump -u root -p board > dumpfile.sql
#한글 깨질 때
mysqldump -u root -p board -r dumpfile.sql
#dump 파일 적용 (복원)
# < 특수문자로 인식되어 윈도우에서 적용이 안될 경우 'git bash' 터미널창을 활용
mysql -u root -p board < dumpfile.sql

#dupm file을 git hub에 업로드

리눅스에서 mariadb 설치
apt -get install mariadb -server

#maria db 서버 실행
sudo systemctl start mariadb

#마리아db 접속 : 1234
mariadb -u root -p 

create database board;

git 설치
sudo apt install git;


#깃에서 repasitory clone
git clone (repository주소);

#maiadb 덤프파일 복원


