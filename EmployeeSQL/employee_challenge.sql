--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.last_name, employees.first_name, employees.gender, salaries.salary, employees.emp_no
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no
ORDER BY emp_no ASC;

--2. List employees who were hired in 1986.

SELECT * 
FROM employees 
where hire_date between '1986-01-01 00:00:00' AND '1986-12-31 23:59:59.997'

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dept_manager.dept_no, dept_manager.emp_no, dept_manager.from_date, dept_manager.to_date, employees.last_name, employees.first_name, departments.dept_name
FROM dept_manager
INNER JOIN employees ON employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no=departments.dept_no
ORDER BY emp_no ASC;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.last_name, employees.first_name, departments.dept_name, employees.emp_no
FROM dept_emp
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
ORDER BY dept_name ASC;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * 
FROM employees 
where first_name = 'Hercules'
AND
last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.last_name, employees.first_name, dept_emp.emp_no, dept_emp.dept_no, departments.dept_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE dept_name = 'Sales'
ORDER BY emp_no ASC;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.last_name, employees.first_name, dept_emp.emp_no, dept_emp.dept_no, departments.dept_name
FROM dept_emp
INNER JOIN employees ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE dept_name = 'Sales' 
OR dept_name = 'Development'
ORDER BY emp_no ASC;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT (last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
