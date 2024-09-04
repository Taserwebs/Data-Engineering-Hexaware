Create Database Company
use Company
CREATE TABLE Employee
(ID int PRIMARY KEY,Name varchar(50), Gender varchar(50) , Salary int, DepartmentId int);

INSERT INTO Employee (ID,Name,Gender,Salary,DepartmentId)
VALUES(1,'Tom','Male',4000,1),
(2,'Pam','Female',3000,3),
(3,'John','Male',3500,1),
(4,'Sam','Male',4500,2),
(5,'Tod','Male',2800,2),
(6,'Ben','Male',7000,1),
(7,'Sara','Female',4800,3),
(8,'Valarie','Female',5500,1),
(9,'James','Female',6500,NULL),
(10,'Russell','Male',8800,NULL);

CREATE TABLE Department
(ID int PRIMARY KEY,DepartmentName varchar(50), Location varchar(50) , DepartmentHead varchar(50));

INSERT INTO Department (ID,DepartmentName,Location,DepartmentHead)
VALUES(1,'IT','London','Rick'),
(2,'PayRoll','Delhi','Rion'),
(3,'HR','New York','Christe'),
(4,'Other Department','Sydney','Cindrella');

--INNER JOIN--  --Shows only the Common Data --
SELECT Name,Salary,DepartmentName
FROM Employee
INNER JOIN Department
ON Employee.DepartmentId = Department.ID

--Left Outer Join -- --Shows the Data which is not common also in the left hand side --
SELECT Name,Salary,DepartmentName
FROM Employee
LEFT JOIN Department
ON Employee.DepartmentId = Department.ID

--Right Outer Join -- --Shows the Data which is not common also in the left hand side --
SELECT Name,Salary,DepartmentName
FROM Employee
RIGHT JOIN Department
ON Employee.DepartmentId = Department.ID

--Full Outer JOIN -- -- Shows all the matching and unmatching Datas from Both left and right sides

SELECT Name,Salary,DepartmentName
FROM Employee
FULL OUTER JOIN Department
ON Employee.DepartmentId = Department.ID




-- Exercise --
CREATE TABLE Products
(Product_ID int PRIMARY KEY NOT NULL,Product_Name varchar(50), Price float);

INSERT INTO Products (Product_ID,Product_Name,Price)
VALUES(1,'Laptop',800.00),
(2,'Smartphone',500.00),
(3,'Tablet',300.00),
(4,'Headphones',50.00),
(5,'Monitor',150.00);

CREATE TABLE Orders
(Order_ID int PRIMARY KEY NOT NULL,Product_ID int NOT NULL, Quantity int, OrderDate Date);

INSERT INTO Orders(Order_ID,Product_ID,Quantity,OrderDate)
VALUES
(1,1,2,'2024-08-01'),
(2,2,1,'2024-08-02'),
(3,3,3,'2024-08-03'),
(4,1,1,'2024-08-04'),
(5,4,4,'2024-08-05'),
(6,5,2,'2024-08-06'),
(7,6,1,'2024-08-07');



--INNER JOIN--  --Shows only the Common Data --
SELECT *
FROM Products
INNER JOIN Orders
ON Products.Product_Id = Orders.Product_ID

--Left Outer Join -- --Shows the Data which is not common also in the left hand side --
SELECT *
FROM Products
LEFT JOIN Orders
ON Products.Product_Id = Orders.Product_ID

--Right Outer Join -- --Shows the Data which is not common also in the left hand side --
SELECT *
FROM Products
RIGHT JOIN Orders
ON Products.Product_Id = Orders.Product_ID

--Full Outer JOIN -- -- Shows all the matching and unmatching Datas from Both left and right sides

SELECT *
FROM Products
FULL OUTER JOIN Orders
ON Products.Product_Id = Orders.Product_ID


Select p.Product_Name,o.OrderDate, SUM(o.Quantity) AS Total_Quantity
FROM Orders o
JOIN Products p ON o.Product_ID = p.Product_ID
GROUP BY GROUPING SETS ((p.Product_Name),(o.OrderDate));


