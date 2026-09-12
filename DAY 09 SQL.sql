show databases;
drop database sample;
create database sample;
use sample;

-- 1: Create a stored procedure to add a new customer.
CREATE TABLE Customers (CustomerID INT PRIMARY KEY,CustomerName VARCHAR(50),City VARCHAR(50),Phone VARCHAR(15),Email VARCHAR(100),
Age INT);
delimiter $$
create procedure NewCustomer (
in C_CustomerID int , in C_CustomerName varchar(50),C_City varchar(50),C_Phone varchar(15),C_Email varchar(100), C_Age int )
begin
insert into Customers   values  (C_CustomerID, C_CustomerName, C_City, C_Phone, C_Email, C_Age) ;
end $$ 
delimiter ;
call NewCustomer (101,'NAREN','CHENNAI',9656283858,'abc@gmail.com',40);
call NewCustomer (102,'DHIVAN','CHENNAI',686868777,'bcc@gmail.com',34);
call NewCustomer(103,'ARUN','PERAMBUR',55655898,'jfjfj@gamil.com',56);
select * from Customers;

-- 2: Create a stored procedure to retrieve customer details by CustomerID.
delimiter $$
create procedure Getdetails( in C_CustomerID int)
begin
select * from Customers where CustomerID = C_CustomerID;
end $$
delimiter  ;
call  Getdetails (102);

-- 3: Create a stored procedure to update a customer's email and phone number.
delimiter $$
create  procedure UpdateCus (    IN C_CustomerID INT, in C_Email varchar (100), in C_Phone int)
begin
update Customers set Email = C_email , Phone = C_phone where CustomerID = C_CustomerID ;
end $$
delimiter ;
drop procedure UpdateCus;
call UpdateCus (101,'NAREN@gmail.com',87238234);
select * from Customers;

-- 4: Create a stored procedure to get all customers from a specific city.
 delimiter $$
 create procedure getCity ( C_city varchar(50))
 begin
 select * from  Customers where City = C_city ;
 end $$
 delimiter ;
call getCity('CHENNAI');

-- 5: Create a stored procedure to delete a customer by CustomerID.
delimiter $$
create procedure deleteCus (in C_CustomerID int)
begin 
delete from Customers where CustomerID = C_CustomerID ;
end $$ 
delimiter  ; 
call deleteCus (103);
select * from Customers;

-- 6: Create a stored procedure to list customers registered within a given date range.
CREATE TABLE Customers1 (CustomerID INT PRIMARY KEY,CustomerName VARCHAR(50),City VARCHAR(50),Phone VARCHAR(15),Email VARCHAR(100),
Age INT, JOiningDate date);
INSERT INTO Customers1
VALUES
(104, 'Keerthish', 'BANGLORE', 85384583, 'kshxj@gmail.com', 24, '2035-10-12'),
(105, 'Ramesh', 'CHENNAI', 98765432, 'ramesh@gmail.com', 25, '2025-02-15'),
(106, 'Arun', 'PERAMBUR', 87654321, 'arun@gmail.com', 26, '2025-05-20'),
(107, 'Karthik', 'MADURAI', 76543210, 'karthik@gmail.com', 23, '2025-08-10');
delimiter $$
create procedure ListData(in C_StartDate date, in C_EndDate date)
begin
select * from Customers1 where JoiningDate between C_startdate and C_EndDate ;
end $$
delimiter ;
call ListData ('2025-01-24' , '2025-06-07');

