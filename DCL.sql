Create database Sample;
Use Sample;
Create table Client 
(Client_Id varchar(10) Primary Key, Name varchar(20),
Address varchar(20), TP int);
insert into Client values ('C1', 'Gayan', 'Col07', 0772569014);


grant select 
on Client
to user1
with grant option;