Select o.Order_ID, o.Product_ID,
(Select p.Product_Name FROM Products p WHERE p.Product_ID = o.Product_ID) AS Product_Name
From Orders o;



SELECT u. user id, u. user name
FROM Users u
WHERE EXISTS (SELECT 1 FROM Orders o WHERE o. user id = u. user id);

SELECT p. Product_ID, p.Price
FROM Products p
WHERE p.Price > ANY(SELECT Price FROM Products WHERE Product_Name LIKE 'Laptop%');

SELECT p. Product_Name, p.Price
FROM Products p
WHERE p.Price > ALL(SELECT Price FROM Products WHERE Product_Name LIKE 'Smartphone%');


Select u.user_id, u.user_name
FROM Users u
WHERE user_id IN (SELECT user_id
From Orders 
WHERE product_id IN (
SELECT Product_ID
From Products 
WHERE Price > 1000 )
);



-- DATA INTEGRITY-- --Used to preserve the data stored with some constriants --
CREATE TABLE Products(
ProductID INT PRIMARY KEY,  -- Enforces unique ProductID --
ProductName VARCHAR(100) NOT NULL, -- Prevents NULL values for ProductName --	
Category VARCHAR(50) NOT NULL,
Price DECIMAL(10,2) CHECK (Price > 0), -- Ensures Price is positive --
StockQuantity INT DEFAULT 0  -- Default value for StockQuantity --

-- fUNCTIONS --
SELECT Product_Name, UPPER(Product_Name) AS ProductNameUpperCase
FROM Products;
SELECT Product_Name, LOWER(Product_Name) AS ProductNameLowerCase
FROM Products;
SELECT Product_Name, SUBSTRING(Product_Name, 1, 3) AS ShortName
FROM Products;
SELECT Product_Name,LEN(Product_Name) AS NameLength
FROM Products;
SELECT Product_Name,REPLACE (Product_Name,' Phone', 'Device') AS UpdatedProductName
FROM Products;
SELECT Product_Name,LTRIM(RTRIM(Product_Name)) AS TrimmedProductName
FROM Products;
SELECT Product_Name, CHARINDEX( 'e' , Product_Name) AS PositionOfE
FROM Products;
SELECT Product_Name,Category ,CONCAT(Product_Name, '-' , category) AS ProductDetai1s
FROM Products;
SELECT Product_Name,LEFT (Product_Name, 5) AS ShortName
FROM Products;
SELECT Product_Name,RIGHT (Product_Name, 3) AS ShortName
FROM Products;
SELECT Product_Name,REVERSE (Product_Name) AS ReversedName
FROM Products;
SELECT Product_Name, FORMAT (Price,'N2') AS Formattedprice
FROM Products;
SELECT Product_Name, REPLICATE (Product_Name, 3) AS RepeatedProductName
FROM Products;



SELECT GETDATE() AS CurrentDate,
DATEADD(DAY,10,GETDATE()) AS FutureDate;

SELECT DATEADD(YEAR,-1, GETDATE()) AS DateMinus1Year;

SELECT DATEDIFF(DAY,' 20-01-01' ,GETDATE()) AS DaysDifference;

SELECT DATEDIFF(DAY,' 2024-01-01 ' ,GETDATE()) AS DaysDifference;

SELECT FORMAT(GETDATE(),' MMMM dd, yyyy') AS FormattedDate;
SELECT FORMAT(GETDATE(),'dd ,MM, yyyy') AS FormattedDate;
SELECT YEAR(GETDATE()) AS CurrentYear;
SELECT MONTH(' 2024-05-15') AS MonthExtracted;
SELECT DAY(' 2024-05-15') AS DAYExtracted;

SELECT DATEDIFF(MONTH, '2002-10-26', GETDATE()) AS DaysDiff;


-- Add Category column to Products table
ALTER TABLE Products ADD Category varchar(50);

-- Update existing products with categories
UPDATE Products SET Category = 'Electronics' WHERE Product_ID IN (1, 2, 3);
UPDATE Products SET Category = 'Audio' WHERE Product_ID = 4;
UPDATE Products SET Category = 'Accessories' WHERE Product_ID = 5;

INSERT INTO Products (Product_ID, Product_Name, Price, Category)
VALUES (6, 'Office Chair', 120.00, 'Furniture');
Select * from Products

CREATE TABLE Customers
(Customer_ID int PRIMARY KEY NOT NULL,
 Customer_Name varchar(50),
 Email varchar(50));

INSERT INTO Customers (Customer_ID, Customer_Name, Email)
VALUES
(1, 'John Doe', 'john.doe@email.com'),
(2, 'Jane Smith', 'jane.smith@email.com'),
(3, 'Bob Johnson', 'bob.johnson@email.com'),
(4, 'Alice Brown', 'alice.brown@email.com'),
(5, 'Charlie Wilson', 'charlie.wilson@email.com');

ALTER TABLE Orders ADD  Customer_ID int;

UPDATE Orders SET Customer_ID = 1 WHERE Order_ID = 1;
UPDATE Orders SET Customer_ID = 2 WHERE Order_ID = 2;
UPDATE Orders SET Customer_ID = 3 WHERE Order_ID = 3;
UPDATE Orders SET Customer_ID = 4 WHERE Order_ID = 4;
UPDATE Orders SET Customer_ID = 5 WHERE Order_ID = 5;
UPDATE Orders SET Customer_ID = 1 WHERE Order_ID = 6;
UPDATE Orders SET Customer_ID = 2 WHERE Order_ID = 7;

CREATE TABLE Employees (
    Employee_ID int PRIMARY KEY NOT NULL,
    Employee_Name varchar(50),
    Department varchar(50),
    Salary float
);

INSERT INTO Employees (Employee_ID, Employee_Name, Department, Salary)
VALUES
(1, 'Michael Scott', 'Management', 75000.00),
(2, 'Dwight Schrute', 'Sales', 50000.00),
(3, 'Jim Halpert', 'Sales', 55000.00),
(4, 'Pam Beesly', 'Reception', 40000.00),
(5, 'Angela Martin', 'Accounting', 47000.00);

-- practice questions 22-08-2024

--Date Function Exercises
--Calculate the number of months between your birthday and the current date.

select datediff(month,'2002-10-26',getdate())

--Retrieve all orders that were placed in the last 4 days of a particular date.

select p.product_name from Products p inner join Orders o on p.Product_ID=o.Product_ID where o.OrderDate > (select dateadd(day,-4,'2024-08-07'))
 

--Write a query to extract the year, month, and day from the current date.
select year(getdate()) as  year ,month(getdate()) as  month,day(getdate()) as day

--Calculate the difference in years between two given dates.
select datediff(year,'2020-03-04',getdate())

--Retrieve the last day of the month for a given date.
 SELECT EOMONTH('2024-08-15') AS last_day_of_month;

 --or

 -- Example date
DECLARE @date DATE = '2024-08-15';

-- Get the last day of the month
DECLARE @last_day DATE = EOMONTH(@date);

-- Get the day name of the last day
SELECT 
    @last_day AS last_day_of_month,
    FORMAT(@last_day, 'dddd') AS day_name;


--String Function Exercises
--Convert all customer names to uppercase.
select upper(product_name) from Products

--Extract the first 5 characters of each product name.
select left(product_name,5) from Products

--Concatenate the product name and category with a hyphen in between.
select CONCAT(product_name,'-',price) from Products

--Replace the word 'Phone' with 'Device' in all product names.
select replace(product_name,'phone','device') from Products
--Find the position of the letter 'a' in customer names.
select charindex('a',product_name ) from Products




--Aggregate Function Exercises
--Calculate the total sales amount for all orders.
select sum(price) from products

--Find the average price of products in each category.
select avg(price),product_name from Products group by Product_Name

--Count the number of orders placed in each month of the year.

--Find the maximum and minimum order quantities.
SELECT MAX(Quantity) AS MaxQuantity
FROM Orders;
SELECT Min(Quantity) AS MaxQuantity
FROM Orders;

--Calculate the sum of stock quantities grouped by product category.

SELECT 
    p.Product_Name,
    SUM(o.Quantity) AS TotalOrderedQuantity
FROM 
    Orders o
JOIN 
    Products p ON o.Product_ID = p.Product_ID
GROUP BY 
    p.Product_Name;


--Join Exercises
--Write a query to join the Customers and Orders tables to display customer names and their order details.

--Perform an inner join between Products and Orders to retrieve product names and quantities sold.
SELECT 
    p.Product_Name,
    o.Quantity
FROM 
    Products p
INNER JOIN 
    Orders o ON p.Product_ID = o.Product_ID;

--Use a left join to display all products, including those that have not been ordered.
SELECT 
    p.Product_Name,
    COALESCE(o.Quantity, 0) AS Quantity
FROM 
    Products p
LEFT JOIN 
    Orders o ON p.Product_ID = o.Product_ID;

--Write a query to join Employees with Departments and list employee names and their respective department names.
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName
FROM 
    Employee e
INNER JOIN 
    Department d ON e.DepartmentId = d.ID;

--Perform a self-join on an Employees table to show pairs of employees who work in the same department.

select e.name,e1.name,e.departmentId from Employee e  join employee e1 on e.departmentId=e1.departmentId where e.ID<e1.ID

-- Subquery Exercises --

-- Write a query to find products whose price is higher than the average price of all products. --
SELECT Product_Name, Price
FROM Products 
WHERE Price > (SELECT AVG(Price) FROM Products);

-- Retrieve customer names who have placed at least one order by using a subquery. --
SELECT * FROM Orders
SELECT Customer_Name
From Customers 
WHERE Customer_ID IN(SELECT DISTINCT Customer_ID FROM Orders);
-- Find the top 3 most expensive products using a subquery. --
SELECT Product_Name, Price
FROM Products
WHERE Price IN (
    SELECT DISTINCT TOP 3 Price
    FROM Products
    ORDER BY Price DESC
);
-- Write a query to list all employees whose salary is higher than the average salary of their department. --
SELECT e.EmployeeName, e.Salary, e.DepartmentID
FROM Employees e
WHERE e.Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);
-- Use a correlated subquery to find employees who earn more than the average salary of all employees in their department.--
SELECT e.EmployeeName, e.Salary, e.DepartmentID
FROM Employees e
WHERE e.Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = e.DepartmentID
);

