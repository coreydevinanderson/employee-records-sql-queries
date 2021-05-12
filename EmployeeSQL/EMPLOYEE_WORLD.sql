--=======================
--=======================


--Create 'departments' table; set dept_no as PRIMARY KEY

CREATE TABLE departments (
    dept_no VARCHAR NOT NULL,
    dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

--=======================

-- Create titles table

CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY(title_id)
);

SELECT * FROM titles;
--=======================


--Create 'employees' table; set emp_no as PRIMARY KEY

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

SELECT * FROM employees;

ALTER TABLE employees
ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);


-- 'dept_emp' table


--Goal:

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL, 
	PRIMARY KEY (emp_no, dept_no)
);

	
ALTER TABLE dept_emp
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp
ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
	

--=======================

-- Create dept_manager table

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no)
);


ALTER TABLE dept_manager
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_manager
ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

--=======================

--Create salaries table then add serial key

CREATE TABLE salaries (
	emp_no INT NOT NULL,
 	salary INT NOT NULL
);

SELECT * FROM salaries;

ALTER TABLE salaries
ADD COLUMN salaries_id SERIAL PRIMARY KEY;

ALTER TABLE salaries 
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

SELECT * FROM salaries;

--====================
--====================

--List the following details of each employee: employee number, last name, first name, sex, and salary.

CREATE VIEW question_1 AS
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON (e.emp_no = s.emp_no);


--List first name, last name, and hire date for employees who were hired in 1986.

CREATE VIEW question_2 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

CREATE VIEW question_3 AS
SELECT d_m.dept_no, d_m.emp_no, d.dept_name, e.last_name, e.first_name
FROM dept_manager d_m
JOIN departments d
ON (d_m.dept_no = d.dept_no)
JOIN employees e
ON (d_m.emp_no = e.emp_no);


--List the department of each employee with the following information:
--employee number, last name, first name, and department name.

CREATE VIEW question_4 AS
SELECT e.emp_no, e.last_name, e.first_name, d_e.dept_no, d.dept_name
FROM employees e
JOIN dept_emp d_e
ON (e.emp_no = d_e.emp_no)
JOIN departments d
ON (d_e.dept_no = d.dept_no);



