--1.List the employee number, last name, first name, sex, and 
--salary of each employee.

select employees.emp_no as "emplyee number", last_name, first_name, sex , s.salary
from employees
join salaries as s
on employees.emp_no=s.emp_no ;


--2.List the first name, last name, and hire date for the employees
--who were hired in 1986

select first_name, last_name , hire_date 
from employees 
where hire_date between '1986-01-01' and '1986-12-31'


--3.List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.*/
select  dm.emp_no ,dm.dept_no,d.dept_name,e.last_name,e.first_name
from dept_manager as dm
join departments as d
on dm.dept_no = d.dept_no
join employees as e
on dm.emp_no= e.emp_no

--4.List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
select dm.dept_no,dm.emp_no,e.last_name, e.first_name, d.dept_name
from dept_emp as dm
join employees as e
on dm.emp_no = e.emp_no
join departments d
on dm.dept_no = d.dept_no

--5.List first name, last name, and sex of each employee 
--whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex 
from employees 
where first_name = 'Hercules' and last_name like 'B%'

--6.List each employee in the Sales department,
--including their employee number, last name, and first name.
select dm.emp_no , dm.dept_no , d.dept_name, e.last_name, e.first_name
from dept_emp as dm
join employees as e
on dm.emp_no = e.emp_no
join departments as d
on dm.dept_no = d.dept_no
where dm.dept_no = 'd007'

--7.List each employee in the Sales and Development departments, including their 
--employee number, last name, first name, and department name

select dm.emp_no , dm.dept_no , d.dept_name, e.last_name, e.first_name
from dept_emp as dm
join employees as e
on dm.emp_no = e.emp_no
join departments as d
on dm.dept_no = d.dept_no
where dm.dept_no = 'd007' or dm.dept_no = 'd005'

--8.List the frequency counts, in descending order, 
--of all the employee last names (that is, 
--how many employees share each last name).
select count(*) as frequency_counts, last_name
from employees
group by last_name 
order by frequency_counts desc