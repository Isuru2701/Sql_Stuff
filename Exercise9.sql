--Question 1

--1
create database Keells100;

use Keells100;

--2
create table Store
(Store_name varchar(20) primary key,
Sales varchar(20),
St_Manager varchar(20)
);

--3
insert into Store
values
('Colombo', '12000', 'Perera'),
('Kandy', '8000', 'Silva'),
('Galle', '10500', 'Mapa'),
('Kurunegala', '5800', 'Perera'),
('Gampaha', '7000', 'Silva');

--4
--i
--a
select * from Store;
--b
select Store_name, Sales from Store
where sales > 6000;
--c
select Store_name, Sales from Store
where St_Manager in ('Silva', 'Perera');

--ii
update Store 
set Sales='10000'
where Store_name='Gampaha';

--iii
delete from Store 
where Store_name = 'Kurunegala';

--iv
alter table Store
add telephone int;

--v
truncate table Store;

--vi
drop table Store;

--Question 2
--1
create database Bank;

--2
use Bank;

create table Loan
(
LoanNo int PRIMARY KEY,
BranchName varchar(15),
Amount int,
Date date,
CustomerName varchar(20)
);

--3
insert into Loan
Values
(1, 'Colombo', 1000000, '2016-01-01', 'Ajith'),
(2, 'Kandy', 2000000, '2017-02-05', 'Waruna'),
(3, 'Galle', 5000000, '2016-01-26', 'Pathum'),
(4, 'Colombo', 4500000, '2016-02-22', 'Saman'),
(5, 'Galle', 2500000, '2016-01-31', 'Amali'),
(6, 'Matara', 1250000, '2016-07-12', 'Wasana');

--4
select * from Loan;
--5
select BranchName from Loan;
--6
select LoanNo, BranchName from Loan;
--7
select * from Loan
where BranchName = 'Colombo' or BranchName = 'Galle';
--8
select LoanNo from Loan
where Amount between 1000000 and 2500000;
--9
select LoanNo from Loan
where Amount > 2000000 and branchName ='Colombo';

--10
select LoanNo, BranchName from Loan
where Ldate between '2016-01-01' and '2016-06-31';


--11
select * from Loan
where CustomerName like 'A%';

--12 
delete from Loan
where LoanNo = '1';

--13
truncate table Loan;

--14 
drop table Loan;

--Question 3
--1
create database Market;

--2 
use Market;

create table Supplier
(
Sno int PRIMARY KEY,
Name varchar(20),
Status int,
City varchar(20)
);

--3
Insert into Supplier
Values
(1, 'Malith', 20, 'Matara'),
(2, 'Supun', 10, 'Galle'),
(3, 'Dasun', 30, 'Galle'),
(4, 'Chamidu', 40, 'Matara'),
(5, 'Isuru', 10, 'Kandy');

--4
--i
select * from Supplier;

--ii
select City form Supplier;

--iii 
select * from Supplier
where City = 'Galle';

--iv
select name from Supplier
where City = 'Kandy';

--v
select * from Supplier
where status > 20;

--vi
update Supplier
set city='Colombo'
where Sno=1;

--vii
update Supplier
set status=40
where city = 'Matara';
