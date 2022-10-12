use Company;

--salary > E05.salary


--the longer method
select * from Employee 
where Eno = 'E05';

select * from Employee
where Salary > 46000;

--the complicated method
select * from Employee
where Salary > (select Salary from Employee where Eno = 'E05'); --the part inside the brackets is called the Inner Query. The rest is the Outer Query

select * from Employee;

--Q in slide 17
use Company;

Create table Customer (CustomerID varchar(10) primary key, Name varchar(20), Address varchar(20), TP int)

insert into Customer values ('C1', 'Gayan', 'Pliyandala', 0772569014);
insert into Customer values ('C2', 'Waruna','Galle', 0772569016);
insert into Customer values ('C3', 'Tom', 'New york', 0715694781);
insert into Customer values ('C4', 'David', 'Washington', 0715894562);
insert into Customer values ('C5', 'Dutch', 'Washington', 0772584785);

Create table Product (ProdID varchar(10) primary key, Product_Name varchar(20), Unit_Price int);
insert into Product values ('P1', 'Apple', 45);
insert into Product values ('P2', 'Orange', 55);
insert into Product values ('P3', 'Grapes', 10);
insert into Product values ('P4', 'Pine Apple', 100);
insert into Product values ('P5', 'Mango', 150);
insert into Product values ('P6', 'Berry', 450);
insert into Product values ('P7', 'Sweet Orange', 78);
insert into Product values ('P8', 'Wood Apple', 50);

Create table Orders (OrderID varchar(10) primary key, CID varchar(10), Orderdate date, Total int, Foreign Key (CID) references Customer (CustomerID));

insert into Orders values ('O1', 'C1', '2019-06-12', 9500);
insert into Orders values ('O2', 'C1', '2019-06-15', 2500);
insert into Orders values ('O3', 'C2', '2019-06-12', 19500);
insert into Orders values ('O4', 'C3', '2019-06-11', 7500);
insert into Orders values ('O5', 'C1', '2019-07-12', 2650);
insert into Orders values ('O6', 'C4', '2019-07-15', 7800);
insert into Orders values ('O7', 'C2', '2019-07-22', 4578);
insert into Orders values ('O8', 'C2', '2019-02-22', 14000);
insert into Orders values ('O9', 'C3', '2019-08-22', 2250);
insert into Orders values ('O10', 'C2', '2019-07-22', 9500);


Create table OrderItem (RECID int IDENTITY primary key, OID varchar(10), PID varchar(10), Unit_Price int, Quantity int, Foreign Key (OID) references Orders (OrderID), 
Foreign Key (PID) references Product (ProdID)); --identity autoincrements its value, passing in the value from the insert is also not required

insert into OrderItem values ('O1', 'P1', 45, 15);
insert into OrderItem values ('O1', 'P2', 55, 25);
insert into OrderItem values ('O1', 'P7', 78, 18);
insert into OrderItem values ('O1', 'P8', 50, 12);
insert into OrderItem values ('O2', 'P6', 450, 10);
insert into OrderItem values ('O2', 'P3', 10, 150);
insert into OrderItem values ('O3', 'P7', 78, 20);
insert into OrderItem values ('O4', 'P2', 55, 12);
insert into OrderItem values ('O4', 'P3', 10, 22);
insert into OrderItem values ('O4', 'P8', 50, 40);

select * from Customer;
select * from Product;
select * from Orders;
select * from OrderItem; 
