/*문제1.
직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과 부서명(department_name)을
조회하여 부서이름(department_name) 오름차순, 사번(employee_id) 내림차순 으로 정렬하세
요.
(106건)*/

select  e.employee_id,
		e.first_name,
        e.last_name,
        d.department_name

from employees e, departments d
where e.department_id = d.department_id

order by d.department_name asc, e.employee_id desc
;




/*문제2.
employees 테이블의 job_id는 현재의 업무아이디를 가지고 있습니다.
직원들의 사번(employee_id), 이름(firt_name), 월급(salary), 부서명(department_name),
현재업무(job_title)를 사번(employee_id) 오름차순 으로 정렬하세요.
부서가 없는 Kimberely(사번 178)은 표시하지 않습니다.
(106건)*/

select  e.employee_id,
		e.first_name,
        e.salary,
        d.department_name,
        j.job_title
        
from employees e, departments d, jobs j

where e.job_id = j.job_id
and e.department_id = d.department_id

order by e.employee_id asc
;





/*문제2-1.
문제2에서 부서가 없는 Kimberely(사번 178)까지 표시해 보세요
(107건)*/

select  e.employee_id,
		e.first_name,
        e.salary,
        d.department_name,
        j.job_title
        
from departments d 
right join employees e on e.department_id = d.department_id
right join jobs j on e.job_id = j.job_id

order by e.employee_id asc
;



/*문제3.
도시별로 위치한 부서들을 파악하려고 합니다.
도시아이디, 도시명, 부서명, 부서아이디를 도시아이디(오름차순)로 정렬하여 출력하세요
부서가 없는 도시는 표시하지 않습니다.
(27건)*/

select  d.location_id,
		l.city,
        d.department_name
        
from departments d, locations l
where d.location_id = l.location_id

order by d.location_id asc
;


/*문제3-1.
문제3에서 부서가 없는 도시도 표시합니다.
(43건)*/

select  d.location_id,
		l.city,
        d.department_name
        
from departments d right join locations l
on d.location_id = l.location_id

order by d.location_id asc
;


/*문제4.
지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로 출력하
되 지역이름(오름차순), 나라이름(내림차순) 으로 정렬하세요.
(25건)*/

select  r.region_name,
		c.country_name
        
from countries c, regions r
where c.region_id = r.region_id

order by r.region_name asc, c.country_name desc
;


/*문제5.
자신의 매니저보다 채용일(hire_date)이 빠른 사원의
사번(employee_id), 이름(first_name)과 채용일(hire_date), 매니저이름(first_name), 매니저입
사일(hire_date)을 조회하세요.
(37건)*/

select  e.employee_id,
		e.first_name,
        e.hire_date,
        m.first_name '매니저 이름',
        m.hire_date '매니저입사일'
        
from employees e, employees m
where e.manager_id = m.employee_id
and e.hire_date < m.hire_date
;


/*문제6.
나라별로 어떠한 부서들이 위치하고 있는지 파악하려고 합니다.
나라명, 나라아이디, 도시명, 도시아이디, 부서명, 부서아이디를 나라명(오름차순)로 정렬하여
출력하세요.
값이 없는 경우 표시하지 않습니다.
(27건)*/

select  c.country_name,
		c.country_id,
        l.city,
        l.location_id,
        d.department_name,
        d.department_id

from departments d, locations l, countries c
where d.location_id = l.location_id 
and l.country_id = c.country_id 

order by c.country_name asc
;


/*문제7.
job_history 테이블은 과거의 담당업무의 데이터를 가지고 있다.
과거의 업무아이디(job_id)가 ‘AC_ACCOUNT’로 근무한 사원의 사번, 이름(풀네임), 업무아이
디, 시작일, 종료일을 출력하세요.
이름은 first_name과 last_name을 합쳐 출력합니다.
(2건)*/

select  e.employee_id '사번',
		concat(e.first_name, ' ', e.last_name) '이름',
		jh.job_id,
        jh.start_date,
        jh.end_date

from job_history jh, employees e
where jh.employee_id = e.employee_id
and jh.job_id = 'ac_account'
;


/*문제8.
각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name),
매니저(manager)의 이름(first_name), 위치(locations)한 도시(city), 나라(countries)의 이름
(countries_name) 그리고 지역구분(regions)의 이름(resion_name)까지 전부 출력해 보세요.
(11건)*/

(select  d.department_id '부서',
		d.department_name '부서명',
        e.first_name '매니저 이름'
        
from employees e
join departments d  on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
)
union
(select l.city '위치한 도시',
        c.country_name '나라명',
        r.region_name '지역이름'
        
from countries c 
join regions r on c.region_id = r.region_id
join locations l on l.country_id = c.country_id
);





select  d.department_id '부서',
		d.department_name '부서명',
        m.first_name '매니저 이름',
        l.city '위치한 도시',
        c.country_name '나라명',
        r.region_name '지역이름'


from employees e  
left outer join employees m on e.manager_id = m.employee_id
join departments d on m.department_id = d.department_id
join locations l on d.location_id = l.location_id
join countries c on l.country_id = c.country_id
join regions r on c.region_id = r.region_id

/*
from regions r 
left outer join countries c on c.region_id = r.region_id
join locations l on l.country_id = c.country_id
join departments d on d.location_id = l.location_id
join employees m on m.department_id = d.department_id
join employees e on e.manager_id = m.employee_id
 */

;

/*
from employees e 
join employees m on e.manager_id = m.employee_id
join departments d on m.department_id = d.department_id
join locations l on d.location_id = l.location_id 
join regions r on c.region_id = r.region_id
left outer join countries c on l.country_id = c.country_id

;*/



/*문제9.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명
(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.
매니저가 없는 Steven도 표시합니다.
(107명)*/

select  e.employee_id,
		e.first_name,
        d.department_name,
        m.first_name

from employees e
left outer join departments d on d.department_id = e.department_id
left outer join employees m on e.manager_id = m.employee_id
;




/*문제9-1.
문제9 에서 부서가 없는 직원(Kimberely)도 표시하고.
매니저가 없는 Steven도 표시하지 않습니다.
(106명)*/

select  e.employee_id,
		e.first_name,
        d.department_name,
        m.first_name

from employees e
left outer join departments d on d.department_id = e.department_id
join employees m on e.manager_id = m.employee_id
;


/*문제9-2.
문제9 에서 부서가 없는 직원(Kimberely)도 표시하지 않고
매니저가 없는 Steven도 표시하지 않습니다.
(105명)*/

select  e.employee_id,
		e.first_name,
        d.department_name,
        m.first_name

from employees e
join departments d on d.department_id = e.department_id
join employees m on e.manager_id = m.employee_id
;



