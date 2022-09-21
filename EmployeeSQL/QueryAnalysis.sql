--Once you have a complete database, perform these steps:

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
from employee e 
join salaries s 
using (emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select 
    last_name,
    first_name,
    hire_date
from employee
where date_part('year',hire_date)=1986;

-- 3. List the manager of each department with the following information: department number, department name, 
--    the manager's employee number, last name, first name.
select
    a.dept_no,
    b.dept_name,
    a.emp_no,
    c.last_name,
    c.first_name
from dept_manager a
join department b 
using (dept_no)
join employee c
using(emp_no);

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.

select
    a.emp_no,
    b.last_name,
    b.first_name,
    c.dept_name
from dept_emp a
join employee b
using(emp_no)
join department c
using(dept_no);

-- 5. List first name, last name, and sex for 
--    employees whose first name is "Hercules" and last names begin with "B."
SELECT
    first_name, 
    last_name,
    sex
from employee 
where first_name = 'Hercules' and last_name like 'B%';

-- 6. List all employees in the Sales department, 
--    including their employee number, last name, first name, and department name.
select 
    a.emp_no,
    a.last_name,
    a.first_name,
    b.dept_name
from employee a
join dept_emp
using(emp_no)
join department b
using(dept_no)
where b.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
--    including their employee number, last name, first name, and department name.
select 
    a.emp_no,
    a.last_name,
    a.first_name,
    b.dept_name
from employee a
join dept_emp
using(emp_no)
join department b
using(dept_no)
where b.dept_name IN ('Sales','Development');

-- 8. List the frequency count of employee last names 
--    (i.e., how many employees share each last name) in descending order.
select last_name, count(last_name)
from employee
group by last_name
order by count(last_name) desc;