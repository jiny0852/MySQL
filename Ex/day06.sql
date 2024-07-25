##################20240725
-- limit n번, n개
##########################

select  employee_id,	
		first_name,
        salary
        
from employees
order by employee_id asc
limit 0, 5
;

select  employee_id,	
		first_name,
        salary
        
from employees
order by employee_id asc
limit 5 offset 10
;

-- 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?

select  first_name,
		salary,
        hire_date

from employees 
where hire_date >= '07/01/01' and hire_date <= '07/12/31'
order by salary desc
limit 2, 5
;

select  first_name,
		salary,
        hire_date

from employees 
where hire_date between '07/01/01' and '07/12/31'
order by salary desc
limit 2, 5
;

select  first_name,
		salary,
        hire_date

from employees 
where date_format(hire_date, '%y') = '07'
order by salary desc
limit 2, 5
;



######################
/* - 데이터
DML 조작
조회
추가
삭제
수정

DDL 제어
권한 부여

DCL 정의
테이블 만들기
데이터베이스 만들기
계정 생성


데이터베이스 = 스키마 라고 부름 mySQL에서 공간 개념

*/
-- C:\Program Files\MySQL\MySQL Server 8.0\bin
















###################
###################
#root
###################


-- root에서 계정 관리

-- root 계쩡 만들기
create user 'web'@'%' identified by '1234';

-- 계정 비밀번호 수정
alter user 'web'@'%' identified by 'web';

-- 데이터베이스=스키마 접속권한 부여
grant all privileges on web_db.* to 'web'@'%';

-- 계정 삭제
drop user 'web'@'%';

-- 변경내용 바로반영
flush privileges;

grant select,insert on hr_db.employees to 'web'@'%';


######################################################
/*계정명 book, 비번 book, 모든곳에서 접속 가능한 계정을 만드세요
권한은 book_db 데이타베이스의 모든 테이블에 모든 권한을 갖도록 하세요*/

create user 'book'@'%' identified by 'book';

grant all privileges on book_db.* to 'book'@'%';

flush privileges;

-- 있으면 삭제
drop user if exists 'book'@'%';





#############################
-- 데이터베이스/테이블 관리

create database web_db
	default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

show databases;

use web_db;



###################
###################
#book_db
###################



create database book_db
	default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

show databases;

use book_db;

drop database book_db;

drop database if exists book_db;




######################################

-- 테이블 만들기

create table book (

	book_id     integer,
    title       varchar(50),
    author      varchar(20),
    pub_date    datetime
    
);

show tables;

-- 컬럼 추가
alter table book add pubs varchar(50);

-- 컬럼 수정
alter table book modify title varchar(100);

-- 컬럼명 수정
alter table book rename column title to subject;

-- 컬럼 삭제
alter table book drop author;

-- 테이블 명 수정
rename table book to article;

-- 테이블 삭제
drop table article;
show tables; 

-- 테이블의 모든 로우를 제거 DML delete문과 비교
truncate table article;



-- author 테이블 만들기
create table author (

		author_id integer primary key,
        author_name varchar(100) not null,
        author_desc varchar(500)
	
);

show tables;
select * from author;


create table book (
		
		book_id    integer         primary key,
        title      varchar(100)    not null,
        pubs       varchar(100),
        pub_date   datetime,
        author_id  integer,
        
        constraint book_fk foreign key (author_id)
        references author(author_id)
        
);


###########################
-- 작가 테이블에 데이터 추가 ( DML )


######### insert 등록

insert into author values(1, '박경리', '토지 작가');

insert into author 
values(
		1, 
        '박경리', 
        '토지 작가'
);

insert into author (author_id, author_name)
values(
		2, 
        '이문열'
);

insert into author
values(
		2, 
        '이문열',
        null
);

insert into author (author_id, author_name)
values(
		3, 
        '기안84'
);

select * from author;


############# update 수정

-- 작가 테이블에 데이터 수정
update author 
set author_name = '신지연', author_desc = '학생'
where author_id = 2
;




############ delete 삭제

delete from author
where author_id = 2;

select * from author;



################################

-- 자동증가 auto_increment

drop table book;
drop table author;

-- 테이블 생성시 사용
create table author (
		author_id 		int 			primary key			auto_increment,
		author_name 	varchar(100) 	not null,
		author_desc 	varchar(500)
);


insert into author
values ( null, '신지연', '학생' )
;

select * from author;

-- 생성된 테이블에 적용
alter table author 
modify author_id int	primary key		auto_increment; 


select last_insert_id();
alter table author auto_increment = 50;














