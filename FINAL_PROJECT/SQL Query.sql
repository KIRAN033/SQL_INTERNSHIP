use employee_management_system;
 CREATE TABLE employee (
    employee_id VARCHAR(20),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id VARCHAR(20),
    hire_date DATE,
    salary INT,
    gender CHAR(1),
    email_id VARCHAR(30),
    phonenumber VARCHAR(12)
);



CREATE TABLE employee_project (
    employee_id VARCHAR(20),
    project_id VARCHAR(50),
    role1 VARCHAR(20),
    start_date DATE,
    end_date DATE
);

CREATE TABLE department (
    department_id VARCHAR(20),
    department_name VARCHAR(50),
    manager_id VARCHAR(20),
    location VARCHAR(50)
);

CREATE TABLE salary (
    salary_id VARCHAR(20),
    employee_id VARCHAR(20),
    salary INT,
    bonus INT,
    deduction INT,
    effective_date DATE
);

CREATE TABLE project (
    project_id VARCHAR(20),
    project_name VARCHAR(50),
    department_id VARCHAR(20),
    start_date DATE,
    end_date DATE,
    budget INT,
    project_manager_id VARCHAR(20),
    status VARCHAR(20)
);




CREATE TABLE attendance (
    attendance_id VARCHAR(20),
    employee_id VARCHAR(20),
    date1 DATE,
    status1 VARCHAR(30)
);


-- 1. get the attendance status of employees on a specific date "2023-01-11"

use employee_management_system;
select employee_id, status1,date1
from attendance
where date1= "2023-01-11";

-- 2. Find all employees in a specific department (deptt=102):
select employee_id,first_name, last_name, department_id
from employee
where department_id=102;

-- 3. List all projects and their associated department names:

select project.project_name, department.department_name

from project

join department on project.department_id = department.department_id;

-- 4. Get the salary details of employees along with their bonuses:

select employee.first_name, employee.last_name, employee.salary, salary.bonus
from employee
join salary on employee.employee_id = salary.employee_id;

-- 5. Get the number of employees in each department:

select count(employee_id) as number_of_employees , department_id
from employee
group by department_id;



use employee_management_system;

-- 1. Get the total number of days each employee was present in a specific month and year (01, 2023).
select employee.employee_id, 
concat ( employee.first_name, ' ' , employee.last_name) as employee_name,
count(attendance.attendance_id) as days_present

from attendance
join employee on employee.employee_id = attendance.employee_id

where attendance.status1= 'present'  and month(attendance.date1)= 01 and year(attendance.date1) =2023

group by employee_id, first_name, last_name;


-- Calculate the net salary of all employees after bonuses and deductions, and list those whose net salary exceeds a certain threshold.(60000/-)

select employee.employee_id,
concat (employee.first_name , ' ' ,employee.last_name) as employee_name,
salary.salary as base_salary,
salary.bonus, salary.deduction,
(salary.salary+ salary.bonus- salary.deduction) as net_salary

from salary 
join employee on salary.employee_id = employee.employee_id

where (salary.salary+ salary.bonus - salary.deduction)> 60000;


-- Rank departments based on the number of active employees and their total salaries.


select department.department_id,
department.department_name,
count(employee.employee_id) as active_employees, 
sum(employee.salary) as total_salary,
rank() over (order by count(employee.employee_id) desc , sum(employee.salary) desc ) as department_rank

from department 
join employee
on department.department_id = employee.department_id

where employee.hire_date <= current_date
group by department.department_id , department.department_name
order by department_rank;

