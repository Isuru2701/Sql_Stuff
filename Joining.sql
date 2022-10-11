select * from employee;
select * from Department;


--inner join
select Eno, Ename, Position, Dno, Dname
from Employee inner join Department
on Employee.Dno = Department.DeptNo;

--same thing a different way:
select Eno, Ename, Position, Dno, Dname
from Employee, Department
where Employee.Dno = Department.DeptNo;

select Employee.Eno, Employee.Ename, Employee.EAddress, Department.Dname
from Employee, Department
where Employee.Dno = Department.DeptNo;

select E.Eno, E.Ename, E.EAddress, D.Dname
from Employee E, Department D
where E.Dno = D.DeptNo;


insert into Employee 
(Eno, Ename, Position, EAddress, Salary)
Values
('E13', 'Oshan', 'Cashier', 'Colombo', 15000);