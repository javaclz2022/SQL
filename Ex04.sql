/**************************************
*SubQuery
***************************************/
------------------------------------------------------------------
--*단일행 SubQuery

--‘Den’ 보다 급여를 많은 사람의 이름과 급여는?
select  first_name,
        salary
from employees
where salary >= (select  salary
                 from employees
                 where first_name = 'Den');

--Den의 급여를 구한다
select  salary   
from employees
where first_name = 'Den';    --11000



--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select  first_name,
        salary,
        employee_id
from employees
where salary = (select  min(salary)
                from employees);
--가장 작은 급여를 구한다
select  min(salary)  
from employees;


--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요?
select  first_name,
        salary
from employees
where salary <= (select avg(salary)
                 from employees); --평균급여

--평균급여
select avg(salary)
from employees;

------------------------------------------------------------------
--*다중행 SubQuery

--??  부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요
--12008, 8300
select salary
from employees
where department_id = 110;

--비교용
select  employee_id,
        first_name,
        salary
from employees
where salary = 12008
or salary = 8300 ;

--사용
select employee_id,
       first_name,
       salary
from employees
where salary in (select salary
                 from employees
                 where department_id = 110);  --12008, 8300


