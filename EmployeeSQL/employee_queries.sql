--====================

--Question_1
--List the following details of each employee: employee number, last name, first name, sex, and salary.

CREATE VIEW question_1 AS
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);


--Question_2
--List first name, last name, and hire date for employees who were hired in 1986.

CREATE VIEW question_2 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';


--Question_3
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

CREATE VIEW question_3 AS
SELECT d_m.dept_no, d_m.emp_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager d_m
JOIN departments d
ON (d_m.dept_no = d.dept_no)
JOIN employees e
ON (d_m.emp_no = e.emp_no);

--Question_4
--List the department of each employee with the following information:
--employee number, last name, first name, and department name.

CREATE VIEW question_4 AS
SELECT e.emp_no, e.last_name, e.first_name, d_e.dept_no, d.dept_name
FROM employees e
JOIN dept_emp d_e
ON (e.emp_no = d_e.emp_no)
JOIN departments d
ON (d_e.dept_no = d.dept_no);


--Question_5
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

CREATE VIEW question_5 AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--Question_6
--List all employees in the Sales department, including:
--their employee number, last name, first name, and department name.

CREATE VIEW question_6 AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp d_e
ON (e.emp_no = d_e.emp_no)
JOIN departments d
ON (d_e.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';


--Question_7
--List all employees in the Sales and Development departments, including:
--their employee number, last name, first name, and department name.

CREATE VIEW question_7 AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp d_e
ON (e.emp_no = d_e.emp_no)
JOIN departments d
ON (d_e.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


--Question_8
--In descending order, list:
--the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "last_name_count"
FROM employees
GROUP BY last_name
ORDER BY "last_name_count" DESC;
