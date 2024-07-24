############ day04 ##############
-- subQuery
#################################

-- den 보다 월급이 많은 사람의 이름과 월급은?
select * from employees;

select  first_name,
		salary
        
from employees 
where salary >= 11000
;


select  first_name,
		salary
        
from employees 
where salary >= (select salary 
				 from employees 
				 where first_name = 'den')
and salary <= 12000

order by salary desc
;

########################################
-- 단일행


-- 월급 제일 적게 받는 사람의 이름 월급 사원번호는

select  first_name,
		salary,
        employee_id

from employees
where salary = (select min(salary)
				from employees)
;


-- 평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요?

select  first_name,
		salary
        
from employees
where salary <= ( select avg(salary)
				  from employees )
                  
order by salary desc
;


###############################
-- 다중행



-- 부서번호가 110인 직원의 월급와 같은 월급을 받는 모든 직원의 사번, 이름, 월급를 출력하세요
select  first_name,
		salary
        
from employees
where salary in ( select salary
				  from employees
                  where department_id = 110 )
;

-- 부서번호가 110인 직원의 급여와 같은 월급을 받는 모든 직원의 사번, 이름, 급여를 출력하세요

select  employee_id,
		first_name,
        salary
        
from employees
where salary in ( select salary
				  from employees
                  where department_id = 110 )
;


-- 각 부서별로 최고급여를 받는 사원의 이름과 월급을 출력하세요
###### in

-- 내가 한거
select  first_name,
		salary,
        department_id
        
from employees
where salary in ( select max(salary)
				  from employees
                  group by department_id )
order by department_id  
;

## 조건을 제대로 걸어 줘야 원하는 결과값 도출 할수있다
## 결과값이 여러개일 경우 ( 부서마다 최대금액이 다르다 ) 경우가 다르다?

select  first_name,
		salary,
        department_id
        
from employees
where (department_id, salary) in ( select department_id, 
										  max(salary)
								   from employees
								   group by department_id )
                                   
order by department_id                                   
;


####### any
-- 부서번호가 110인 직원의 월급 중 가장 작은 월급 보다 월급이 많은 모든 직원의 이름, 급여를 출력하세요.(or연산--> 8300보다 큰)

select  first_name,
		salary
        
from employees
where salary >any ( select salary
					from employees
                    where department_id = 110 )
;


###### and
-- 부서번호가 110인 직원의 월급 중 가장 많은 월급 보다 월급이 많은 모든 직원의 이름, 급여를 출력하세요.(and연산--> 12008보다 큰)

select  first_name,
		salary
        
from employees
where salary >all ( select salary
					from employees
                    where department_id = 110 )
;




#################### 10p
/* 조건절에서 비교 vs 테이블에서 조인

▪ 각 부서별로 최고월급을 받는 사원의 부서번호, 직원번호, 이름, 월급을 출력하세요*/
######################

select department_id, employee_id, first_name, salary
from employees

where (department_id, salary) in (select department_id, max(salary)
								  from employees
								  group by department_id)
order by department_id
;                       
 


select e.department_id, e.employee_id, e.first_name, e.salary
from employees e, (select department_id, max(salary) salary
				   from employees
				   group by department_id)   s
                    
where e.department_id = s.department_id
and e.salary = s.salary

order by department_id
;  

-- -------------------------------------
## 11p

select department_id, employee_id, first_name, salary
from employees

where (department_id, salary) in (select department_id, max(salary)
								  from employees
								  group by department_id)
                                  
;








