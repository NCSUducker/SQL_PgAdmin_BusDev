--Data Engineering--


CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY
	,title VARCHAR NOT NULL
);



CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY
	,dept_name VARCHAR
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY
	,emp_title_id VARCHAR NOT NULL
	,birth_date VARCHAR NOT NULL
	,first_name VARCHAR NOT NULL
	,last_name VARCHAR NOT NULL
	,sex VARCHAR NOT NULL
	,hire_date VARCHAR NOT NULL
	,FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL
	,dept_no VARCHAR NOT NULL
	,PRIMARY KEY (emp_no, dept_no)
	,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	,FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY
	,salary INT NOT NULL
	,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL
	,emp_no INT NOT NULL
	,PRIMARY KEY (dept_no, emp_no)
	,FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--VERIFY DATA IMPORTS--

SELECT * FROM  titles;

SELECT * FROM salaries;

SELECT * FROM employees;

SELECT * FROM dept_manager;

SELECT * FROM dept_emp;

SELECT * FROM departments;

--DB Analysis--
--QUERY FROM DB--

-- 1) List details of each employee: employee #, last name, first name, sex, and salary

SELECT employees.emp_no
, employees.last_name
, employees.first_name
, employees.sex
, salaries.salary
FROM employees
LEFT JOIN salaries 
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no;

-- 2) First and last name, accompanied by hire date, for employees hired in 1986

SELECT first_name
, last_name
, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- 3) Manager of each department with the following: department number, department name, the manager's employee number, last name, first name

SELECT dept_manager.dept_no
, departments.dept_name
, dept_manager.emp_no
, employees.last_name
, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- 4) List the department of each employee with the following information: employee number, last name, first name, and department name

SELECT employees.emp_no
, employees.last_name
, employees.first_name
, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- 5) List first, last name, and sex for employees with the first name 'Hercules' and last names begin with the letter 'B'

SELECT first_name
, last_name
, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT * FROM departments;
--d007 = Sales department

SELECT employees.emp_no
, employees.last_name
, employees.first_name
,departments.dept_name
FROM employees
JOIN dept_emp ON  employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT * FROM departments;
--d005 = Development department

SELECT employees.emp_no
, employees.last_name
, employees.first_name
, departments.dept_name
FROM employees
JOIN dept_emp ON  employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd005' or departments.dept_no = 'd007';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name

SELECT last_name, COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY "frequency" DESC;