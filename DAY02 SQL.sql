show databases;
create database mstore;
use mstore;
create table orders(id int, product_name varchar(30), quantity varchar(20), price int);
select * from orders;
insert into orders values ('01','A','02','40000'),('02','TV','04','50000'),('03','WASHING MECHINE','03','23000'),('04','MIXCI','01','1000000'),('05','GRAINDER','10','100000');
select * from orders where  quantity > 02;
select * from orders where price between 10000 and 25000 ;
select * from orders where product_name like 'A';
