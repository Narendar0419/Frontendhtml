show databases;
create database sample;
use sample;
create table Students(StudentID int, StudentName varchar(40), CourseID int, DepartmentID int);
create table Courses(CourseID int, CourseName varchar(100), Duration varchar (50));
drop table Courses;
create table Departments(DepartmentID int, DepartmentName varchar (40));
create table Marks(MarkID int, StudentID int, SubjectID int, Marks int);
create table Subjects(SubjectID int, SubjectName varchar(40));
-- Write a SQL query using appropriate JOINs to display: StudentName, CourseName, DepartmentName, SubjectName, Marks
-- Display details of all students along with their course, department, subject, and marks.
insert into Students values (101,'naren',200,1001),(102,'dhivagar','199',1003),(109,'sarath',104,1090);
insert into Courses values(200,'full stack','3 month'),(199,'data science','5 months'),(104,'front-end','2 months');
insert into Departments values(1001,'manager') , (1003,'hr'),(1090,'TL');
insert into Marks values(434,101,786,87 ),(675,102,654,90),(234,109,295,30);
insert into Subjects values (786,'oops'),(654,'DBMS'),(295,'SQL');
select * from Students;
select * from Courses;
desc Courses;
select * from Departments;
select * from Marks;
select * from Subjects;
-- program 01
select s.StudentName , c.CourseName, d.DepartmentName , m.Marks , sub.SubjectName from Students s left join Courses c on s.CourseID = c.courseID left join Departments d on s.DepartmentID = d.DepartmentID left join Marks m on s.StudentID = m.StudentID left join Subjects sub on m.SubjectID = sub.SubjectID;

-- Write a query using JOINs to display:EmployeeName, DepartmentName, DesignationName, BasicSalary, Bonus, 
-- CityDisplay employees along with their department, designation, salary, and department location.
create table Employees(EmployeeID int, EmployeeName varchar (90), DepartmentID int, DesignationID int);
create table Departmentss(DepartmentID int, DepartmentName varchar(100));
drop table Departmentss;
create table Designations(DesignationID int, DesignationName varchar(90));
create table Salaries(SalaryID int , EmployeeID int, BasicSalary decimal(10,2), Bonus int);
create table Locations(LocationID int, DepartmentID int, City  varchar(100));
INSERT INTO Employees  VALUES(1, 'Arun', 101, 201),(2, 'Rahul', 101, 201),(3, 'Priya', 102, 202),(4, 'Karthik', 103, 203),(5, 'Divya', 104, 204),(6, 'Vijay', 105, 205),(7, 'Naren', 101, 201),
(8, 'Sneha', 102, 202);
INSERT INTO Departmentss  VALUES (101, 'IT'),(102, 'HR'),(103, 'Finance'),(104, 'Marketing'),(105, 'Sales');

INSERT INTO Designations  VALUES(201, 'Software Developer'),(202, 'HR Executive'),(203, 'Accountant'),(204, 'Marketing Executive'),(205, 'Sales Executive');

INSERT INTO Salaries  VALUES(501, 1, 40000, 5000),(502, 2, 45000, 6000),(503, 3, 35000, 4000),(504, 4, 50000, 7000),(505, 5, 38000, 4500),(506, 6, 32000, 3000),(507, 7, 42000, 5500),
(508, 8, 36000, 3500);

INSERT INTO Locations  VALUES(301, 101, 'Chennai'),(302, 102, 'Bangalore'),(303, 103, 'Mumbai'),(304, 104, 'Hyderabad'),
(305, 105, 'Delhi');
select * from Employees;
select * from Departmentss;
select * from Designations ;
select * from Salaries ;
select * from Locations ;

select e.EmployeeName , di.DepartmentName , de.DesignationName , s.BasicSalary , s.Bonus , l.City from Employees e left join Departmentss di on di.DepartmentID  = di.DepartmentID left join Designations de on e.DesignationID = de.DesignationID left join Salaries s on e.EmployeeID = s.EmployeeID left join  Locations l on di.DepartmentID = l.DepartmentID;

-- Write a SQL query using multiple JOINs to display:
-- CustomerName, OrderDate, ProductName, CategoryName, Quantity, Price
-- Display all products purchased by each customer.

