--List the following details of each employee: 
--employee number, last name, first name, gender, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.emp_no, s.salary 
FROM employees AS e
INNER JOIN salaries AS s 
ON e.emp_no=s.emp_no
ORDER BY e.emp_no, e.last_name, e.first_name, e.gender, s.salary;

--List employees who were hired in 1986.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.hire_date 
FROM employees 
WHERE '1986' = date_part('year', CAST(hire_date AS DATE));

--Q3 List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, 
--first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, 
e.first_name, dm.from_date, dm.to_date
FROM dept_manager AS dm 
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no 
INNER JOIN dept AS d
ON d.dept_no = dm.dept_no
ORDER BY d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date;

--Q4 List the department of each employee with the following information: 
--employee number, last name, first name and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e, dept_emp AS de, dept AS d
WHERE de.emp_no = e.emp_no
AND d.dept_no = de.dept_no
ORDER BY e.emp_no, e.last_name, e.first_name, d.dept_name;

--Q5 List all employees whose first name is "Hercules" and last names begin with "B."
SELECT last_name, first_name
FROM employees 
WHERE first_name = 'Hercules'
AND left(last_name,1) = 'B';

--Q6 List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN dept AS d
ON de.dept_no=d.dept_no AND d.dept_name='Sales'
INNER JOIN employees AS e
ON de.emp_no=e.emp_no
ORDER BY 1;

--Q7 List all employees in the Sales and Development departments, including their
--employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN dept AS d
ON de.dept_no=d.dept_no 
AND (d.dept_name='Sales' OR d.dept_name='Development')
INNER JOIN employees AS e
ON de.emp_no=e.emp_no
ORDER BY e.emp_no, e.last_name, e.first_name, d.dept_name;

--Q8 In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name?
SELECT last_name, count(*) AS "Employee_Count"
FROM employees
GROUP BY last_name
order by 2 desc;