-- Grouping and Summarizing Data Exercises --

--Group orders by customer and calculate the total amount spent by each customer.--
SELECT c.Customer_Name, SUM(p.Price * o.Quantity) AS total_spent
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Products p ON o.Product_ID = p.Product_ID
GROUP BY c.Customer_ID, c.Customer_Name;

--Group products by category and calculate the average price for each category.--
SELECT Category, AVG(Price) AS avg_price
FROM Products
GROUP BY Category;

-- Group orders by month and calculate the total sales for each month.--
SELECT MONTH(OrderDate) AS order_month, SUM(p.Price * o.Quantity) AS total_sales
FROM Orders o
JOIN Products p ON o.Product_ID = p.Product_ID
GROUP BY MONTH(OrderDate)
ORDER BY order_month;

-- Write a query to group products by category and calculate the number of products in each category.--
SELECT Category, COUNT(*) AS product_count
FROM Products
GROUP BY Category;

-- Use the HAVING clause to filter groups of customers who have placed more than 5 orders.--
SELECT c.Customer_ID, c.Customer_Name, COUNT(o.Order_ID) AS order_count
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
HAVING COUNT(o.Order_ID) > 5;


--Set Operations (UNION, INTERSECT, EXCEPT)--

-- Write a query to combine the results of two queries that return the names of customers from different tables using UNION.--
SELECT Customer_Name AS Name FROM Customers
UNION
SELECT Employee_Name AS Name FROM Employees;

