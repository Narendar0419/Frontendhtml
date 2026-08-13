show databases;
use vvstore;
create table stu (STUDENTID int primary key , SNAME varchar(30) , AGE int ,  EMAILID varchar(40) , ADDRRESS varchar (100), constraint uk_01 unique (EMAILID));
insert into stu  values('2001','naren','17','narenofficial284@gmail.com','no:103 kanehehhb sbxjbsbn kkbki');
select * from stu;
create table employee (employeeid int primary key,employeename varchar(30),desg char(3),salary int ,email varchar(45),phone int, constraint uk_02 unique (email,phone) );
insert into employee values ('2002', 'arun', 'hr','20000','hello@gamil.com','37987677');
insert into employee values ('2003', 'vijay', 'hr','20000','hellooo@gamil.com','37988879');
select * from employee;
desc employee;
create table PRODUCT(productID int primary key,productname varchar (30),productcode int ,productDescripiton varchar (20),price int , constraint uk_03 unique (productcode));
insert into product  values('129','AC','8090','indoor ac','87949');
insert into product  values('129','fridge','8090','double door ','873439');
insert into product  values('123','ac','8656','commercial ac','87449');
insert into product  values('1629','tv','8050','tv','88798');
insert into product  values('124','home theatre','8050','music','823279');
select * from product;
create table course (courseid int primary  key,coursename varchar (30),coursecode int,duration varchar(30),coursefee int , constraint uk_04 unique (coursecode));
insert into course values ('3879','fullstack','7683','4months',40000);
insert into course values ('3872','data science','7683','4months',40000);
insert into course values ('3873','digital marketing','7684','4months',40000);
select * from course
create table euser(euserid int primary key,eusername varchar(30),email varchar(46),epassword varchar(45) , constraint uk_05 unique (eusername,email));
insert into euser values('989','hee02','naren39879@gmail.com','6bxbhhbu');
insert into euser values('9883','hello.002','naren39879@gmail.com','6bxbhhbu');
insert into euser values('9800','hel.788','naren3@gmail.com','6bhbu');
select * from euser