create table Customers(CustomerID int, CustomerName varchar(100), City int);
alter table Customers modify column City varchar(70);

create table Orders(OrderID int, CustomerID int, OrderDate date);

create table OrderDetails(OrderDetailID int, OrderID int, ProductID int, Quantity int);

create table Products(ProductID int, ProductName varchar (120), CategoryID int, Price decimal(10,2) );

create table Categories(CategoryID int, CategoryName  varchar(120));
DESC Customers;

INSERT INTO Customers VALUES(1, 'Arun', 'Chennai'),(2, 'Rahul', 'Bangalore'),(3, 'Priya', 'Mumbai'),(4, 'Naren', 'Hyderabad'),(5, 'Divya', 'Delhi');

INSERT INTO Orders VALUES(101, 1, '2026-08-01'),(102, 2, '2026-08-05'),(103, 3, '2026-08-10'),(104, 1, '2026-08-15'),(105, 4, '2026-08-20'),(106, 5, '2026-08-25');

INSERT INTO OrderDetails VALUES(1001, 101, 201, 2),(1002, 101, 202, 1),(1003, 102, 203, 3),(1004, 103, 204, 2),(1005, 104, 201, 1),(1006, 105, 205, 4),(1007, 106, 202, 2);

INSERT INTO Products VALUES(201, 'Laptop', 301, 55000.00),(202, 'Mouse', 302, 800.00),(203, 'Keyboard', 302, 1500.00),(204, 'Monitor', 301, 12000.00),(205, 'Headphones', 303, 2500.00);

INSERT INTO Categories VALUES(301, 'Computers'),(302, 'Accessories'),(303, 'Audio');
select * from Customers;
select * from Orders;
select * from OrderDetails;
select * from Products;
select * from categories;
select c.CustomerName , o.OrderDate, p.ProductName, cat.CategoryName, od.Quantity, p.Price from Customers c left join Orders o on c.CustomerID = o.CustomerID join Orderdetails od on o.OrderID = od.OrderID join Products p on od.ProductID = p.ProductID join Categories cat on  p.CategoryId = cat.CategoryID order by OrderDate asc;

-- Task 4 – Hospital Management System
-- Write a query using JOINs to display:
-- PatientName, DoctorName, DepartmentName, AppointmentDate, MedicineName, Dosage
-- Display patient appointment and prescription details.
create table Patients(PatientID int, PatientName varchar(60), Gender varchar(29), DoctorID int);
create table Doctors(DoctorID int, DoctorName varchar(60), DepartmentID int);
create table Departmentsdr(DepartmentdrID int, DepartmentdrName varchar(100));
drop table Departmentsdr;
create table Appointments(AppointmentID int, PatientID int, DoctorID int, AppointmentDate date);
create table Prescriptions(PrescriptionID int, AppointmentID int, MedicineID int, Dosage varchar(120));
create table Medicines  (MedicineID  int , MedicineName varchar(100));

INSERT INTO Patients VALUES(1, 'Ravi', 'Male', 101),(2, 'Anitha', 'Female', 102),(3, 'Suresh', 'Male', 103),(4, 'Divya', 'Female', 104),(5, 'Vijay', 'Male', 101),(6, 'Sneha', 'Female', 105),(7, 'Arun Kumar', 'Male', 102),
(8, 'Kavya', 'Female', 103);

INSERT INTO Doctors  VALUES(101, 'Dr. Arun', 1),(102, 'Dr. Priya', 2),(103, 'Dr. Karthik', 3),(104, 'Dr. Meena', 4),(105, 'Dr. Rahul', 5);
INSERT INTO Departmentsdr  VALUES(1, 'Cardiology'),(2, 'Neurology'),(3, 'Orthopedics'),(4, 'Pediatrics'),(5, 'Dermatology');
INSERT INTO Appointments
 VALUES(1001, 1, 101, '2026-09-01'),(1002, 2, 102, '2026-09-01'),(1003, 3, 103, '2026-09-02'),(1004, 4, 104, '2026-09-02'),(1005, 5, 101, '2026-09-03'),(1006, 6, 105, '2026-09-03'),
