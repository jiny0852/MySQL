select first_name, salary

from employees;

select avg(salary)   -- , first_Name

from employees;


-- count()

select count(*), count(commission_pct)

from employees;

select count(*)

from employees

where salary > 16000;

select sum(salary)
from employees
;

select count(*), sum(salary), avg(salary)

from employees;

select count(*), sum(salary), avg(ifnull(salary,0))

from employees;

############ max(), min() ############

select count(*)
	 , max(salary)
     , min(salary)
from employees
;

select max(salary) -- 1개
	 , first_name  -- 여러개
from employees
;



######### group by ###########

select department_id, salary

from employees

order by department_id asc;

select department_id, avg(salary)

from employees

group by department_id

order by department_id asc;

-- ----------------------------
select department_id, count(*), sum(salary)

from employees

group by department_id;


select department_id   #, job_id
     , count(*), sum(salary)

from employees

group by department_id;


select department_id, job_id, count(*), sum(salary)

from employees

group by department_id, job_id;



select department_id
     , count(*) #sum(first_name)
     , sum(salary)
from employees
group by department_id
having sum(salary) >= 20000
;

#######################################
-- if (조건문, 참일떄 값, 거짓일때 값)
#######################################

select first_name
     , salary
     , commission_pct
     , if (commission_pct is null, "있음", "없음") as state
from employees
;

SELECT employee_id,
       salary,
       job_id,
CASE WHEN job_id = 'AC_ACCOUNT' THEN salary + salary * 0.1

     WHEN job_id = 'SA_REP' THEN salary + salary * 0.2

     WHEN job_id = 'ST_CLERK' THEN salary + salary * 0.3

     ELSE salary

END realSalary

FROM employees;


select first_name '이름'
     , department_id '부서명'
     , case
			when department_id >= 10 and department_id <= 50 then 'A-TEAM'
            when department_id >= 60 and department_id <= 100 then 'B-TEAM'
            when department_id >= 110 and department_id <= 150 then 'C-TEAM'
            else '팀없음'
		end '팀'
from employees
order by 팀 asc 
;


###################################
# JOIN
###################################

 --  이름 월급 부서명
select first_name
     , em.department_id
     , department_name
     , de.department_id
from employees inner join departments
on employees.department_id = departments.department_id
;


select first_name, em.department_id,

department_name, de.department_id

from employees inner join departments

on employees.department_id = departments.department_id;


select first_name,

em.department_id,

department_name,

de.department_id

from employees em, departments de

where em.department_id = de.department_id;


select first_name
     , de.department_name
     , j.job_title
from employees em, departments de, jobs j
where em.department_id = de.department_id and em.job_id = j.job_id
order by de.department_name # 현성 오빠가 예쁘게 만들라고 함
;

select * from employees;
select * from departments;












