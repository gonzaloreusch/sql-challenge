--1. Employee details:
SELECT employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.sex,
		salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no;
	--Successfully run. Total query runtime: 612 msec.
	--300024 rows affected.

--2. Employees hired in 1986:
Select first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986'
	--Successfully run. Total query runtime: 183 msec.
	--36150 rows affected.

--3. Department manager's information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;
	--Successfully run. Total query runtime: 47 msec.
	--24 rows affected.

--4. Employee's dept: employee number, last name, first name, and department name.
SELECT employees.emp_no, 
		employees.first_name,
		employees.last_name,  
		departments.dept_name
FROM departments
INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
dept_emp.emp_no = employees.emp_no
	--Successfully run. Total query runtime: 443 msec.
	--331603 rows affected.
	
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules'AND last_name LIKE 'B%';
	--Successfully run. Total query runtime: 76 msec.
	--20 rows affected
	
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, 
		employees.last_name,
		employees.first_name,
		departments.dept_name 
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';
	--Successfully run. Total query runtime: 145 msec.
	--52245 rows affected

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, 
		employees.last_name,
		employees.first_name,
		departments.dept_name 
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name IN ('Sales','Development');
	--Successfully run. Total query runtime: 233 msec.
	--137952 rows affected.

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM employees 
GROUP BY last_name ORDER BY COUNT(last_name) Desc;
	--Successfully run. Total query runtime: 90 msec.
	--1638 rows affected.