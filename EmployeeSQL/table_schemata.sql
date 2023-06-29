-- Employees table
create table employees (
	emp_no INT PRIMARY KEY NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(75) NOT NULL,
	last_name VARCHAR(75) NOT NULL,
	gender VARCHAR(1)NOT NULL,
	hire_date DATE NOT NULL
);

-- Departments table
create table departments (
	dept_no VARCHAR(30) primary key NOT NULL,
	dept_name VARCHAR(75) NOT NULL
);

-- Titles table
create table titles (
	emp_no INT NOT NULL,
	title VARCHAR(75) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    foreign key (emp_no) references employees (emp_no)
);

-- Employee department table
create table emp_dept (
	emp_no INT NOT NULL,
	dept_no VARCHAR(30) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

-- Salaries table
create table salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    foreign key (emp_no) references employees (emp_no)
);

-- Department Manager table
create table dept_mgr (
	dept_no VARCHAR(30) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

-- Change to_date years that hold year 9999 to current date for dept_manager,
-- dept emp, and titles (salaries table does not have 9999 year)
update dept_mgr
set to_date = CURRENT_DATE
where extract(year from to_date) = 9999;

update emp_dept
set to_date = CURRENT_DATE
where extract(year from to_date) = 9999;

update titles
set to_date = CURRENT_DATE
where extract(year from to_date) = 9999;