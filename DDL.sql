-- Structured query language --
	-- Data Definition Language
	-- Data Manipulation Language
	-- Data Control Language


--Data Definition Language
	--1. Creating a database:

Create Database Company;
Create Database Hotel; 

	--2. Going inside a database
Use Company;
Use Hotel;
CREATE TABLE Client
(Client_Id varchar(10) Primary key,
Client_Name varchar(20),
Client_Address varchar(20),
TP int,
Balance_Due int,
Order_Date date);

-- inserting values into a table
INSERT INTO Client(Client_Id, Client_Name, Client_Address, Balance_Due, Order_Date) values('C400', 'Harry', 'Kandy', 45000, '2007-01-02');
SELECT * FROM Client;

 -- Creating table with Constraints

 --NULL constraint
 USE Company;

 CREATE TABLE Client1
 (Client_id  VARCHAR(5) PRIMARY KEY,
 Client_Name VARCHAR(20) NOT NULL,
 Client_Address VARCHAR(20) NOT NULL,
 TP INT NOT NULL,
 Balance_Due INT NOT NULL,
 Order_Date DATE NOT NULL,
);

INSERT INTO Client1 
(Client_Id, Client_Name, Client_Address, Balance_Due, Order_Date)
VALUES
('C2', 'Gayan', 'Colombo', 4000,'2001-01-02');

SELECT * FROM Client1;

INSERT INTO Client1 
(Client_Id, Client_Name, Client_Address, Balance_Due, Order_Date)
VALUES
('C2', 'Gayan', 'Colombo', 4000,'2001-01-02');

--DEFAULT constraint
CREATE TABLE Client2
(
Client_Id VARCHAR(5) PRIMARY KEY,
Client_Name VARCHAR(20) NOT NULL,
Client_Address VARCHAR(20) NOT NULL DEFAULT 'Colombo',
TP INT NOT NULL,
Balance_Due INT NOT NULL,
Order_Date DATE NOT NULL
);

INSERT INTO Client2(Client_Id, Client_Name, TP, Balance_Due, Order_Date)
VALUES
('C1', 'Kasun', 0722948283, 40000, '2004-01-02');

SELECT * FROM Client2;

 --CHECK Constraints

 CREATE TABLE Client3
(
Client_Id VARCHAR(5) PRIMARY KEY
CONSTRAINT ck_id CHECK(Client_Id LIKE ('C%')),
Client_Name VARCHAR(20) NOT NULL,
Client_Address VARCHAR(20) NOT NULL DEFAULT 'Colombo',
TP INT NOT NULL,
Balance_Due INT NOT NULL,
Order_Date DATE NOT NULL
);

INSERT INTO Client3(Client_Id, Client_Name, TP, Balance_Due, Order_Date)
VALUES
('C1', 'Kasun', 0722948283, 40000, '2004-01-02');


-- this does not work because the Client_Id field value starts with S
INSERT INTO Client3(Client_Id, Client_Name, TP, Balance_Due, Order_Date)
VALUES
('S2', 'Kasun', 0722948283, 40000, '2004-01-02');
SELECT * FROM Client3;

--CHECK Constraint on multiple values
 CREATE TABLE Client4
(
Client_Id VARCHAR(5) PRIMARY KEY
CONSTRAINT ck_id1 CHECK(Client_Id LIKE ('C%')),
Client_Name VARCHAR(20) NOT NULL,
Client_Address VARCHAR(20) NOT NULL DEFAULT 'Colombo' CONSTRAINT ck_address CHECK (Client_Address IN ('Colombo', 'Galle', 'Kandy')),
TP INT NOT NULL,
Balance_Due INT NOT NULL,
Order_Date DATE NOT NULL
);

INSERT INTO Client4
VALUES
('C2', 'Sadun', 'Colombo', 0722948283, 4000, '2004-10-20');


-- this insertion is not allowed 
INSERT INTO Client4
VALUES
('C2', 'Sadun', 'Matara', 0722948283, 4000, '2004-10-20');

SELECT * FROM Client4;
DROP TABLE Client4;

-- Foreign key constraints

CREATE TABLE Department(
DepNo VARCHAR(5) PRIMARY KEY,
DepName VARCHAR(20) NOT NULL,
);

CREATE TABLE Employee
(EmpNo VARCHAR(3) PRIMARY KEY,
EName VARCHAR(20),
Salary INT,
Dno VARCHAR(5) REFERENCES Department(DepNo)
);

INSERT INTO Department
VALUES
('D1', 'Marketing'),
('D2', 'HR'),
('D3', 'R&D');

SELECT * FROM Department;

INSERT INTO Employee
VALUES
('E1', 'Gayan', 4000, 'D1');

INSERT INTO Employee
VALUES
('E2', 'Harrison', 4000, 'D1'),
('E3','Kasun', 5000, 'D2');

SELECT * FROM Employee WHERE Dno ='D1';

use Company;
CREATE TABLE Employee1
(EmpNo VARCHAR(3) PRIMARY KEY,
Dno VARCHAR(5), EName VARCHAR(20), Salary INT,
FOREIGN KEY (Dno) REFERENCES Department(DepNo)
);

-- Altering tables
	-- Add field
use Company;
Alter table client add fax_number int, order_amount int;
Select * from client;

Insert into client
values('C300', 'Jill', 'Galle', 0711938277, 18000, '2014-04-08', 3132, 54);


	-- Change datatype
alter table client alter column tp varchar(10);
alter table client drop column fax_number;

	--alter foreign key
create table Employee2
(
Emp_No varchar(5) primary key,
Ename varchar(20),
Salary int
);

create table Department2
(
DeptNo varchar(5) primary key,
Dname varchar(20));

alter table Employee2
add Dno varchar(5) references Department2(DeptNo);

Select * from Employee2;

	--adding and dropping a foreign key constraint

	--adding
alter table Employee2
add constraint fk_id
foreign key (Dno) references Department2 (DeptNo);

	--dropping
alter table Employee2
drop constraint fk_id;

	--deleting data and tables

	--deletes the data inside the table, but leaves the structure intact
truncate table Client;

	--deletes the entire table(with it's columns)
drop table Client;

	--produces a report on the metadata of the table
exec sp_columns Client;

use master;
drop database transactions;