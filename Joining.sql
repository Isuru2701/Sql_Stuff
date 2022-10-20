use Company;

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

--left join
select Eno, Ename, Position, Dno, Dname
from Employee left join Department
on Employee.Dno = Department.DeptNo

select Eno
from Employee
where Employee.Dno = Department.DeptNo

--right join
select Eno, Ename, Position, Dno, DeptNo, Dname
from Employee right join Department
on Employee.Dno = Department.DeptNo;

--full outer join
select Eno, Ename, Position, Dno, Dname
from Employee full join Department
on Employee.Dno = Department.DeptNo;

--Display Eno, Ename, Salary, Address and DeptName of
--all the employees who lives in Colombo and who
--get paid between 15000 and 65000.

select Eno, Ename, Salary, Eaddress, DName
from Employee inner join Department
on Employee.Dno = Department.DeptNo
where Salary between 15000 and 65000 and Eaddress = 'Colombo';

--Display the department number
--along with the department name which have Total salary 
--exceeding 75000? 

select Deptno, Dname, sum(salary) as Total
from Department inner join Employee
on Department.DeptNo = Employee.Dno
group by DeptNo, Dname
having sum(salary) > 75000;

--Display the department number along with the department name
--which have Total salary exceeding 75000
--without the Manager position? 
select Deptno, DName, sum(Salary) as Total
from Department inner join Employee
on Department.DeptNo = Employee.Dno
where Position != 'Manager'
group by DeptNo, Dname
having  sum(salary) > 75000;

