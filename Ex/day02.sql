use hr_db;

select * 
from employees;




-- where 절
select first_name
	 , salary
from employees
where salary >= 17000;


-- 비교연산자 !=, 조건이 여러개일때, between, in

select first_name
	 , salary
from employees
where first_name in ('lex')
;

select first_name
	 , salary
from employees
where first_name like '%am%'
;

select first_name
	 , salary
from employees
where first_name like '_a%'
;

select first_name
	 , salary
from employees
where first_name like '___a%'
;

select first_name
from employees
where first_name like '_a__'
;

-- null

-- null 은 계산되지 않는다 (계속 null) 
-- 수당을 계산 하세요
select  first_name
	  , salary
      , commission_pct
      , salary * commission_pct '수당'
from employees
where salary between 13000 and 15000
;

select first_name
     , salary      
     , commission_pct
     , salary * commission_pct '수당'
from employees
where commission_pct is not null
and salary >= 13000 and salary <=15000
;

select first_name
     , salary
     , commission_pct
from employees
where commission_pct is not null
;

select first_name
     , salary
     , commission_pct
     , manager_id 
from employees
where commission_pct is null
and manager_id is null
;

select first_name
	 , salary
     , department_id
from employees
where department_id is null
;

-- order by 절

select first_name
     , salary
from employees
order by salary desc -- 오름차순 asc 내림차순 desc
;


select first_name
     , salary
from employees
where salary >= 9000
order by salary desc 
;


select department_id
     , salary
     , first_name
from employees
order by department_id asc
;

select first_name
	 , salary
from employees
order by salary desc
;

select department_id
     , salary
     , first_name
from employees
order by department_id asc, salary desc
;

select first_name
     , salary
     , hire_date
from employees
order by first_name asc
;

select first_name
     , salary
     , hire_date
from employees
order by hire_date asc
;

-------------------------------------------------------
# 단일행 함수
-------------------------------------------------------
-- 단일행함수 > 숫자

-- round() : 반올림
select round(123.123, 2)   -- 123.12
     , round(123.126, 2)   -- 123.13
     , round(234.567, 0)   -- 235
     , round(123.456, 0)   -- 123
     , round(123.456)      -- 123
     , round(123.126, -1)  -- 120
     , round(125.126, -1)  -- 130
     , round(123.126, -2)  -- 100
from dual;

select ceil(123.456),
ceil(123.789),
ceil(123.7892313),
ceil(987.1234)
;

select floor(123.456),
floor(123.789),
floor(123.7892313),
floor(987.1234)
;

select truncate(1234.34567, 2),
truncate(1234.34567, 3),
truncate(1234.34567, 0),
truncate(1235.34567, -2)
;

select pow(12,2), power(2,10);

select sqrt(144);

select sign(123),
sign(0),
sign(-123)
;

select abs(123),
abs(0),
abs(-123)
;

select greatest(2, 0, -2),
greatest(4, 3.2, 5.25),
greatest('B', 'A', 'C', 'c')
;

select least(2, 0, -2),
least(4, 3.2, 5.25),
least('B', 'A', 'C', 'c')
;

select concat('안녕', '하세요');
select concat('안녕', '-', '하세요');
select concat(first_name, " ", last_name)
from employees;

select concat_ws('-','abc','123','가나다');
select concat_ws('-', first_name, last_name, salary)
from employees;

select first_name,
lcase(first_name),
lower(first_name),
lower('ABCabc!#$%'),
lower('가나다')
from employees;

select first_name,
ucase(first_name),
upper(first_name),
upper('ABCabc!#$%'),
upper('가나다')
from employees;

select first_name,
length(first_name),
char_length(first_name),
character_length(first_name)
from employees;
select length('가'), char_length('가'), character_length('가');

select first_name, substr(first_name,1,3), substr(first_name,-3,2)
from employees
where department_id = 100;

select first_name,
lpad(first_name,10,'*'),
rpad(first_name,10,'*')
from employees;

select concat('|', ' 안녕하세요 ', '|' ),
concat('|', trim('    안녕하세요    '), '|' ),
concat('|', ltrim('    안녕하세요    '), '|' ),
concat('|', rtrim('    안녕하세요    '), '|' )
;

select first_name,
replace(first_name, 'a', '*')
from employees
where department_id =100;

select first_name,
replace(first_name, 'a', '*'),
replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id =100;

select current_date(), curdate();
select current_time(), curtime();
select current_timestamp(), now();


select adddate('2021-06-20 00:00:00', INTERVAL 1 YEAR),
adddate('2021-06-20 00:00:00', INTERVAL 1 MONTH),
adddate('2021-06-20 00:00:00', INTERVAL 1 WEEK),
adddate('2021-06-20 00:00:00', INTERVAL 1 DAY),
adddate('2021-06-20 00:00:00', INTERVAL 1 HOUR),
adddate('2021-06-20 00:00:00', INTERVAL 1 MINUTE),
adddate('2021-06-20 00:00:00', INTERVAL 1 SECOND)
;

select datediff('2021-06-21 01:05:05', '2021-06-21 01:00:00'),
timediff('2021-06-21 01:05:05', '2021-06-20 01:00:00')
;

select first_name,
datediff(now(), hire_date)/365
from employees;

-- 변환 함수
-- 날짜(숫자) -->
select now(),
       date_format(now(), ' %Y/%m.%d %H:%i:%s '),
       date_format(now(), ' %Y~%m~%d(%a) %H"%i"%s ')
;
       
select datediff('2021-Jun-04', '2021-06-01'); -- 계산안됨
select str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d');
select str_to_date('2021-06-01 12:30:05', '%Y-%m-%d');
select datediff(str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d'),
       str_to_date('2021-06-01 12:30:05', '%Y-%m-%d')
);  
       
       
-- ifNull : 컬럼의 값이 null 일떄 정해진 값을 출력
select commission_pct, ifnull(commission_pct, 0)
from employees;
select commission_pct, ifnull(commission_pct, "없음")
from employees;
       
select first_name
     , salary
     , commission_pct
     , salary * ifnull(commission_pct, 0) + 500
     , ifnull(commission_pct, 0)
from employees
;
       
       