(1007, 7, 102, '2026-09-04'),(1008, 8, 103, '2026-09-04'),(1009, 1, 101, '2026-09-05'),(1010, 3, 103, '2026-09-05');
INSERT INTO Prescriptions VALUES(5001, 1001, 201, '500mg twice daily'),(5002, 1001, 206, '20mg once daily'),(5003, 1002, 202, '75mg once daily'),(5004, 1003, 204, '400mg twice daily'),
(5005, 1004, 203, '500mg three times daily'),(5006, 1005, 201, '500mg twice daily'),(5007, 1006, 205, '10mg once daily'),(5008, 1007, 202, '75mg once daily'),(5009, 1008, 204, '400mg once daily'),
(5010, 1009, 206, '20mg once daily');
INSERT INTO Medicines  VALUES(201, 'Paracetamol'),(202, 'Aspirin'),(203, 'Amoxicillin'),(204, 'Ibuprofen'),(205, 'Cetirizine'),
(206, 'Omeprazole');
select * from Patients;
select * from Doctors;
select * from Departmentsdr;
select * from Appointments;
select * from Prescriptions;
select* from Medicines;
-- Write a query using JOINs to display:
-- PatientName, DoctorName, DepartmentName, AppointmentDate, MedicineName, Dosage
-- Display patient appointment and prescription details.
select  DISTINCT p.PatientName , d.DoctorName , dr.DepartmentdrName , a.AppointmentDate , me.MedicineName , pr.Dosage from Patients p inner join Doctors d on p.DoctorID = d.DoctorID inner join  Departmentsdr dr on dr.DepartmentdrID = d.DepartmentID inner join
Appointments a on p.PatientID = a.PatientID and d.DoctorID = a.DoctorID inner join Prescriptions Pr on a.AppointmentID = pr.AppointmentID inner join Medicines me on pr.MedicineID = me.MedicineID ; 

-- Task 5 – Company Project Management
-- Write a SQL query using multiple JOINs to display:
-- EmployeeName, DepartmentName, ProjectName, AssignedDate, ManagerName
-- Display employees, their departments, projects, assignment dates, and department managers.
create table Employees5(EmployeeID int , EmployeeName varchar(100), DepartmentID int);
create table Departments5(DepartmentID int, DepartmentName varchar(100));
create table Projects5(ProjectID int, ProjectName varchar(90), DepartmentID int);
create table EmployeeProjects5(EmployeeID int, ProjectID int, AssignedDate date);
create table Managers5(ManagerID int , ManagerName varchar(80), DepartmentID int);
INSERT INTO Employees5 VALUES(101, 'Alice', 1),(102, 'Bob', 1),(103, 'Charlie', 2),(104, 'David', 3),(105, 'Eva', 4),
(106, 'Frank', 5),(107, 'Grace', 1),(108, 'Henry', 2),(109, 'Irene', 3),(110, 'Jack', 5);

INSERT INTO Departments5  VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Marketing'),(5, 'Sales');

INSERT INTO Projects5 VALUES(201, 'Website Development', 1),(202, 'Mobile Application', 1),(203, 'Employee Recruitment', 2),(204, 'Payroll System', 3),
(205, 'Marketing Campaign', 4),(206, 'Sales Dashboard', 5),(207, 'Database Migration', 1),(208, 'Financial Analysis', 3);

INSERT INTO EmployeeProjects5  VALUES(101, 201, '2026-01-10'),(101, 202, '2026-02-15'),(102, 201, '2026-01-20'),(102, 207, '2026-03-01'),(103, 203, '2026-01-12'),(104, 204, '2026-02-05'),
(104, 208, '2026-03-10'),(105, 205, '2026-01-25'),(106, 206, '2026-02-20'),(107, 202, '2026-03-05'),(107, 207, '2026-03-15'),(108, 203, '2026-02-10'),(109, 208, '2026-04-01');

INSERT INTO Managers5  VALUES(301, 'John', 1),(302, 'Sarah', 2),(303, 'Michael', 3),(304, 'Robert', 4),(305, 'Jennifer', 5);
select * from Employees5;
select * from Departments5;
select * from Projects5;
select * from EmployeeProjects5;
select * from Managers5;

