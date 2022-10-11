use Company;

create table Client6(
Client_No varchar(6) primary key,
Client_Name varchar(20) not null,
Client_Address varchar(30) not null,
Client_Rank char constraint rank_ck check (Client_Rank in ('A', 'B', 'C')) not null,
Balance_due decimal(8,2) constraint balanc_ck check (Balance_due > 5000 AND Balance_due < 50000) not null,
Order_date date default getdate() not null
);


insert into Client6 
(Client_No, Client_Name, Client_Address, Client_Rank, Balance_due)
Values
('C1', 'John', 'Colombo', 'A', 10000);

Select * from Client6;
