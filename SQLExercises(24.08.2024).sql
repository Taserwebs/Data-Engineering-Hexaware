-- ABISHEK R --
USE AUG24SAT
CREATE TABLE Customers
(CustomerID int PRIMARY KEY NOT NULL,
 FirstName varchar(50),
 LastName varchar(50),
 Email varchar(100),
 PhoneNumber BIGINT) ;
 DROP TABLE Customers

INSERT INTO Customers (CustomerID, FirstName,LastName,Email,PhoneNumber)
VALUES
(1, 'amit', 'sharma', 'amit.sharma@email.com',9876543210),
(2, 'priya', 'mehta', 'priya.mehta@email.com',8765432109),
(3, 'rohit', 'kumar', 'rohit.kumar@email.com',7654321098),
(4, 'neha', 'verma', 'neha.verma@email.com',6543210987),
(5, 'siddharth', 'singh', 'siddharth.singh@email.com',5432109876),
(6, 'asha', 'rao', 'asha.rao@email.com',4321098765);

UPDATE Customers
SET FirstName = LTRIM(RTRIM(LOWER(FirstName))),
LastName = LTRIM(RTRIM(LOWER(LastName)));

SELECT * FROM Customers WHERE FirstName LIKE 'A%';

SELECT *
FROM Customers
WHERE PhoneNumber LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]';  -- Phone no format as per usa --

SELECT * FROM Customers
WHERE LastName LIKE '_____'; --UNDERSCORE WRITTEN 5 TIMES , RETURNS THE PERSON WHOSE LAST NAME HAS ONLY FIVE LETTERS --


SELECT CustomerID, OrderID, TotalAmount,SUM(TotalAmount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS RunningTotal
FROM Orders; --Partitions the data and then shows the total amount spend by the customers in their orders (As an individual table --

SELECT CustomerID, TotalSales,
RANK() OVER (ORDER BY TotalSales DESC) AS SalesRank
FROM (
SELECTCustomerID, SUM(TotalAmount) AS TotalSales
FROM Orders1
GROUP BY CustomerID) AS SalesData;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    ManagerID INT NULL
);

INSERT INTO Employees (EmployeeName, ManagerID)
VALUES 
('Amit Sharma', NULL),  -- Top manager
('Priya Mehta', 1),     -- Reports to Amit
('Rohit Kumar', 1),     -- Reports to Amit
('Neha Verma', 2),      -- Reports to Priya
('Siddharth Singh', 2), -- Reports to Priya
('Asha Rao', 3);        -- Reports to Rohit

INSERT INTO Employees (EmployeeName, ManagerID)
VALUES 
('Vikram Gupta', 4),  -- Reports to Neha
('Rajesh Patel', 5);  -- Reports to Siddharth


-- This query is using a recursive Common Table Expression (CTE) to traverse an employee hierarchy.--
WITH RecursiveEmployeeCTE AS(
SELECT EmployeeID, ManagerID, EmployeeName
FROM Employees
WHERE ManagerID IS NULL
UNION ALL
SELECT e.EmployeeID, e.ManagerID, e.EmployeeName
FROM Employees e
INNER JOIN RecursiveEmployeeCTE r ON e.ManagerID = r.EmployeeID
)

SELECT * FROM RecursiveEmployeeCTE;

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Category VARCHAR(50),
    Amount DECIMAL(10, 2),
    SaleDate DATE
);
 
INSERT INTO Sales (SaleID, ProductID, Category, Amount, SaleDate) 
VALUES 
(1, 101, 'Electronics', 1500.00, '2024-01-15'),
(2, 102, 'Furniture', 800.00, '2024-01-16'),
(3, 103, 'Electronics', 2000.00, '2024-01-17'),
(4, 104, 'Electronics', 1200.00, '2024-02-01'),
(5, 105, 'Furniture', 900.00, '2024-02-03');

SELECT Category, SUM(Amount) AS TotalSales
FROM Sales
GROUP BY ROLLUP(Category); -- ROLLUP gives the grand total of the Totalsales done --


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10, 2),
    OrderDate DATE
);
 
INSERT INTO Orders (OrderID, CustomerID, OrderAmount, OrderDate)
VALUES 
(1, 1, 500.00, '2024-01-15'),
(2, 2, 700.00, '2024-01-16'),
(3, 1, 300.00, '2024-01-17'),
(4, 3, 1200.00, '2024-02-01'),
(5, 2, 900.00, '2024-02-03');

-- Corelated Subquery --
SELECT DISTINCT o1.CustomerID
FROM Orders o1
WHERE (
SELECT COUNT(*)
FROM Orders o2
WHERE o2.CustomerID = o1.CustomerID
) > 1;

CREATE TABLE ProductSales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Amount DECIMAL(10, 2),
    SaleDate DATE
);
 
INSERT INTO ProductSales (SaleID, ProductID, Amount, SaleDate)
VALUES 
(1, 101, 1500.00, '2024-01-15'),
(2, 102, 800.00, '2024-01-16'),
(3, 103, 2000.00, '2024-01-17'),
(4, 104, 1200.00, '2024-02-01'),
(5, 105, 900.00, '2024-02-03');
-- view Subset of the initial data by SCHEMABINDING METHOD --
-- as it is the subset of the parent table any change is done in pt should also be done in it also --
CREATE VIEW TotalSalesByProduct
WITH SCHEMABINDING
AS
SELECT ProductID, SUM(Amount) AS TotalSales
FROM dbo.ProductSales
GROUP BY ProductID;

