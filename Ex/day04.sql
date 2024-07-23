select first_name, 
	   em.department_id,
       department_name, 
       de.department_id
from employees inner join departments
on employees.department_id = departments.department_id;


select first_name,
em.department_id,
department_name,
de.department_id
from employees em, departments de
where em.department_id = de.department_id;

#######################################    left outer join
select e.department_id, 
       e.first_name, 
	   d.department_name
from employees e
left outer join departments d
on e.department_id = d.department_id ; 

-- 모든 직원의 부서번호, 이름, 부서명를 출력하세요
-- •부서번호가 없는 직원도 표시



select e.department_id, 
       e.first_name, 
       d.department_name
from employees e
left join departments d
on e.department_id = d.department_id ; 


-- where 절로 표현X



###################################
select e.department_id, 
       e.first_name, 
       d.department_name
from employees e
right outer join departments d
on e.department_id = d.department_id ; 

# outer join > right join
# 왼쪽 테이블을 기준(기준테이블의 정보는 다 보여줌)


# right join --> left join


############################## union

(select e.employee_id,
        e.department_id,
		e.first_name,
		d.department_name
from employees e left join departments d
on e.department_id = d.department_id
)
union
(select e.employee_id,
		e.department_id,
		e.first_name,
		d.department_name
from employees e right join departments d
on e.department_id = d.department_id
) ;



select * from employees;

select  emp.employee_id, 
		emp.first_name,
		emp.manager_id, 
        man.first_name as manager
from employees emp, employees man
where emp.manager_id = man.employee_id;



####################### 이너조인으로
# 조인 연습 (EQUI Join , inner join 두가지로 풀어볼것)???????????같은거 아닌가
-- 직원아이디 이름 월급 부서아이디 부서명 도시아이디 도시명 

select  e.employee_id,
		e.first_name,
		e.salary,
        d.department_id,
        d.department_name,
        l.location_id,
        l.city
from employees e, departments d, locations l
where e.employee_id = d.manager_id 
and d.location_id = l.location_id
order by e.employee_id asc
;

select  e.employee_id,
		e.first_name,
		e.salary,
        d.department_id,
        d.department_name,
        l.location_id,
        l.city
        
from employees e inner join departments d inner join locations l
on e.employee_id = d.manager_id 
and d.location_id = l.location_id

order by e.employee_id asc
;



-- 직원아이디 이름 월급 부서아이디 부서명 도시아이디 도시명 / 나라아이디 나라명

select  e.employee_id,
		e.first_name,
		e.salary,
        d.department_id,
        d.department_name,
        l.location_id,
        l.city,
        c.country_id,
        c.country_name
        
from employees e, departments d, locations l, countries c
where e.employee_id = d.manager_id 
and d.location_id = l.location_id
and l.country_id = c.country_id

order by e.employee_id asc
;


select  e.employee_id,
		e.first_name,
		e.salary,
        d.department_id,
        d.department_name,
        l.location_id,
        l.city,
        c.country_id,
        c.country_name
        
from employees e inner join departments d inner join locations l inner join countries c
on e.employee_id = d.manager_id 
and d.location_id = l.location_id
and l.country_id = c.country_id

order by e.employee_id asc
;


-- 직원아이디 이름 월급 부서아이디 부서명 도시아이디 도시명 / 나라아이디 나라명 / 지역아이디 지역명


select  e.employee_id,
		e.first_name,
		e.salary,
        d.department_id,
        d.department_name,
        l.location_id,
        l.city,
        c.country_id,
        c.country_name,
        r.region_id,
        r.region_name
        
from employees e inner join departments d inner join locations l inner join countries c inner join regions r

on e.employee_id = d.manager_id 
and d.location_id = l.location_id
and l.country_id = c.country_id
and c.region_id = r.region_id

order by e.employee_id asc
;

select  e.employee_id,
		e.first_name,
		e.salary,
        d.department_id,
        d.department_name,
        l.location_id,
        l.city,
        c.country_id,
        c.country_name,
        r.region_id,
        r.region_name
        
from employees e 
inner join departments d on e.employee_id = d.manager_id 
inner join locations l on d.location_id = l.location_id
inner join countries c on l.country_id = c.country_id
inner join regions r on c.region_id = r.region_id

order by e.employee_id asc
;




-- 직원아이디 이름 이메일 관리자아이디 관리자이름 관리자이메일 관리자전화번호

select  e.employee_id,
		e.first_name,
		e.email,
        e.manager_id,
        m.first_name,
        m.email,
        m.phone_number
        
from employees e, employees m
where e.employee_id = m.manager_id 

order by e.employee_id asc
;





select e.department_id, e.first_name, d.department_name
from employees e
right outer join departments d
on e.department_id = d.department_id ; 

select e.department_id, e.first_name, d.department_name
from employees e
right join departments d
on e.department_id = d.department_id ; 











