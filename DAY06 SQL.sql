-- 1. Database Schema &amp; Sample Data

-- Create Tables
create database hello011;
use hello011;

CREATE TABLE Departments (

dept_id INT PRIMARY KEY,

dept_name VARCHAR(50),

location VARCHAR(50)

);

CREATE TABLE Employees (

emp_id INT PRIMARY KEY,

emp_name VARCHAR(50),

job_title VARCHAR(50),

manager_id INT,

hire_date DATE,

salary DECIMAL(10,2),

dept_id INT,

FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)

);

CREATE TABLE Projects (

project_id INT PRIMARY KEY,

project_name VARCHAR(50),

budget DECIMAL(12,2),

dept_id INT,

FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)

);

CREATE TABLE Employee_Projects (

emp_id INT,

project_id INT,

hours_worked INT,

PRIMARY KEY (emp_id, project_id),

FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),

FOREIGN KEY (project_id) REFERENCES Projects(project_id)

);

-- Insert Data

INSERT INTO Departments VALUES
(10, 'HR', 'New York'),
(20, 'Engineering', 'San Francisco'),
(30, 'Marketing', 'London'),
(40, 'Sales', 'Chicago'),
(50, 'Legal', 'Toronto');

INSERT INTO Employees VALUES
(101, 'Alice Smith', 'HR Manager', NULL, '2020-01-15', 95000.00, 10),
(102, 'Bob Jones', 'Software Engineer', 105, '2021-03-22', 105000.00, 20),
(103, 'Charlie Brown', 'QA Engineer', 105, '2022-06-01', 70000.00, 20),
(104, 'David Miller', 'Marketing Specialist', 106, '2023-02-10', 65000.00, 30),
(105, 'Emma Davis', 'Engineering Director', NULL, '2019-05-12', 150000.00, 20),
(106, 'Frank Wilson', 'Marketing Director', NULL, '2018-11-20', 140000.00, 30),
(107, 'Grace Lee', 'Sales Rep', 108, '2024-01-05', 55000.00, 40),
(108, 'Henry Clark', 'Sales Manager', NULL, '2017-03-15', 115000.00, 40),
(109, 'Ivy Taylor', 'Software Engineer', 105, '2025-08-19', 98000.00, 20);

INSERT INTO Projects VALUES
(501, 'Apollo Project', 250000.00, 20),
(502, 'Zeus Initiative', 120000.00, 20),
(503, 'Global Branding', 85000.00, 30),
(504, 'CRM Migration', 150000.00, 40),
(505, 'Talent Acquisition', 30000.00, 10);

INSERT INTO Employee_Projects VALUES
(102, 501, 120),
(102, 502, 80),
(103, 501, 150),
(104, 503, 200),
(105, 501, 40),
(107, 504, 180),
(108, 504, 50),
(109, 502, 100);
select * from departments;
select * from employees;
select * from Projects;
select * from Employee_Projects;
-- program 26. Find all employees who earn more than the company average salary.
select emp_id,emp_name,salary from employees where salary >
(select  avg(salary)from employees) ;
-- program 27. Find employees who work in the Engineering department using a subquery (No Explicit JOIN).
select emp_name, job_title from employees where dept_id= (select dept_id from departments where dept_name='engineering' );
-- program 28. Find the names of employees who are working on at least one project.
select emp_name, emp_id  from employees e where exists (select * from employee_projects ep where   ep.emp_id= e.emp_id);
-- program 29. Find the names of employees who are NOT working on any project.
select emp_name , emp_id from employees e where not  exists (select * from employee_projects ep where ep.emp_id = e.emp_id);
-- program 30. Find the project with the highest budget.
select project_name,budget from projects p where budget = (select max(budget) from projects );
-- program 31. Find departments that have a higher-than-average project budget allocation.
select d.dept_name, sum(p.budget) as total_budget from departments d join projects p on d.dept_id = p.dept_id group by d.dept_id,d.dept_name having sum(p.budget) > (select avg(budget) from projects );
-- program 32. Find employees who earn more than the maximum salary of the Marketing department.
select emp_id,emp_name,salary from employees where salary > ( select max(salary) from employees where dept_id=(select dept_id from departments where dept_name = 'marketing') );
-- program 33. Use a correlated subquery to find employees who earn more than the average salary of their own department.
select e.emp_name , e.emp_id , e.salary from employees e where e.salary >  (select avg(e2.salary) from employees e2 where e2.dept_id = e.dept_id);
-- program 34. Find the names of departments that actually have employees assigned to them using EXISTS.
select d.dept_name , d.dept_id from departments d where exists (select * from employees e where e.dept_id = d.dept_id);
-- program 35. Find departments that do not have any projects registered using NOT EXISTS
select d.dept_name , d.dept_id from departments d where not exists ( select * from employees e where e.dept_id = d.dept_id); 
-- program  36. Select employee names alongside a column showing the total company payroll (Scalar Subquery).
select emp_name , salary, (select sum(salary)  from employees ) as total_payroll from employees;
-- program 37. Find the oldest employee(s) based on hire date.
select emp_name, emp_id,hire_date from employees where hire_date =(select min(hire_date) from employees );
-- program 38. Find the second highest salary in the company.
select max(salary) as secound_highest_salary from employees where salary < (select max(salary) from employees );
-- program 39. Find projects that have a budget greater than all projects managed by the Sales department combined.
select project_id , project_name , budget from projects where budget > (select sum(p.budget) from projects p where p.dept_id= ( select d.dept_id from departments d where d.dept_name='sales'));
-- program 40. List all employees whose manager works in a different department.
select e.emp_name as employee ,m.emp_name as manager ,e.dept_id as employee_department , m.dept_id as manager_department from employees e join employees m on e.manager_id = m.emp_id WHERE e.dept_id <> m.dept_id;
-- program 41. Find the name of the department that has the highest number of employees.
select d.dept_name ,count(e.emp_id) as employee_count from departments d join employees e on e.dept_id = d.dept_id group by d.dept_name, d.dept_id order by employee_count desc limit 5;
-- program 42. Find employees who work on the project with the longest hours logged.
select e.emp_name,ep.project_id , ep.hours_worked  from employees e join employee_projects ep on ep.emp_id = e.emp_id where hours_worked = (select max(hours_worked) from employee_projects);
-- program 43. Find departments located in cities starting with New or & San using a subquery.
select dept_name , location from departments where dept_id in (select dept_id from departments where location like 'new%' or location like'san%');
-- program 44. Fetch employees whose salary is higher than the salary of any employee hired in 2024.
select emp_name , salary from employees where salary > any (select salary from employees where year(hire_date)=2024  );
-- program 45. Find the names of managers who supervise at least 2 employees.
select  m.emp_name as manager_name ,count(e.emp_id) as employee_count from employees m join employees e on e.manager_id = m.emp_id group by m.emp_id,m.emp_name having count(e.emp_id) >=2;
-- program 46. Get the project names whose budget is lower than the average project budget across the company.
select project_name,budget from projects where budget < (select avg(budget) from projects );
-- program 47. List employee names who are the only ones working on their specific project.
select project_id ,count(emp_id) as project_count from employees group by project_id;