select e5.EmployeeName , d5.DepartmentName , p5.ProjectName , ep5.AssignedDate , m5.ManagerName from Employees5 e5 join Departments5 d5 on e5.DepartmentID = d5.DepartmentID 
join EmployeeProjects5 ep5 on e5.EmployeeID = ep5.EmployeeID  join Projects5 p5 on p5.ProjectID = ep5.ProjectID  join Managers5 m5  on d5.DepartmentID = m5.DepartmentID ;


-- using sub query
-- Task 1 – Students and Marks
-- Write a query using a subquery to find students who scored more than the average marks of all students.
-- Display:StudentName, Marks
create table Students11(StudentID int, StudentName varchar(70), CourseID int);
create table Courses11(CourseID int, CourseName varchar(100));
create table Subjects11(SubjectID int, SubjectName varchar(90));
create table Marks11(MarkID int, StudentID int, SubjectID int, Marks int);

INSERT INTO Students11  VALUES(101, 'Arun', 1),(102, 'Bala', 1),(103, 'Charan', 2),(104, 'Deepak', 2),(105, 'Karthik', 3),(106, 'Manoj', 3),
(107, 'Naveen', 4),(108, 'Praveen', 4),(109, 'Rahul', 5),(110, 'Suresh', 5);

INSERT INTO Courses11  VALUES(1, 'Computer Science'),(2, 'Information Technology'),(3, 'Mechanical Engineering'),(4, 'Electrical Engineering'),
(5, 'Business Administration');

INSERT INTO Subjects11  VALUES(201, 'Java Programming'),(202, 'Database Management'),(203, 'Web Development'),
(204, 'Computer Networks'),(205, 'Operating Systems');

INSERT INTO Marks11 (MarkID, StudentID, SubjectID, Marks) VALUES(1, 101, 201, 85),(2, 101, 202, 90),(3, 101, 203, 78),(4, 102, 201, 72),(5, 102, 202, 88),
(6, 102, 204, 81),(7, 103, 201, 91),(8, 103, 203, 86),(9, 103, 205, 79),(10, 104, 202, 75),(11, 104, 203, 89),(12, 105, 201, 68),
(13, 105, 204, 74),(14, 106, 202, 82),(15, 106, 205, 77),(16, 107, 203, 93),(17, 107, 204, 87),(18, 108, 201, 80),(19, 108, 205, 85),(20, 109, 202, 76),
(21, 109, 203, 84),(22, 110, 204, 90),(23, 110, 205, 88);

select * from Students11;
select * from Courses11;
select * from Subjects11;
select * from Marks11;

select s11.StudentName , m11.Marks from Students s11 join Marks m11  where Marks > (select avg(Marks) from Marks m11 where StudentID=m11.StudentID);

-- task2  – Employee Salary
-- Write a query using a subquery to find employees whose salary is greater than the average salary of all employees.
-- Display:EmployeeName, BasicSalary
create table Employees22(EmployeeID int, EmployeeName varchar(80), DepartmentID int);
create table Departments22(DepartmentID int, DepartmentName varchar(60));
create table Salaries22(SalaryID int, EmployeeID int, BasicSalary decimal(10,2));
create table Designations22(DesignationID int, DesignationName varchar(80));
create table EmployeeDesignations22(EmployeeID int, DesignationID int);

INSERT INTO Employees22  VALUES
(101, 'Arun', 1),
(102, 'Bala', 1),
(103, 'Charan', 2),
(104, 'Deepak', 2),
(105, 'Karthik', 3),
(106, 'Manoj', 3),
(107, 'Naveen', 4),
(108, 'Praveen', 4),
(109, 'Rahul', 5),
(110, 'Suresh', 5);

INSERT INTO Departments22 VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

INSERT INTO Salaries22 VALUES
(1, 101, 55000.00),
(2, 102, 45000.00),
(3, 103, 40000.00),
(4, 104, 50000.00),
(5, 105, 60000.00),
(6, 106, 48000.00),
(7, 107, 52000.00),
(8, 108, 47000.00),
(9, 109, 65000.00),
(10, 110, 42000.00);

