create database college
create table tb1Gender
(ID int Not Null Primary Key ,
Gender nvarchar(50))

Alter table PersonTable
add constraint PersonTable_GenderId_FK FOREIGN KEY
(GenderId) references tb1Gender(ID)

insert into tb1Gender (ID, Gender)
VALUES (1,'MALE'),
(2, 'FEMALE'),
(3, 'OTHERS')

Insert Into PersonTable (id, Name, Email, GenderId)
VALUES (1, 'Tom', 'Tom@gmail.com' , 1),(2, 'Jessy', 'Jessy@gmail.com',2),
(3, 'Kristy','Kristy@gmail.com' ,2),(4,'John', 'John@gmail.com', 1),
(5, 'Rob', 'Rob@gmail.com',1)

Select * from PersonTable


UPDATE PersonTable
SET Email = 'TomUpdated@gmail.com'
WHERE Id = 1;

UPDATE PersonTable
SET GenderId = 1
WHERE Name = 'Jessy';

DELETE FROM PersonTable
WHERE id = 3; -- Deletes the Particular Data Where Id is 3

DELETE FROM PersonTable
WHERE GenderId = 3; -- Deletes The Entire Data Where GenderId is 3 i.e: Gender = others

CREATE TABLE Employees
(EmployeeID int PRIMARY KEY, FirstName varchar(50), LastName varchar(50), Position varchar(50), Department varchar(50), HireDate Date)

Insert Into Employees(EmployeeID,FirstName,LastName,Position,Department,HireDate)
Values(1,'John','Doe','Manager','Marketing','2020-01-26'),
(2,'Christain','Bane','Supervisor','Sales','2024-01-26'),
(3,'Steve','Rogers','TeamLead','IT','2022-08-15');

UPDATE Employees
SET Position = 'Senior Manager'
WHERE FirstName = 'John' AND LastName = 'Doe';

Select * from Employees

DELETE FROM Employees WHERE Department='IT';

UPDATE Employees
SET FirstName = 'Peter', LastName = 'Parker'
WHERE EmployeeID = 1;

Insert Into Employees(EmployeeID,FirstName,LastName,Position,Department,HireDate)
Values(1,'Amit','Sharma','Software Engineer','IT','2022-01-15'),
(2,'Priya','Mehta','Project Manager','Operations','2023-02-20'),
(3,'Raj','Patel','Business Analyst','Finance','2021-06-30'),
(4,'Sunita','Verma','HR Specialist','HR','2019-08-12'),
(5,'Vikram','Rao','Software Engineer','IT','2021-03-18'),
(6,'Anjali','Nair','HR Manager','HR','2020-05-14'),
(7,'Roshan','Desai','Finance Manager','Finance','2022-11-25'),
(8,'Sneha','Kumar','Operations Coordinator','Operations','2023-07-02'),
(9,'Deepak','Singh','Data Scientist','IT','2022-08-05'),
(10,'Neha','Gupta','	Business Analyst','Finance','2020-10-10');

Select * from Employees

SELECT FirstName, LastName, Department
FROM Employees

SELECT * 
FROM Employees
WHERE Department = 'IT'

SELECT *
FROM Employees
WHERE HireDate > '2022-01-01'

SELECT *
FROM Employees
WHERE Department IN ('IT','HR');

SELECT DISTINCT Department 
FROM Employees;

SELECT *
FROM Employees
WHERE Department = 'IT' AND HireDate >'2022-01-01';

SELECT *
FROM Employees
WHERE Department = 'IT' OR HireDate >'2022-01-01';

SELECT * 
FROM Employees
WHERE HireDate BETWEEN '2022-01-01' AND ' 2022-12-31' ;

SELECT *
FROM Employees
WHERE LastName LIKE 'S%';

SELECT FirstName + ' ' + LastName AS FullName,Department  
FROM Employees;


SELECT E. FirstName, E. LastName, E.Department
FROM Employees AS E
WHERE E.Department= 'IT';
 
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Operations');

SELECT e.EmployeeId, e.FirstName, e.LastName, e.Position, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.Department = d.DepartmentName;

SELECT FirstName,LastName
FROM Employees
WHERE HireDate = (SELECT MIN(HireDate) FROM Employees);

SELECT e.EmployeeId, e.FirstName, e.LastName, e.Position, d.DepartmentName
FROM Employees e WHERE 
JOIN Departments d ON e.Department = d.DepartmentName;

SELECT e.FirstName, e.LastName, e.Department
FROM Employees e
WHERE e.Department IN (
    SELECT Department
    FROM Employees
    GROUP BY Department
    HAVING COUNT(*) > 2
);