-- Find products that are in both the Electronics and Accessories categories using INTERSECT.--
SELECT Product_ID, Product_Name
FROM Products
WHERE Category = 'Electronics'
INTERSECT
SELECT Product_ID, Product_Name
FROM Products
WHERE Category = 'Accessories';

-- Write a query to find products that are in the Electronics category but not in the Furniture category using EXCEPT.--
SELECT Product_ID, Product_Name
FROM Products
WHERE Category = 'Electronics'
EXCEPT
SELECT Product_ID, Product_Name
FROM Products
WHERE Category = 'Furniture';

-- Mathematical Functions --
SELECT Product_Name,Price, ROUND(Price,2) AS RoundedPrice
From Products;
SELECT Product_Name,Price, CEILING(Price) AS CeilingPrice
From Products;
SELECT Product_Name,Price, FLOOR(Price) AS FloorPrice
From Products;
SELECT Product_Name,Price, SQRT(Price) AS SquareRootPrice
From Products;
SELECT Product_Name,Price, POWER(Price,2) AS PriceSquared
From Products;
select price%5 from Products
select abs(min(price)-max(price)) from Products
select rand() 
select exp(min(price)) from  Products
select log(price) from Products
-- Scenario: Apply a 15% discount, round the discounted price to 2 decimal places, and show both the ceiling and floor values of the final discounted price. --
SELECT
Product_Name,Price,
ROUND(Price * 0.85,2) AS DiscountedPrice,
CEILING(ROUND(Price * 0.85, 2)) AS CeilingDiscountedPrice,
FLOOR(ROUND(Price*0.85,2))AS FloorDiscountedPrice
FROM Products;

