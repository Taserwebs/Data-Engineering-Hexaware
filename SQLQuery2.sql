--sql queries
--ABISHEK R

--Morning Exercises 23/08/2024 --
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

CREATE DATABASE DB
USE DB
```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
VALUES 
('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210'),
('Priya', 'Mehta', 'priya.mehta@example.com', '8765432109'),
('Rohit', 'Kumar', 'rohit.kumar@example.com', '7654321098'),
('Neha', 'Verma', 'neha.verma@example.com', '6543210987'),
('Siddharth', 'Singh', 'siddharth.singh@example.com', '5432109876'),
('Asha', 'Rao', 'asha.rao@example.com', '4321098765');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES 
('Laptop', 'Electronics', 75000.00, 15),
('Smartphone', 'Electronics', 25000.00, 30),
('Desk Chair', 'Furniture', 5000.00, 10),
('Monitor', 'Electronics', 12000.00, 20),
('Bookshelf', 'Furniture', 8000.00, 8);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (CustomerID, ProductID, Quantity, TotalAmount, OrderDate)
VALUES 
(1, 1, 2, 150000.00, '2024-08-01'),
(2, 2, 1, 25000.00, '2024-08-02'),
(3, 3, 4, 20000.00, '2024-08-03'),
(4, 4, 2, 24000.00, '2024-08-04'),
(5, 5, 5, 40000.00, '2024-08-05');


-- 1. Hands-on Exercise: Filtering Data using SQL Queries --

-- Retrieve all products from the Products table that belong to the category 'Electronics' and have a price greater than 500. --
SELECT * FROM Products
WHERE Category = 'Electronics' AND Price > 500 ;

-- 2. Hands-on Exercise: Total Aggregations using SQL Queries --
-- Calculate the total quantity of products sold from the Orders table.--
SELECT SUM(Quantity) AS TotalQuantitySold
FROM Orders;

-- 3. Hands-on Exercise: Group By Aggregations using SQL Queries --
-- Calculate the total revenue generated for each product in the Orders table. --
SELECT p.ProductID, p.ProductName, SUM(o.Quantity * p.Price) AS RevenueGenerated 
From Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductID,p.ProductName;

-- 4. Hands-on Exercise: Order of Execution of SQL Queries --
-- Write a query that uses WHERE, GROUP BY, HAVING, and ORDER BY clauses and explain the order of execution.--

SELECT Category, COUNT(*) AS ProductCount, AVG(Price) AS AvgPrice -- Category column is chosen and the count function is used to count the total no.of Products and the avg Price of the Particular Product is being calculated --
FROM Products
WHERE Price > 100 -- Filtering the category according to where price is greater than 100 --
GROUP BY Category -- Grouping all the products which has price more than 100 --
HAVING COUNT(*) > 2 -- Filtering the Products according to their quantity like one category should have 2 or more than 2 Products --
ORDER BY AvgPrice DESC; -- Then Ordering the Category By their AVG Price in Descinding order--

-- 5. Hands-on Exercise: Rules and Restrictions to Group and Filter Data in SQL Queries --
-- Write a query that corrects a violation of using non-aggregated columns without grouping them. --
SELECT ProductID, SUM(TotalAmount) AS TotalRevenue
FROM Orders
GROUP BY ProductID;
-- 6. Hands-on Exercise: Filter Data based on Aggregated Results using Group By and Having --
-- Retrieve all customers who have placed more than 5 orders using GROUP BY and HAVING clauses.--
SELECT CustomerID,count(OrderID)
FROM Orders
GROUP BY CustomerID
having count(orderID) > 5;


-- 1. Basic Stored Procedure --
-- Create a stored procedure named GetAllCustomers that retrieves all customer details from the Customers table. --
CREATE PROCEDURE GetAllCustomers
AS
BEGIN
SELECT * FROM Customers;
END;

EXEC GetAllCustomers;

-- 2. Stored Procedure with Input Parameter --
-- Create a stored procedure named GetOrderDetailsByOrderID that accepts an OrderID as a parameter and retrieves the order details for that specific order. --
CREATE PROCEDURE GetOrderDetailsByOrderId
@OrderID INT 
AS
BEGIN
SELECT * FROM Orders
WHERE OrderID = @OrderID
END;

EXEC GetOrderDetailsByOrderId @OrderID = 2;

-- 3. Stored Procedure with Multiple Input Parameters --
-- Create a stored procedure named GetProductsByCategoryAndPrice that accepts a product Category and a minimum Price as input parameters and retrieves all products that meet the criteria. --
CREATE PROCEDURE GetProductsByCategoryAndPrice
@Category VARCHAR(50),
@Price DECIMAL
AS
BEGIN
SELECT * FROM Products 
WHERE Category = @Category AND Price >= @Price;
END;

EXEC GetProductsByCategoryAndPrice @Category = 'Furniture' ,@Price = 500;

-- 4. Stored Procedure with Insert Operation --
-- Create a stored procedure named InsertNewProduct that accepts parameters for ProductName, Category, Price, and StockQuantity and inserts a new product into the Products table.--
CREATE PROCEDURE InsertNewProduct
@ProductName VARCHAR(100),
@Category VARCHAR(50),
@Price DECIMAL,
@StockQuantity INT
AS
BEGIN
INSERT INTO Products (ProductName,Category,Price,StockQuantity)
VALUES(@ProductName,@Category,@Price,@StockQuantity);
END;

EXEC InsertNewProduct @ProductName = 'Watch' , @Category = 'Electronics', @Price = 500.00, @StockQuantity = 50 ;
SELECT * FROM Products

-- 5. Stored Procedure with Update Operation --
-- Create a stored procedure named UpdateCustomerEmail that accepts a CustomerID and a NewEmail parameter and updates the email address for the specified customer. --
CREATE PROCEDURE UpdateCustomerEmail
@CustomerID INT,
@Email VARCHAR(100)
AS
BEGIN
UPDATE Customers
SET Email = @Email 
WHERE CustomerID = @CustomerID;
END;

EXEC UpdateCustomerEmail @CustomerID = 3, @Email = 'rohit.updated@gmail.com';

Select * FROM Customers

-- 6. Stored Procedure with Delete Operation --
-- Create a stored procedure named DeleteOrderByID that accepts an OrderID as a parameter and deletes the corresponding order from the Orders table. --
Select * FROM Orders
CREATE PROCEDURE DeleteOrderById
@OrderID INT
AS
BEGIN
DELETE FROM Orders
WHERE OrderID = @OrderID;
END;

EXEC DeleteOrderById @OrderId = 5;

Select * FROM Orders

-- 7. Stored Procedure with Output Parameter -- 
-- Create a stored procedure named GetTotalProductsInCategory that accepts a Category parameter and returns the total number of products in that category using an output parameter. --
CREATE PROCEDURE GetTotalProductsInCategory
@Category VARCHAR(50),
@TotalProducts INT OUTPUT
AS 
BEGIN
  SELECT @TotalProducts = COUNT(*)
    FROM Products
    WHERE Category = @Category;
END;

DECLARE @Result INT;
EXEC GetTotalProductsInCategory @Category = 'Electronics', @TotalProducts = @Result OUTPUT;
SELECT @Result AS TotalProductsInElectronics;

