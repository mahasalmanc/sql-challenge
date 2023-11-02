CREATE TABLE Employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE Departments (
    dept_no VARCHAR(30) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE Dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(30) NOT NULL
);

CREATE TABLE Dept_manager (
    dept_no VARCHAR(30) NOT NULL,
    emp_no INT NOT NULL
);
  
CREATE TABLE Titles (
    title_id VARCHAR(30) NOT NULL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE Salaries (
    emp_no INT NOT NULL PRIMARY KEY,
    salary INT NOT NULL
);

ALTER TABLE Employees
ADD CONSTRAINT fk_Employees_emp_no FOREIGN KEY (emp_no)
REFERENCES Salaries (emp_no);

ALTER TABLE Employees
ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY (emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Dept_emp
ADD CONSTRAINT fk_Dept_emp_dept_no FOREIGN KEY (dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_emp
ADD CONSTRAINT fk_Dept_emp_emp_no FOREIGN KEY (emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_manager
ADD CONSTRAINT fk_Dept_manager_emp_no FOREIGN KEY (emp_no)
REFERENCES Employees (emp_no);

Select employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary 
	from employees 
	inner join salaries on employees.emp_no = salaries.emp_no

select first_name, last_name, hire_date
	from employees
	where extract(year from hire_date)=1986;


SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees AS e ON dm.emp_no = e.emp_no;

select first_name, last_name, sex
	from employees
	where first_name = 'Hercules' AND last_name LIKE 'B%';
	
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