SELECT SUM(Price) AS TotalSales
FROM Products;

SELECT AVG(Price) AS AveragePrice
From Products;

SELECT COUNT(Order_ID) AS TotalOrders
FROM Orders;

SELECT MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice
From Products;

SELECT Category, COUNT(Product_ID) AS ProductCount
FROM Products
GROUP BY Category;

--Exercises 23/08/2024 --
-- 1. Calculate the total amount spent by each customer. --
SELECT * FROM Customers
SELECT * FROM Orders
SELECT * FROM Products

SELECT c.Customer_ID, c.Customer_Name, SUM(p.Price * o.Quantity) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Products p ON o.Product_ID = p.Product_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY TotalSpent DESC;
 
-- 2. Find customers who have spent more than $1,000 in total. --
SELECT c.Customer_ID, c.Customer_Name, SUM(p.Price * o.Quantity) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
JOIN Products p ON o.Product_ID = p.Product_ID
GROUP BY c.Customer_ID,c.Customer_Name
HAVING SUM(p.Price * o.Quantity) > 1000
ORDER BY TotalSpent DESC;
 
-- 3. Find Product Categories with More Than 5 Products --
SELECT Category, COUNT(*) AS ProductCount
FROM Products
GROUP BY Category
HAVING COUNT(*) > 5
ORDER BY ProductCount DESC;
 
-- 4. Calculate the total number of products for each category and supplier combination.--
SELECT Category, Supplier, COUNT(*) AS ProductCount
FROM Products
GROUP BY Category, Supplier
ORDER BY ProductCount,Supplier DESC;
 
-- 5. Summarize total sales by product and customer, and also provide an overall total.--

SELECT p.Product_ID,p.Product_Name,c.Customer_ID,c.Customer_Name,
SUM(p.Price * o.Quantity) AS TotalSales,
SUM(SUM(p.Price * o.Quantity)) OVER () AS OverallTotal
FROM Products p
JOIN Orders o ON p.Product_ID = o.Product_ID
JOIN Customers c On o.Customer_ID = c.Customer_ID
GROUP BY p.Product_ID,p.Product_Name, c.Customer_ID,c.Customer_Name;

-- PROCEDURE used to excecute all the set of queries in one go --
CREATE PROCEDURE GetAllProducts
AS 
BEGIN
SELECT * FROM Products;
END;

-- To get output of procedure use exec command --
exec GetAllProducts;