INSERT INTO Designations22  VALUES
(201, 'Software Developer'),
(202, 'Senior Developer'),
(203, 'HR Executive'),
(204, 'HR Manager'),
(205, 'Accountant'),
(206, 'Finance Manager'),
(207, 'Marketing Executive'),
(208, 'Marketing Manager'),
(209, 'Sales Executive'),
(210, 'Sales Manager');

INSERT INTO EmployeeDesignations22 (EmployeeID, DesignationID) VALUES
(101, 201),
(102, 202),
(103, 203),
(104, 204),
(105, 205),
(106, 206),
(107, 207),
(108, 208),
(109, 209),
(110, 210);

select * from Employees22;
select * from Departments22;
select * from Salaries22;
select * from Designations22;
select * from EmployeeDesignations22 ;

select e22.EmployeeName , s22.BasicSalary from Employees22 e22 join Salaries22 s22 on e22.EmployeeID = s22.EmployeeID where s22.BasicSalary > (select avg(BasicSalary) from Salaries22  );



-- Task 3 – Product and Category
-- Write a query using a subquery to find products whose price is greater than the average price of products in the same category.
-- Display:ProductName, Price, CategoryID
create table products33(ProductID int primary key , ProductName varchar(70), CategoryID int, Price decimal (10,2));
create table Categories33(CategoryID int primary key, CategoryName varchar(90));
create table Customers33(CustomerID int primary key, CustomerName varchar(90));
create table Orders33(OrderID int primary key, CustomerID int);
create table OrderDetails33(OrderDetailID int, OrderID int, ProductID int, Quantity int);

INSERT INTO Products33  VALUES(101, 'Laptop', 1, 55000),(102, 'Smartphone', 1, 25000),(103, 'Headphones', 1, 3000),(104, 'T-Shirt', 2, 800),
(105, 'Jeans', 2, 1800),(106, 'SQL Book', 3, 600),(107, 'Java Book', 3, 750),(108, 'Mixer Grinder', 4, 4500),
(110, 'Cricket Bat', 5, 2500);

INSERT INTO Categories33  VALUES(1, 'Electronics'),(2, 'Clothing'),
(3, 'Books'),(4, 'Home Appliances'),(5, 'Sports');

INSERT INTO Customers33 (CustomerID, CustomerName) VALUES(201, 'Arun'),(202, 'Bala'),(203, 'Charan'),
(204, 'Deepak'),(205, 'Karthik'),(206, 'Manoj'),(207, 'Naveen'),(208, 'Praveen');

INSERT INTO Orders33 (OrderID, CustomerID) VALUES(301, 201),(302, 202),(303, 203),(304, 201),(305, 204),(306, 205),(307, 206),
(308, 207),(309, 208);

INSERT INTO OrderDetails33 (OrderDetailID, OrderID, ProductID, Quantity) VALUES(1, 301, 101, 1),(2, 301, 103, 2),(3, 302, 102, 1),(4, 302, 106, 2),(5, 303, 104, 3),(6, 303, 105, 1),
(7, 304, 107, 2),(8, 305, 108, 1),(9, 305, 110, 2),(10, 306, 109, 1),(11, 307, 103, 1),(12, 307, 106, 3),(13, 308, 110, 1),
(14, 309, 101, 1),(15, 309, 102, 2);

select*  from Products33;
select * from Categories33;
select * from Customers33;
select * from Orders33;
select * from OrderDetails33;

select ProductName , Price , CategoryID from Products p33 where Price > ( select avg(Price) from  Products where CategoryID = p33.CategoryID );

