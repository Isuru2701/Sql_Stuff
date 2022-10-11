--Question 1
--1 
Create database Store;
--2
Use Store;
--3
Create table Supplier
(
Supplier_No VarChar(10) PRIMARY KEY
Constraint s_ck check(Supplier_No like 'S%'),
Name VarChar(20) not null,
Status int not null constraint v_ck check (Status in (1,2,3)),
City Varchar(20) not null default 'Colombo');

--4
Insert into Supplier
values
('C5', 'Gimshan', 1, 'Kandy');

--5
alter table Supplier
add TP Int, NIC Varchar(10);

--6
alter table Supplier
alter column tp Varchar(10);

--7
alter table Supplier
drop column TP;

--8
truncate table Supplier;

--9
exec sp_columns Supplier;

--10
exec sp_rename 'Supplier', 'Supplier_Master';

--11
drop table Supplier_Master;

--12
use master; -- move out
drop database Store;


-- Question 2
--1 
create database Supermarket;

--2 
use supermarket;

--3 
create table Invoice
(
Invoice_No Varchar(10) PRIMARY KEY,
Name Varchar(20) not null,
Inv_Date Date default getdate()
);

create table Sales_Person
(
Emp_No Varchar(10) PRIMARY KEY,
Emp_Name Varchar(20) not null
);

create table Customer
(
Cus_No Varchar(10) PRIMARY KEY,
Cus_Name Varchar(20) not null,
Status int not null constraint s_check check (Status in (1,2,3))
);

create table Orders
(
Order_Id varchar(10) primary key,
Invoice_No varchar(10) references Invoice(Invoice_No),
Emp_No varchar(10) references Sales_Person(Emp_No),
Cus_No varchar(10) references Customer(Cus_No),
Sales_Date Date default getdate()
);

--4
insert into Invoice
Values
('I3', 'ABC', '2008-01-02');

insert into Sales_Person 
Values
('E1', 'James'),
('E2', 'Jack'),
('E3', 'John');

insert into Customer
values
('C1', 'Sally', 1),
('C2', 'Lucy', 2),
('C3', 'Harry', 3);

insert into Orders
values
('O4', 'I1', 'E2', 'C1', '2022-01-02');

select * from Orders;