-- Giving parameter to the procedure --
CREATE PROCEDURE GetProductByID
@ProductID INT   -- Parameter which is passed through procedure --
AS
BEGIN
SELECT *
FROM Products 
WHERE Product_ID = @ProductID; -- Declaring the value of Parameter --
END;

-- Executing the procedure by passing input --
exec GetProductByID @ProductID = 1; --Giving the value or product which is needed to be shown --

CREATE PROCEDURE GetProductsByCategoryAndPrice
@Category VARCHAR(50),
@MinPrice DECIMAL(10, 2)
AS
BEGIN
SELECT * FROM Products
WHERE Category = @Category
AND Price >= @MinPrice;
END;

exec GetProductsByCategoryAndPrice @Category = 'Electronics', @MinPrice = 500.00;

SELECT * FROM Products
-- Stored Procedure with Insert Operation --
CREATE PROCEDURE InsertNewProduct
    @ProductName VARCHAR(50),
    @Price DECIMAL(10, 2),
    @Category VARCHAR(50)
AS
BEGIN
    DECLARE @NewProductID INT
    SELECT @NewProductID = ISNULL(MAX(Product_ID), 0) + 1 FROM Products

    INSERT INTO Products (Product_ID, Product_Name, Price, Category)
    VALUES (@NewProductID, @ProductName, @Price, @Category);
END;
EXEC InsertNewProduct 
    @ProductName = 'Wireless Mouse', 
    @Price = 29.99, 
    @Category = 'Accessories';
	Select * from Products
	-- Stored Procedure With Update Operation --
CREATE PROCEDURE UpdateProduct
@ProductID INT,
@ProductName VARCHAR(50),
@Price DECIMAL(10, 2),
@Category VARCHAR(50)
AS
BEGIN
UPDATE Products
SET Product_Name = @ProductName,
Price = @Price,
Category = @Category,
E Product_ID = @ProductID;
END;

EXEC UpdateProduct 
    @ProductID = 1, 
    @ProductName = 'Updated Laptop', 
    @Price = 999.99, 
    @Category = 'Electronics';
	-- Stored Procedure With Delete Operation --
CREATE PROCEDURE DeleteProduct
    @ProductID INT
AS
BEGIN
        DELETE FROM Products
        WHERE Product_ID = @ProductID;
END;

EXEC DeleteProduct @ProductID = 1;

CREATE PROCEDURE GetTotalProducts1nCategory
@Category VARCHAR(50),
@Tota1Products INT OUTPUT
AS
BEGIN 
SELECT @TotalProducts = COUNT(*)
FROM Products
WHERE Category = @Category;
END;


-- TRANSACTION --
CREATE PROCEDURE ProcessOrder
@ProductID INT,
@Quantity INT,
@OrderDate DATE
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
       --Insert Order --
        INSERT INTO Orders (Product_ID, Quantity, OrderDate)
        VALUES (@ProductID, @Quantity, @OrderDate);
       -- Update Product Stock --
        UPDATE Products SET StockQuantity = StockQuantity - @Quantity
        WHERE Product_ID = @ProductID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        -- You can handle errors here, such as logging or returning an error message --
        THROW;
     END CATCH;
END;


-- IF Else Block --
CREATE PROCEDURE Adjuststock
@ProductID INT ,
@Adjustment INT
AS
BEGIN
IF @Adjustment > 0
BEGIN
-- Add to Stock
UPDATE Products
SET StockQuantity = StockQuantity + @Adjustment
WHERE Product_ID = @ProductID;
END
ELSE IF @Adjustment < 0
BEGIN
--Subtract from stock
UPDATE Products 
SET StockQuantity = StockQuantity + @Adjustment
WHERE Product_ID = @ProductID;
END
END;

EXEC Adjuststock @ProductId = 1, @Adjustment = 5; --Increase Stock by 5 --
EXEC AdjustStock @ProductID = 1, @Adjustment = -3; -- Decrease stock by 3 --

Select * from Customers


CREATE DATABASE AUG24SAT