-- 7: Create a stored procedure to search for customers by partial FirstName or LastName.
CREATE TABLE Customers2(CustomerID INT PRIMARY KEY,FirstName VARCHAR(50),LastName VARCHAR(50),City VARCHAR(50),Phone BIGINT,Email VARCHAR(100),
Age INT,JoiningDate DATE);
INSERT INTO Customers2
VALUES
(101, 'ARUN', 'KUMAR', 'CHENNAI', 9876543210, 'arun@gmail.com', 25, '2025-01-10'),
(102, 'DHIVAN', 'RAJ', 'BANGALORE', 9876543211, 'dhivan@gmail.com', 24, '2025-02-15'),
(103, 'KARTHIK', 'ARUN', 'MADURAI', 9876543212, 'karthik@gmail.com', 26, '2025-03-20'),
(104, 'RAMESH', 'KUMAR', 'CHENNAI', 9876543213, 'ramesh@gmail.com', 28, '2025-04-25'),
(105, 'ARAVIND', 'RAJ', 'PERAMBUR', 9876543214, 'aravind@gmail.com', 23, '2025-05-10');
delimiter $$
create procedure Findname (in C_Name varchar(50))
 begin
 select * from Customers2 where  FirstName LIKE CONCAT('%', C_Name, '%')
       OR LastName LIKE CONCAT('%', C_Name, '%');
 end $$ 
 delimiter ;
 CALL Findname ('ar');
 
 -- 8: Create a stored procedure to update a customer's entire address.
 CREATE TABLE Customers3 (CustomerID INT PRIMARY KEY,FirstName VARCHAR(50),LastName VARCHAR(50),Address VARCHAR(100),City VARCHAR(50),State VARCHAR(50),
    Pincode INT,Phone BIGINT,Email VARCHAR(100),Age INT);
    
    INSERT INTO Customers3
VALUES
(101, 'ARUN', 'KUMAR', '12 Anna Street', 'CHENNAI', 'TAMIL NADU', 600001, 9876543210, 'arun@gmail.com', 25),
(102, 'DHIVAN', 'RAJ', '25 MG Road', 'BANGALORE', 'KARNATAKA', 560001, 9876543211, 'dhivan@gmail.com', 24),
(103, 'KARTHIK', 'ARUN', '45 Gandhi Street', 'MADURAI', 'TAMIL NADU', 625001, 9876543212, 'karthik@gmail.com', 26),
(104, 'RAMESH', 'KUMAR', '78 Main Road', 'CHENNAI', 'TAMIL NADU', 600002, 9876543213, 'ramesh@gmail.com', 28);

delimiter $$
create procedure ChangeAll(in C_CustomerID int ,  IN C_Address VARCHAR(100),IN C_City VARCHAR(50),IN C_State VARCHAR(50),IN C_Pincode INT)
begin
update Customers3 set Address = C_Address , City = C_City , State = C_State , Pincode = C_Pincode where CustomerID = C_CustomerID ;
end $$
delimiter ;
call ChangeAll (103,'110 helo street ','CHENNAI','TAMIL NADU ' , 600039);
select * from Customers3;

-- 9: Create a stored procedure that returns the total number of customers.
delimiter $$
create procedure  AddCus()
begin
select count(CustomerID) as TOTALCUSTOMERS from Customers3 ;
end $$
delimiter ;
call ADDCus ();

--  10: Create a stored procedure to retrieve customers who have not provided an email address.
CREATE TABLE Customers4 (CustomerID INT PRIMARY KEY,FirstName VARCHAR(50),LastName VARCHAR(50),City VARCHAR(50),
Phone BIGINT,Email VARCHAR(100),Age INT);
INSERT INTO Customers4
VALUES
(101, 'ARUN', 'KUMAR', 'CHENNAI', 9876543210, 'arun@gmail.com', 25),
(102, 'DHIVAN', 'RAJ', 'BANGALORE', 9876543211, NULL, 24),
(103, 'KARTHIK', 'ARUN', 'MADURAI', 9876543212, 'karthik@gmail.com', 26),
(104, 'RAMESH', 'KUMAR', 'CHENNAI', 9876543213, NULL, 28),
(105, 'ARAVIND', 'RAJ', 'PERAMBUR', 9876543214, 'aravind@gmail.com', 23);
delimiter $$
create procedure FINDNULL ( )
begin
select * from Customers4 where Email is null ;
end $$ 
delimiter ;
call FINDNULL();