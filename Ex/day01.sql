/*****************
select 문(조회)
*******************/

-- select ~ from 절
-- 테이블 전체 조회하기
select * from employees;
select * from departments;
select * from locations;



-- select 절
select first_name, phone_number from employees;

select employee_id, first_name, last_name from employees;

select first_name, 
	   last_name, 
       salary, 
       phone_number, 
       email, 
       hire_date 
from employees;

-- * 컬럼명에 별명 사용하기
select first_name'이름', last_name'성' from employees;
select first_name as 이름, last_name as 성 from employees;

-- as 를 생략할 수 있다

select  first_name '이름(first_name)'
      , phone_number '전화번호'
      , hire_date '입사일'
      , salary 월급
from employees;

select  employee_id '사 번' 
 	  , first_name '이름(first_name)'
      , last_name '성(last_name)'
      , salary 월급
      , phone_number '전화번호'
      , email as '이메일'
      , hire_date '입사일'
from employees;


select  first_name
      , salary 월급
      , salary-100 '월급-식대'
      , salary*12 연봉
      , salary*12+5000 보너스포함
      , salary/30 일급
      , employee_id%3 '워크샵 팀'
from employees;

select job_id*12
from employees;


select  concat(first_name, '_' , last_name) '성명'
	  , salary '월급'
      , salary*12 '연봉'
      , salary*12+5000 '보너스'
      , phone_number '전화번호'
from employees;

select    first_name
        , salary
        , '(주)개발자' as company
        , 3
from employees;

select '(주)개발자' as company
	 , 3
from dual;


select first_name
from employees
where department_id =10;


select  concat(first_name, ' ', last_name) 'Name'
	  , salary
from employees
where salary >= 15000;


select concat(first_name, ' ', last_name) 'Name'
	 , hire_date
from employees
where hire_date >= '2007-01-01';


select concat(first_name, ' ', last_name) 'Name'
	 , salary
from employees
where binary first_name = 'lex';


select first_name
     , salary
from employees
where salary between 14000 and 17000;


select first_name
     , last_name
     , salary
from employees
where first_name in ('Neena', 'lex', 'john');


select first_name
	 , last_name
     , salary
from employees
where first_name like '_a%';

-- 테이블 명을 생략할떄도 있다
select now();


select first_name
	 , department_id
from employees
where department_id = 10;


select first_name
     , salary
from employees
where salary = 2100 
or    salary = 3100 
or    salary = 4100 
or    salary = 5100
;


select first_name
     , salary
from employees
where salary in (2100, 3100, 4100, 5100)
;


select first_name
     , last_name
     , salary
from employees
where first_name in ('Neena', 'lex', 'john')
;