-- Task 4 – Employee Salary
-- Write a query using a subquery to find employees who earn more than the average salary of their own department.
-- Display:EmployeeName, Salary, DepartmentID
create table Employees1(EmployeeID int, EmployeeName varchar(100), DepartmentID int, Salary decimal (10,2));
create table Departments1(DepartmentID int, DepartmentName varchar(100));
create table Projects1(ProjectID int, ProjectName varchar(120), DepartmentID int);
create table EmployeeProjects1(EmployeeID int, ProjectID int);
INSERT INTO Employees1 
VALUES(101, 'Arun', 1, 55000),(102, 'Rahul', 1, 60000),(103, 'Priya', 2, 45000),(104, 'Naren', 3, 70000),(105, 'Divya', 4, 50000),(106, 'Karthik', 5, 48000),(107, 'Sneha', 3, 65000),
(108, 'Vijay', 1, 75000);
INSERT INTO Departments1 
VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance'),(4, 'Marketing'),(5, 'Sales');
INSERT INTO Projects1
VALUES(201, 'Website Development', 1),(202, 'Mobile Application', 1),(203, 'Employee Recruitment', 2),(204, 'Financial Analysis', 3),(205, 'Marketing Campaign', 4),
(206, 'Sales Dashboard', 5);
INSERT INTO EmployeeProjects1
VALUES(101, 201),(101, 202),(102, 201),(103, 203),(104, 204),(105, 205),(106, 206),(107, 204),(108, 201),(108, 202);
select * from Employees1;
select * from Departments1;
select*from Projects1;
select * from EmployeeProjects1;

select e.EmployeeName , e.Salary , e.DepartmentID from Employees1 e where Salary > (select avg(Salary) from Employees1 where DepartmentID = e.DepartmentID );
 
 -- Task 5 – Customers and Orders
 -- Write a query using a subquery to find customers who have placed more orders than the average number of orders placed by customers.
-- Display:CustomerID, CustomerName, TotalOrders

create table  Customers55(CustomerID int, CustomerName varchar(80), City varchar(70));
create table Orders55(OrderID int, CustomerID int, OrderDate date);
create table OrderDetails55(OrderDetailID int, OrderID int, ProductID int, Quantity varchar(70));
create table Products55(ProductID int, ProductName varchar(80), Price decimal (10,2));
create table Categories55(CategoryID int, CategoryName varchar(80));

INSERT INTO Customers55 VALUES
(101, 'Arun', 'Chennai'),
(102, 'Bala', 'Bangalore'),
(103, 'Charan', 'Hyderabad'),
(104, 'Deepak', 'Chennai'),
(105, 'Karthik', 'Mumbai'),
(106, 'Manoj', 'Delhi'),
(107, 'Naveen', 'Chennai'),
(108, 'Praveen', 'Pune');

INSERT INTO Orders55 VALUES
(201, 101, '2026-01-10'),
(202, 102, '2026-01-15'),
(203, 103, '2026-02-05'),
(204, 101, '2026-02-20'),
(205, 104, '2026-03-01'),
(206, 105, '2026-03-12'),
(207, 106, '2026-03-25'),
(208, 107, '2026-04-05'),
(209, 108, '2026-04-15');

INSERT INTO Products55 VALUES
(301, 'Laptop', 55000),
(302, 'Smartphone', 25000),
(303, 'Headphones', 3000),
(304, 'Keyboard', 1500),
(305, 'Mouse', 800),
(306, 'Monitor', 12000),
(307, 'Printer', 9000),
(308, 'Tablet', 18000),
(309, 'Webcam', 4000),
(310, 'Speaker', 3500);

INSERT INTO OrderDetails55 VALUES
(1, 201, 301, 1),
(2, 201, 303, 2),
(3, 202, 302, 1),
(4, 202, 305, 2),
(5, 203, 306, 1),
(6, 203, 309, 1),
(7, 204, 308, 1),
(8, 205, 304, 2),
(9, 205, 305, 3),
(10, 206, 307, 1),
(11, 206, 310, 2),
(12, 207, 301, 1),
(13, 208, 302, 2),
(14, 208, 303, 1),
(15, 209, 306, 1);

INSERT INTO Categories55 VALUES
(1, 'Electronics'),
(2, 'Computers'),
(3, 'Accessories'),
(4, 'Office Equipment'),
(5, 'Mobile Devices');

select * from Customers55;
select * from Orders55;
select * from  Products55;
select * from OrderDetails55;
select * from Categories55;

select c55.CustomerID, c55.CustomerName, count(OrderID) as TotalOrders  from Customers55 c55 join Orders55 o55 on c55.CustomerID = o55.CustomerID group by c55.CustomerID , c55.CustomerName
 having count(o55.OrderID) > ( select avg(Ordercount) FROM (SELECT COUNT(OrderID) AS OrderCount FROM Orders55 GROUP BY CustomerID ) AS CustomerOrders);