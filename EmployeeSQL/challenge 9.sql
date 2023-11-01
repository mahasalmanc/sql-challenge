CREATE TABLE Departments (
    dept_no VARCHAR(30) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE Employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE Dept_emp (
    Dept_emp_id SERIAL PRIMARY KEY,
    emp_no INT NOT NULL,
    dept_no VARCHAR(30) NOT NULL UNIQUE,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE Dept_manager (
    manager_id SERIAL PRIMARY KEY,
    dept_no VARCHAR(30) NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Titles (
    title_id VARCHAR(30) NOT NULL,
    title VARCHAR(255) NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (title_id)
);

ALTER TABLE Dept_emp
ADD CONSTRAINT fk_Dept_emp_dept_no FOREIGN KEY (dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_emp
ADD CONSTRAINT fk_Dept_emp_emp_no FOREIGN KEY (emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_manager
ADD CONSTRAINT fk_Dept_manager_emp_no FOREIGN KEY (emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Employees
ADD CONSTRAINT fk_Employees_emp_no FOREIGN KEY (emp_no)
REFERENCES Salaries (emp_no);

ALTER TABLE Employees
ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY (emp_title_id)
REFERENCES Titles (title_id);
