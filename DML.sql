create database Company;
use Company;

create table Client
(
Client_Id Varchar(5) primary key,
Client_Name Varchar(20) not null,
Client_Address Varchar(20),
TP int,
Balance_Due int,
Order_Date date
);

-- Data Manipulation Language
	-- Insert
	-- Update
	-- Delete 
	-- Select
--1. How to insert data into a table
Insert into Client
values
('C100', 'Amali', 'Colombo', 072568091, 5000, '2012-04-20'),
('C200', 'Gayan', 'Galle', 071220320, 15000, '2012-12-21'),
('C400','Ashan', 'Colombo', 0722948293, 15000, '2012-05-11'),
('C500', 'Kamala', 'Kandy', 0722948123, 17500, '2013-05-11'),
('C600', 'Waruna', 'Galle', 0722432293, 18500, '2012-06-11'),
('C700', 'Sadun', 'Kandy', 0722948293, 15000, '2012-05-11');

-- missing order date
Insert into Client
(Client_Id, Client_Name, Client_Address, TP, Balance_Due)
values
('C300', 'Pathum', 'Matara', 0722569025, 14000);


--2. Changing previously entered data

-- this is bad practice
update Client set Client_Address = 'Matara'
where Client_Name = 'Amali';

-- use this method to update a particular instance of data
update CLient
set Client_Address = 'Matara'
where Client_Id = 'C100';

update Client
set Balance_Due = 45000
where Client_Address = 'Kandy';

-- changing balance due of C200 client:
update Client
set Balance_Due = 18900
where Client_Id = 'C200';



-- changing multiple values at once
update Client
set Client_Address = 'Kurunagala', Balance_Due = 20000
where Client_Id = 'C300';

-- updating balance_due by 10% of all clients
update Client
set Balance_Due = Balance_Due * 1.1;

update Client
set Balance_Due = Balance_Due * 1.15
where Client_Id = 'C100';

Select * from Client;

-- deleting data
delete from Client where Client_Id='C100';

-- delete all the data from the table but preserves the table structure
-- for deleting the data, it is better to use truncate
-- as truncate locks the entire table and erases it, whilst delete locks each row to perform the erasure.
delete from Client;

--4. Selecting from table
select * from Client; -- * means all columns

select Client_Name, TP
from Client;

	-- filtering

	--fetch all columns where the client_id is of a certain value
select * 
from Client
where Client_Id = 'C100';

select Client_Name, TP, Balance_Due from Client
where Client_Id = 'C200';

	--ordering fetched data
select Client_Name, Client_Address from Client
where Client_Address like 'C%'
order by Client_Name;

select * from Client
order by Order_Date desc;

Insert into Client
values
('C800', 'Amali', 'Colombo', 072568091, 5000, '2012-04-20');
delete from Client where Client_Id = 'C800';
-- removes duplicate data (like a set, maybe)
select distinct Client_Name from Client;


-- Display the client names and addresses who have a balance greater than 5000
select Client_Name, Client_Address from Client 
where Balance_Due > 5000;

-- Display all the details of clients who have the balance less than or equal to 15000
select * from Client where Balance_Due <= 15000;