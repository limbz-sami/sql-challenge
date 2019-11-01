--Drop table if they already exist
DROP TABLE IF EXISTS department CASCADE;
DROP TABLE IF EXISTS dept_employee CASCADE;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

--Creating table and importing csv file 
CREATE TABLE department (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

SELECT * FROM department;

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date DATE
);

SELECT * FROM employees;

CREATE TABLE dept_employee (
	emp_no INT,
	dept_no VARCHAR,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	PRIMARY KEY (emp_no, dept_no)
); 

SELECT * FROM dept_employee;

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, dept_no)
);

SELECT * FROM dept_manager;

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT* FROM salaries;

CREATE TABLE titles (
	emp_no INT,
	title VARCHAR,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT * FROM titles;

