use Company;

Select * from Client
where Client_Address = 'Colombo' OR Client_Address = 'Kandy';

Select * from Client
where Balance_Due >= 5000 AND Balance_Due <= 10000;

Select Client_Name, Client_Address from Client
where Balance_Due > 10000 AND Client_Address = 'Colombo';

-- exercise

Create table Employee
(Eno varchar(3) primary key,
Ename varchar(10), 
EAddress varchar(20),
Position varchar(10),
Salary int,
Dno varchar(3) references Department(DeptNo)
);

Create table Department
(
DeptNo varchar(3) primary key,
Dname varchar(10)
);

Insert into Department
Values
('D1', 'HR'),
('D2', 'Finance'),
('D3', 'MIS'),
('D4', 'PMD'),
('D5', 'Marketing'),
('D6', 'Accounts');

Insert into Employee
Values
('E01', 'Kamal', 'Colombo', 'Cashier', 15000, 'D1'),
('E02', 'Gayan', 'Galle', 'Manager', 75000, 'D1'),
('E03', 'Kasun', 'Colombo', 'Manager', 85000, 'D2'),
('E04', 'Waruna', 'Kandy', 'Cashier', 18000, 'D3'),
('E05', 'Amali', 'Kurunagala', 'Assistant', 46000, 'D2'),
('E06', 'Aravinda', 'Matara', 'Accountant',65000, 'D4'),
('E07', 'Perera', 'Jaffna', 'Sales Rep', 45000, 'D3'),
('E08', 'A', 'Galle', 'Sales Rep', 45000, 'D3'),
('E09', 'Kasuni', 'Galle', 'Manager', 55000, 'D1'),
('E10', 'Pathum', 'Kandy', 'Cashier', 58000, 'D1'),
('E11', 'Pavani', 'Matara', 'Cashier', 42000, 'D1'),
('E12', 'Anura', 'Colombo', 'Cashier', 142000, 'D2');

	--between operator
Select Eno, Position, Salary from Employee where Salary between 25000 and 50000;
	
	--in operator
Select Eno, Position, Salary from Employee where Position in ('Manager', 'Cashier');

	--like operator
Select Eno, Ename, Position, Salary from Employee where Ename like '%a';

	-- underscore character acts as a wildcard for exactly one character
Select Eno, Ename, Position, Salary from Employee where Ename like 'a_____';

Select Eno, Ename from Employee where Ename like '%i';

Select * from Employee where Ename not like 'a%';

Select * from Employee where Position != 'Manager';
Select * from Employee where Position not in ('Manager');

insert into Employee (Eno, Ename, EAddress, Salary, Dno)
values
('E13', 'Lasitha', 'Jaffna', 45000, 'D3');

select * from Employee where Position is not null;

select Eno, Ename, Position, Salary from Employee where Salary not between 50000 and 80000;
select * from Employee where Ename like 'k%' or Ename like 'a%';
select Eno, Ename from Employee where Ename like 'a%' and  not Salary < 40000;

select * from Department;
select * from Employee;

select min(Salary) from Employee
where Position = 'Cashier';

	--queries the average of salaries of all employees
select avg(Salary) from Employee;

	--queries the total salaries of all employees
select sum(salary) from Employee;

	--sum of all salaries of all employees who are cashiers
	-- the alias Salary_avg gives the produced column name a meaningful temporary name.
	-- using [] allows the use of whitespace in the name
select sum(salary) as [Salary Average] from Employee where Position = 'Cashier';

	--gets the number of records in the employee table
select Count(*) as [Number of Employees] from Employee;
select Count(Position) as [Number of Employees]  from Employee;

select Min(Salary) as [Minimum salary of D3] from Employee where Dno = 'D3';

select Position, max(Salary) as [Dep sum salary]
from Employee group by Position; --removing the group by generates an error

	--find which department has the max total salary
	--Todo
	select max(Salary) from Employee
	where Salary in (select sum(Salary) from Employee group by Dno)

	select sum(Salary) from Employee group by dno;

	select position, count(position) as [number of employees]
	from Employee group by position order by [number of employees];

	Select * from Employee;
use Company;

select Dno, sum(salary) from Employee group by Dno;

select Dno, Position, Count(ENo) from Employee group by Dno, Position;

select Dno, Sum(Salary) as Total from Employee group by Dno having Sum(Salary) >75000;

select Dno, Sum(Salary) as Total from Employee
where Position = 'Cashier' 
group by Dno
having sum(Salary) > 10000;

select Dno, Count(Eno) as Emp_Count
from Employee where position = 'Manager' group by Dno having count(Eno) > 1;

select Dno, Eno, count(Eno) from Employee where position = 'Manager' group by Dno, Eno;

--display except Managers, which departments have total salary exceeding 25,000
select Dno, Sum(Salary) as [Total Salary] from Employee
where position != 'Manager' 
group by Dno
having Sum(Salary) > 25000
order by sum(Salary) desc;

--display number of employees in each department. Only include department with more than 1 employee
select Dno, count(Eno) from Employee 
group by Dno having count(Eno) > 1;

select * from Employee;

select Dno, Sum(Salary) as [Total Salary] from Employee
where position != 'Manager' 
group by Dno;

select Dno, count(Eno) as [No. of Employees], Position from Employee
group by Dno, Position order by dno, [No. of Employees];