--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT e.first_name, e.last_name, e.hire_date 
FROM employees e 
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;

--List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.
SELECT DISTINCT ON (dm.dept_no) dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN departments d
ON dm.dept_no= d.dept_no
INNER JOIN employees e
ON dm.emp_no = e.emp_no
ORDER BY dm.dept_no;

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT DISTINCT(e.emp_no) AS emp_no, e.last_name, e.first_name, d.dept_name, d.dept_no
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments as d
ON de.dept_no = d.dept_no
ORDER BY e.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and 
--whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules'
AND (LOWER(e.last_name) LIKE 'b%');

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT DISTINCT(e.last_name) as last_name, COUNT(e.emp_no) as total
FROM employees e
GROUP BY e.last_name
ORDER BY total DESC;
