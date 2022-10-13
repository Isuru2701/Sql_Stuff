--1
create database BankP;
--2
use BankP;

create table ACCOUNT_TYPE
(CODE VARCHAR(10) PRIMARY KEY,
NAME VARCHAR(25),
INTEREST_RATE DECIMAL(3,2)
);
--3
create table ACCOUNT
(
ACCOUNT_NO INT,
BALANCE FLOAT,
BCODE VARCHAR(10),
BNUMBER INT,
);

--4
alter table ACCOUNT_TYPE
add DESCRIPTION VARCHAR(30);

--5
alter table ACCOUNT 
add ATYPE VARCHAR(10) REFERENCES ACCOUNT_TYPE(CODE);

--6
insert into ACCOUNT_TYPE
VALUES
('CHECK', 'Standard Checking', 7.00, 'Personal checking account');

insert into ACCOUNT
VALUES
('2345565476', 34456.98, 'Asian', 5, 'CHECK');

--7
select * from ACCOUNT;

--8
select ACCOUNT_NO from  ACCOUNT
where balance > 10000;


--9
select account_no, balance from ACCOUNT 
where BCODE like 'A%';

--10
select account_no from account 
where balance between 10000 and 50000;

--11
select account_no, balance from Account;

--12
update ACCOUNT_TYPE
set INTEREST_RATE = 7.5
where CODE = 'SAVING';


--13
select account_no, balance, interest_rate
from Account inner join ACCOUNT_TYPE
on Account.Atype = ACCOUNT_TYPE.CODE;

--14
select bcode, sum(balance) from ACCOUNT
group by bcode;

--15
select account_no, min(balance) from ACCOUNT
group by account_no;

--16
select * from account 
order by Bcode;


--17
select account_no, atype, name from ACCOUNT inner join ACCOUNT_TYPE
on atype = code
order by balance;

--18
USE BankP;  
GO  
CREATE PROCEDURE checkBalance
    @balance float
AS   

    SET NOCOUNT ON;  
    SELECT *
    FROM Account
    WHERE balance > @balance
GO

--19 
exec checkBalance 6000;