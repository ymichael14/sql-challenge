
create table department(
    dept_no varchar(4) primary key, 
    dept_name varchar(40)
);

create table title(
    title_id varchar(5) primary key,
    titles varchar(40)
);

create table employee(
    emp_no INT primary key,
    emp_title_id varchar(5),
    birth_date date,
    first_name varchar(40),
    last_name varchar(40),
    sex varchar(3),
    hire_date date,
    foreign key(emp_title_id) references title(title_id)
);

create table dept_emp(
    emp_no int,
    dept_no varchar(4),
    primary key(emp_no, dept_no), 
    foreign key (emp_no) references employee (emp_no),
    foreign key (dept_no) references department(dept_no)
);

create table dept_manager(
    dept_no varchar(4),
    emp_no int,
    primary key(dept_no,emp_no), 
    foreign key (emp_no) references employee (emp_no),
    foreign key (dept_no) references department(dept_no)
);

create table salaries(
    emp_no int,
    salary int,
    primary key(emp_no, salary), 
    foreign key (emp_no) references employee (emp_no)
);
