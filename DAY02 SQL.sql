show databases;
create database mstore;
use mstore;
-- 1. Create a table orders (id, product_name, quantity, price).
create table orders(id int primary key , product_name varchar(30), quantity varchar(20), price decimal(10,2));
-- 2. Insert 5 orders with different values.
insert into orders values ('01','A','02',40000),('02','TV','04',50000),('03','WASHING MECHINE','03',23000),('04','MIXCI','01',100),('05','GRAINDER','10',100000);
-- 3. Select all orders where quantity > 2.
select * from orders where  quantity > 02;
select * from orders;
-- 4. Select orders where price is between 100 and 500.
select * from orders where price between 100 and 500 ;
-- 5. Fetch orders with product_name starting with 'A'.
select * from orders where product_name like 'A';
