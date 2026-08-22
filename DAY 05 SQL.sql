show databases;
use vvstore;
create table employees(emp_id int,empname varchar(39),depart_id int, manager_id int,salary int);
drop table employees;
insert into employees values (766,'arun',888,666,90000) ,(666,'vikki',909,435,30000),(435,'naren','999',4567,50000),(565,'arul',9090,766,20000) ;
create table department (depart_id int, depart_name varchar(44));
drop table department;
insert into department values(888,'msc','chennai'),(908,'bsc','madurai') ,(999,'b.com','thiruvallur'),(9090,'llb','thambaram');
alter table department add city varchar (35);
create table projects (project_id int, project_name varchar (30), depart_id int );
insert into projects values (123,'web',909),(777,'hello',999),(688,'app',889),(2121,'ecommernce',9090) ;
select e.empname, d.depart_name from employees e inner join  department  d  on e.depart_id= d.depart_id;
-- program 2--
select e.empname,d.depart_name from employees e left join department d on e.depart_id = d.depart_id; 
-- program 3--
select d.depart_name,e.empname from department d left join employees e on d.depart_id=e.depart_id;
-- program 04--
select e.empname , p.project_name from employees e inner join projects p  on e.depart_id = p.depart_id ;
-- program 05
select e.empname , p.project_name from employees e left join projects p on e.depart_id = p.depart_id where  p.project_id is null ; 
-- program 06
select d.depart_name,p.project_name from projects p inner join  department d on  d.depart_id = p.depart_id;
-- program 07
select e.empname,d.depart_name,city from employees e join department d on e.depart_id=d.depart_id;
-- program 08
select e.empname as employee , m.empname as manager from employees e  left join  employees m on e.manager_id=m.emp_id;
-- program 09
select d.depart_name  from department d left join  projects p on d.depart_id = p.depart_id where p.project_id is null ;
-- program 10
select e.empname as employee , m.empname as manager , e.salary as employee_salary , m.salary as manager_salary from employees e inner join employees m on m.manager_id=e.emp_id where e.salary > m.salary;