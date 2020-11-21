-- table & info for titles
CREATE TABLE titles(
title_id varchar(64) PRIMARY KEY,
title varchar(64)
)
COPY titles(title_id,title)
FROM '/Users/greusch/Desktop/DA&V Commits/sql-challenge/EmployeeSQL/titles.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM titles

-- table & info for employees
CREATE TABLE employees(
emp_no int PRIMARY KEY,
emp_title_id varchar(64),
birth_date DATE,
first_name varchar(64),
last_name varchar(64),
sex varchar(64),
hire_date DATE,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

COPY employees(emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date)
FROM '/Users/greusch/Desktop/DA&V Commits/sql-challenge/EmployeeSQL/employees.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM employees

-- table & info for salaries
CREATE TABLE salaries(
emp_no int,
salary numeric(10,2),
Foreign KEY (emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (emp_no)
)

COPY salaries(emp_no,salary)
FROM '/Users/greusch/Desktop/DA&V Commits/sql-challenge/EmployeeSQL/salaries.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM salaries

-- table & info for departments
CREATE TABLE departments(
dept_no varchar(64) PRIMARY KEY,
dept_name varchar(64)
)

COPY departments(dept_no,dept_name)
FROM '/Users/greusch/Desktop/DA&V Commits/sql-challenge/EmployeeSQL/departments.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM departments

-- table & info for dept_manager
CREATE TABLE dept_manager(
emp_no int, 
dept_no varchar(64), 
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
PRIMARY KEY (emp_no,dept_no)
)

COPY dept_manager(dept_no,emp_no)
FROM '/Users/greusch/Desktop/DA&V Commits/sql-challenge/EmployeeSQL/dept_manager.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM dept_manager

-- table & info for dep_emp
CREATE TABLE dept_emp(
emp_no int,
dept_no varchar(64),
PRIMARY KEY (emp_no,dept_no),
FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
)

COPY dept_emp(emp_no,dept_no)
FROM '/Users/greusch/Desktop/DA&V Commits/sql-challenge/EmployeeSQL/dept_emp.csv'
DELIMITER ','
CSV HEADER;
SELECT * FROM dept_emp