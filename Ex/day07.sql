

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




###################
####################
#####################
###################

use book_db;

-- author 테이블 생성 
create table author(
    author_id       int     auto_increment   primary key,
    author_name    varchar(100)  not null,
    author_desc      varchar(500)
);

create table book(
   book_id         int                      auto_increment     primary key,
    title               varchar(50),
    pubs             varchar(20),
    pub_date       date,
   author_id       int,
    constraint book_fk foreign key(author_id)
    references author(author_id)
);


insert into author
values(null, '이문열', '경북 영양');


insert into book
values(null, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);


select * from author;

delete from author
where author_id = 14
;

update author
set author_name = '기안84',
	author_desc = '웹툰작가 겸 연예인'
where author_id = 2
;

update author
set author_name = '박경리',
	author_desc = '토지'
where author_id = 2
;

select * from author;


select  author_id,
		author_name,
        author_desc
        
from author
;

alter table author rename column aythor_desc to author_desc;

select * from book;
select * from author;

insert into book
values ( null, title, pubs, pub_date, author_id )
; 

update book
set title = 'cd',
pubs













