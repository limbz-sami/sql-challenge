--Listing following details of each employee: employee number, last name, first name, gender, and salary
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM employees AS emp
JOIN salaries AS sal
ON (sal.emp_no = emp.emp_no)
LIMIT 10
;

--Listing employees who were hired in 1986.
SELECT emp_no, last_name, first_name, hire_date
FROM employees
WHERE (EXTRACT(YEAR FROM hire_date)) = '1986'
;

--Listing the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT m.dept_no, d.dept_name, m.emp_no,  
(SELECT emp.first_name 
	FROM employees AS emp 
	WHERE m.emp_no = emp.emp_no) AS "First Name",
(SELECT emp.last_name 
	FROM employees AS emp 
	WHERE m.emp_no = emp.emp_no) AS "Last Name",
m.from_date, m.to_date 	
FROM dept_manager as m
JOIN department as d
ON d.dept_no = m.dept_no

--Listing the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, 
(SELECT d.dept_name FROM department AS d WHERE d.dept_no = de.dept_no)
FROM employees as emp
JOIN dept_employee as de
ON de.emp_no = emp.emp_no
;

--Listing all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules' and
		last_name LIKE 'B%'
;

--Listing all employees in the Sales department, including their employee number, last name, first name, and department name.
CREATE VIEW sales_emp AS
SELECT emp.emp_no, emp.last_name, emp.first_name,
(SELECT d.dept_name FROM department as d WHERE d.dept_no = de.dept_no) as dept_name
FROM employees as emp
JOIN dept_employee as de
ON de.emp_no = emp.emp_no
;

SELECT * 
FROM sales_emp
WHERE dept_name LIKE 'Sales%'
--Listing all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT * 
FROM sales_emp
WHERE dept_name = 'Sales'
or dept_name = 'Development'

--listing the frequency count of employee last names, i.e., how many employees share each last in descending order.
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count DESC; 




