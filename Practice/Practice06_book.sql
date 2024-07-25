
/*
오늘 과제 형식
-- Practice06_book.sql 깃허브
-----------------------------
root 계정에서 할일
-------------------------------
-- book계정만들기

-- book권한부여

-- book_db만들기


-----------------------------
book 계정에서 할일
-------------------------------
-- 작가 테이블 만들기

-- 책 테이블 만들기

-- 작가 등록(6개)

-- 책등록(8개)

-- 책+작가 리스트 출력

-- 강풀정보 변경

-- 책+작가 리스트 출력

-- 기안84 작가 삭제
-- -->오류발생 이유 생각해보기

-- 나머지 배운 명령어 해보기
*/

################################
# root

-- 계쩡 생성
drop user 'book'@'%';

create user 'book'@'%' identified by 'book';

grant all privileges on book_db.* to 'book'@'%';

flush privileges;


-- db 생성
drop database book_db;

create database book_db
	default character set utf8mb4
    collate utf8mb4_general_ci
    default encryption='n'
;

show databases;

use book_db;


##################################
############## book ##############
##################################

drop table author;
drop table book;

create table author (

		author_id		integer			primary key		auto_increment,
        author_name		varchar(20)		not null,
        aythor_desc		varchar(40)
        
);
select * from author;

create table book (
		
        book_id		integer			primary key		auto_increment,
        title		varchar(50)		not null,
        pubs		varchar(30),
        pub_data	datetime,
        author_id	integer,
        
        constraint book_fk foreign key (author_id)
        references author(author_id)

);
select * from book;



-- 작가 등록(6개)
insert into author #1
values ( 
		null,
        '이문열',
        '경북 영양'
);
insert into author #2
values ( 
		null,
        '박경리',
        '경상남도 통영'
);
insert into author #3
values ( 
		null,
        '유시민',
        '17대 국회의원'
);
insert into author #4
values ( 
		null,
        '기안84',
        '기안동에서 산 84년생'
);
insert into author #5
values ( 
		null,
        '강풀',
        '온라인 만화가 1세대'
);
insert into author #6
values ( 
		null,
        '김영하',
        '알쓸신잡'
);
select * from author;




-- 책등록(8개)

insert into book #1
values ( 
		null,
        '우리들의 일그러진 영웅',
        '다림',
        '1998-02-22',
        '1'
);
insert into book #2
values ( 
		null,
        '삼국지',
        '민음사',
        '2002-03-01',
        '1'
);
insert into book #3
values ( 
		null,
        '토지',
        '마로니에북스',
        '2012-08-15',
        '2'
);
insert into book #4
values ( 
		null,
        '유시민의 글쓰기 특강',
        '생각의길',
        '2015-04-01',
        '3'
);
insert into book #5
values ( 
		null,
        '패션왕',
        '중앙북스(books)',
        '2012-02-22',
        '4'
);
insert into book #6
values ( 
		null,
        '순정만화',
        '재미주의',
        '2011-08-03',
        '5'
);
insert into book #7
values ( 
		null,
        '오직두사람',
        '문학동네',
        '2017-05-04',
        '6'
);
insert into book #8
values ( 
		null,
        '26년',
        '재미주의',
        '2012-02-04',
        '5'
);
select * from book;




-- 책+작가 리스트 출력

-- 강풀정보 변경

-- 책+작가 리스트 출력

-- 기안84 작가 삭제
-- -->오류발생 이유 생각해보기