SELECT * FROM TotalSalesByProduct;

-- AUG 24 Exercises --
-- 1. Filter and Aggregate on Join Results using SQL* --
-- Task: Join the Orders and Customers tables to find the total order amount per customer and filter out customers who have spent less than $1,000. --
SELECT * FROM Orders
SELECT * FROM Customers

SELECT c.CustomerID,c.FirstName,c.LastName,SUM(o.OrderAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName
HAVING SUM(o.OrderAmount) > 1000
ORDER BY TotalSpent DESC;

-- 2. Cumulative Aggregations and Ranking in SQL Queries* --
--- Task: Create a cumulative sum of the OrderAmount for each customer to track the running total of how much each customer has spent. --
SELECT c.CustomerID,c.FirstName,c.LastName,o.OrderDate,o.OrderAmount,
    SUM(o.OrderAmount) OVER (PARTITION BY c.CustomerID ORDER BY o.OrderDate) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID, o.OrderDate;

-- 3. OVER and PARTITION BY Clause in SQL Queries --
-- Task: Rank the customers based on the total amount they have spent, partitioned by city. --
ALTER TABLE Customers
ADD City varchar(50);
UPDATE Customers
SET City = 
    CASE CustomerID
        WHEN 1 THEN 'Mumbai'
        WHEN 2 THEN 'Delhi'
        WHEN 3 THEN 'Bangalore'
        WHEN 4 THEN 'Mumbai'
        WHEN 5 THEN 'Delhi'
        WHEN 6 THEN 'Bangalore'
    END;
SELECT c.CustomerID,c.FirstName,c.LastName,c.City,SUM(o.OrderAmount) AS TotalSpent,
RANK() OVER (PARTITION BY c.City ORDER BY SUM(o.OrderAmount) DESC) AS RankInCity
FROM Customers c
JOIN Orders o ON c.CustomerId = o.CustomerID
GROUP BY c.CustomerID,c.FirstName,c.LastName,c.City;

--- 4. Total Aggregation using OVER and PARTITION BY in SQL Queries --
-- Task: Calculate the total amount of all orders (overall total) and the percentage each customer's total spending contributes to the overall total. --
WITH CustomerTotals AS (
SELECT c.CustomerID,c.FirstName,c.LastName,
SUM(o.OrderAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
)
SELECT CustomerID,FirstName,LastName,TotalSpent,
SUM(TotalSpent) OVER () AS OverallTotal,
(TotalSpent / SUM(TotalSpent) OVER ()) * 100 AS PercentageOfTotal
FROM CustomerTotals
ORDER BY TotalSpent DESC;

-- 5. Ranking in SQL --
-- Task: Rank all customers based on the total amount they have spent, without partitioning. --
SELECT c.CustomerID,c.FirstName,c.LastName,
SUM(o.OrderAmount) AS TotalSpent,
RANK() OVER (ORDER BY SUM(o.OrderAmount) DESC) AS Rank
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

-- Here are additional tasks that build on the concepts of filtering, aggregating, ranking, and window functions in SQL: --

-- 6. Task: Calculate the Average Order Amount per City --
-- Task: Write a query that joins the Orders and Customers tables, calculates the average order amount for each city, and orders the results by the average amount in descending order. --
SELECT c.City,AVG(o.OrderAmount) AS AverageOrderAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.City
ORDER BY AverageOrderAmount DESC;

-- 7. Task: Find Top N Customers by Total Spending --
-- Task: Write a query to find the top 3 customers who have spent the most, using ORDER BY and LIMIT. --

SELECT TOP 3 c.CustomerID,c.FirstName,c.LastName,SUM(o.OrderAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

-- 8. Task: Calculate Yearly Order Totals --
--  Task: Write a query that groups orders by year (using OrderDate), calculates the total amount of orders for each year, and orders the results by year. --

SELECT YEAR(OrderDate) AS OrderYear,SUM(OrderAmount) AS TotalAmount
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;

-- 9. Task: Calculate the Rank of Customers by Total Order Amount --
-- Task: Write a query that ranks customers by their total spending, but only for customers located in "Mumbai". The rank should reset for each customer in "Mumbai". --

SELECT c.CustomerID,c.FirstName,c.LastName,SUM(o.OrderAmount) AS TotalSpent,
RANK() OVER (ORDER BY SUM(o.OrderAmount) DESC) AS Rank
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.City = 'Mumbai'
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- 10. Task: Compare Each Customer's Total Order to the Average Order Amount --
-- Task: Write a query that calculates each customer's total order amount and compares it to the average order amount for all customers. --

WITH CustomerTotals AS (
SELECT c.CustomerID,c.FirstName,c.LastName,SUM(o.OrderAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
),
AverageTotal AS (
SELECT AVG(TotalSpent) AS AvgTotalSpent
FROM CustomerTotals
)
SELECT ct.CustomerID,ct.FirstName,ct.LastName,ct.TotalSpent,at.AvgTotalSpent,ct.TotalSpent - at.AvgTotalSpent AS DifferenceFromAverage
FROM CustomerTotals ct, AverageTotal at
ORDER BY ct.TotalSpent DESC;
