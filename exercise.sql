use Company;

create table Invoice 
(
InvNo varchar(3) primary key,
IName varchar(20),
InvDate date ,
);


create table SalesPerson
(
Emp_Id varchar(3) primary key,
Emp_Name varchar(20)
);

create table Customer
(
Cus_Id varchar(3) primary key,
CusName varchar(20),
CStatus varchar(10)
);

create table Orders
(
Order_Id  varchar(3),
Ino varchar(3),
Eno varchar(3),
Cno varchar(3),
SalesDate date,
foreign key (Ino) references Invoice(InvNo),
foreign key (Eno) references SalesPerson(Emp_Id),
foreign key (Cno) references Customer(Cus_Id),
primary key(Ino, Eno, Cno),
);

Select * from Invoice;
Select * from SalesPerson;
Select * from Customer;
Select * from Orders;