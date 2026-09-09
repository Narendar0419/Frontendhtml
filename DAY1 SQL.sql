
-- 1. Create a new database named schoolDB.
create database schoolDB;
use schoolDB;
-- 2.Create a students , customer, staff, Product ,user table do all ddl & dml opearation (each table min 5 columns)
CREATE TABLE Students (StudentID INT PRIMARY KEY,StudentName VARCHAR(50),Age INT,Gender VARCHAR(10),Course VARCHAR(50),Marks INT);
CREATE TABLE Customers (CustomerID INT PRIMARY KEY,CustomerName VARCHAR(50),City VARCHAR(50),Phone VARCHAR(15),Email VARCHAR(100),Age INT);
CREATE TABLE Staff (StaffID INT PRIMARY KEY,StaffName VARCHAR(50),Department VARCHAR(50),Salary DECIMAL(10,2),Gender VARCHAR(10),JoiningDate DATE);
CREATE TABLE Products (ProductID INT PRIMARY KEY,ProductName VARCHAR(100),Category VARCHAR(50),Price DECIMAL(10,2),StockQuantity INT,Brand VARCHAR(50));
CREATE TABLE Users (UserID INT PRIMARY KEY,Username VARCHAR(50),Password VARCHAR(100),Email VARCHAR(100),Role VARCHAR(30),
CreatedDate DATE );

-- 3. Insert at least 5 records into students.
INSERT INTO Students VALUES (1, 'Arun', 20, 'Male', 'BCA', 85),(2, 'Priya', 21, 'Female', 'BSc CS', 90),(3, 'Karthik', 20, 'Male', 'BCA', 75),
(4, 'Divya', 22, 'Female', 'BCom', 88), (5, 'Rahul', 21, 'Male', 'BSc CS', 70);
INSERT INTO Users VALUES(401, 'admin01', 'admin123', 'admin@gmail.com', 'Admin', '2024-01-10'),(402, 'user01', 'user123', 'user1@gmail.com', 'User', '2024-02-15'),(403, 'staff01', 'staff123', 'staff@gmail.com', 'Staff', '2024-03-20'),
(404, 'manager01', 'manager123', 'manager@gmail.com', 'Manager', '2024-04-25'),(405, 'user02', 'user456', 'user2@gmail.com', 'User', '2024-05-30');

-- 4. Run SELECT * FROM students; and view the data.
describe Students;
select * from Students ;

-- 5. Drop the schoolDB database (to practice database removal).
drop database schoolDB;
-- truncate removes all  the datas but keeps its Structure 
truncate table Students;


