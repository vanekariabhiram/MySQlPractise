CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

INSERT INTO Employees VALUES
(1, 'Alice', 'Smith', 'HR', 60000, '2019-05-01'),
(2, 'Bob', 'Johnson', 'IT', 75000, '2020-01-15'),
(3, 'Charlie', 'Williams', 'IT', 50000, '2021-08-10'),
(4, 'David', 'Brown', 'Finance', 80000, '2018-12-01'),
(5, 'Eva', 'Davis', 'HR', 62000, '2022-03-22');
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(100)
);

INSERT INTO Departments VALUES
(1, 'HR', 'New York'),
(2, 'IT', 'San Francisco'),
(3, 'Finance', 'Chicago');

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    EmployeeID INT,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(10,2)
);

INSERT INTO Projects VALUES
(101, 'AI System', 2, '2021-01-10', '2021-12-10', 100000),
(102, 'Payroll App', 3, '2022-05-01', NULL, 50000),
(103, 'Tax Portal', 4, '2020-02-01', '2020-11-30', 70000);

-- Retrieve all employees who work in the IT department.
select * from Employees where Department='IT';

-- Find employees who earn more than the average salary.
select * from Employees where (select avg(salary) from Employees);

-- List all projects that have not ended yet.
select * from Projects where EndDate is null;

-- Count number of employees in each department.
select Department,count(*) from Employees group by Department;

-- Get a list of employees along with their project names (if any).

select e.FirstName,p.ProjectName
from Employees as e 
left join 
Projects as p 
on e.EmployeeID=p.EmployeeID;

-- Find the department with the highest average salary.
select Department,avg(salary) as avgsal from Employees 
group by Department order by avgsal desc limit 1 ;

-- Get total budget handled by each employee.
select e.EmployeeID,e.FirstName, sum(p.Budget) from Employees as e
join Projects p on e.EmployeeId=p.EmployeeId group by e.EmployeeID;

-- Find employees who are not working on any project.
select * from Employees where EmployeeID not in (select EmployeeId from Projects);

-- Get employees hired after Jan 1, 2020 and working on a project.
select  e.EmployeeID , e.FirstName from Employees e 
join Projects p on e.employeeID=p.EmployeeID where e.HireDate>'2020-01-01';

--  List all employees who earn more than ₹60,000.
select * from Employees where Salary>60000;
-- 2. Show the first and last names of employees in the HR department.
select FirstName,LastName from Employees where Department='HR';
-- 3. Get all employees hired after January 1, 2020.
select * from Employees where HireDate > '2020-01-01';
-- Retrieve employees whose salary is between ₹50,000 and ₹75,000.
select * from Employees where salary>=50000 and salary <=75000 order by salary asc;
select * from Employees where salary between 50000 and 75000;
select * from Employees;
--  Find all employees whose first name starts with 'A'.
select * from Employees where  FirstName like 'A%';

--  Count how many employees are in each department.
select Department,count(EmployeeID) from Employees group by Department;

-- Find the average salary of employees in the IT department.
select avg(salary) from Employees where Department='IT';

-- . Get the total salary expense for all employees.
select sum(salary) from Employees;

-- Which department has the highest average salary?
select Department, avg(salary) from Employees 
group by department 
order by avg(salary)  DESC
limit 1;

-- List departments with more than 1 employee.
select Department,count(*)  from Employees 
group by  Department 
having count(*)>1;

-- 11. List each employee’s first and last name along with their project name.
select e.FirstName,e.LastName,p.ProjectName from Employees e 
left join Projects p 
on e.EmployeeId=p.EmployeeId;

-- List all employees and their projects, even if some employees are not assigned to any project.
select e.FirstName, e.LastName, p.ProjectName
from Employees e
left join Projects p on e.EmployeeID = p.EmployeeID;

--  Get all projects and the employees working on them, even if some projects are not assigned.
select p.ProjectName,e.FirstName,e.LastName from Employees e 
left join Projects p 
on e.EmployeeId=p.EmployeeId;

 --   List all departments, and employees in them, including departments that have no employees
 select d.DepartmentName,e.FirstName,e.LastName from Departments d
 left join Employees e
 on d.DepartmentName=e.Department;

-- Show employee details and the total number of projects they are working on.
select e.FirstName,e.LastName,count(ProjectId) from Employees e
left join Projects p 
on e.EmployeeID=p.EmployeeId
group by e.EmployeeID;



