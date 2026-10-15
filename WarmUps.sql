-- Show USA customers who have a Score (not NULL), sorted by Score highest first.
SELECT 
*
FROM Customers
WHERE Country = 'USA' AND Score IS NOT NULL
ORDER BY Score DESC;

-- Show orders with OrderStatus = 'Shipped' and Sales between 20 and 60.
SELECT 
*
FROM Orders
WHERE OrderStatus = 'Shipped' AND Sales BETWEEN 20 AND 60;

-- Count the orders where BillAddress is missing, meaning either NULL or an empty string.
SELECT
COUNT(OrderID) as missing_Address
FROM Orders
WHERE BillAddress is null OR BillAddress = '';

-- 4. For each OrderStatus, show the number of orders and the total Sales.

SELECT
OrderStatus,
COUNT(OrderID) AS TotalOrders,
SUM(Sales) AS TotalSales
FROM Orders
GROUP BY OrderStatus;

-- 5. Show each product’s name and the total Quantity ordered, with 0 for products never ordered.

SELECT 
p.Product,
coalesce(SUM(o.Quantity), 0) as Quantity
FROM Products AS p
LEFT JOIN Orders AS o
ON p.ProductID = o.ProductID
GROUP BY p.Product;

-- 6. Show each customer’s FirstName and their latest OrderDate. Customers with no orders should show NULL.
-- SELECT
-- DISTINCT FirstName,
-- OrderDate
-- FROM Customers AS c
-- LEFT JOIN Orders AS o
-- ON c.CustomerID = o.CustomerID
-- ORDER BY OrderDate DESC;
SELECT 
	c.FirstName,
	MAX(o.OrderDate) AS Latest_orderDate
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName;

-- 7. Show each Sales-department employee with their manager’s first name (self join).
SELECT 
	e.FirstName as EmployeeName,
	m.FirstName as ManagerName
FROM Employees AS e
INNER JOIN Employees AS m
ON e.ManagerID = m.EmployeeID 
WHERE e.Department = 'Sales';
															
-- 8. Find the CustomerIDs that ordered ProductID 101 but never ordered ProductID 102.

-- SELECT 
-- 	CustomerID
-- FROM Orders 
-- WHERE ProductID = 101 AND ProductID != 102;

SELECT 
	CustomerID
FROM Orders 
WHERE ProductID = 101
EXCEPT
SELECT 
	CustomerID
FROM Orders 
WHERE ProductID = 102;





-- 9. Create a table customer_totals (CustomerID INT, TotalSales INT). 
-- Fill it with each customer’s total Sales from orders using INSERT INTO ... 
-- SELECT, then delete the rows where TotalSales is below 100.

CREATE TABLE customer_totals(
CustomerID INT PRIMARY KEY NOT NULL,
TotalSales INT
);

INSERT INTO customer_totals(CustomerID, TotalSales) 
SELECT 
	c.CustomerID,
	SUM(o.Sales) as TotalSales
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

SELECT * 
FROM customer_totals;
DROP TABLE customer_totals;

-- 10. Find the product name with the highest total Sales.
SELECT 
	p.Product,
    o.Sales
FROM Products AS p
INNER JOIN Orders AS o
ON p.ProductID = o.ProductID
ORDER BY o.Sales DESC
LIMIT 1;
-- Show USA customers who have a Score (not NULL), sorted by Score highest first.
SELECT 
*
FROM Customers
WHERE Country = 'USA' AND Score IS NOT NULL;

-- Show orders with OrderStatus = 'Shipped' and Sales between 20 and 60.
SELECT 
*
FROM Orders
WHERE OrderStatus = 'Shipped' AND Sales BETWEEN 20 AND 60;

-- Count the orders where BillAddress is missing, meaning either NULL or an empty string.
SELECT
COUNT(OrderID) as missing_Address
FROM Orders
WHERE BillAddress is null OR BillAddress = '';

-- 4. For each OrderStatus, show the number of orders and the total Sales.

SELECT
OrderStatus,
COUNT(OrderID) AS TotalOrders,
SUM(Sales) AS TotalSales
FROM Orders
GROUP BY OrderStatus;

-- 5. Show each product’s name and the total Quantity ordered, with 0 for products never ordered.

SELECT 
p.Product,
coalesce(SUM(o.Quantity), 0) as Quantity
FROM Products AS p
LEFT JOIN Orders AS o
ON p.ProductID = o.ProductID
GROUP BY p.Product;

-- 6. Show each customer’s FirstName and their latest OrderDate. Customers with no orders should show NULL.

SELECT
DISTINCT FirstName,
OrderDate
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID
ORDER BY OrderDate DESC;

-- 7. Show each Sales-department employee with their manager’s first name (self join).


SELECT 
e.FirstName as EmployeeName,
m.FirstName as ManagerName
FROM Employees AS e
INNER JOIN Employees AS m
ON e.ManagerID = m.EmployeeID AND e.Department = 'Sales';
															
-- 8. Find the CustomerIDs that ordered ProductID 101 but never ordered ProductID 102.

SELECT 
	CustomerID
FROM Orders 
WHERE ProductID = 101 AND ProductID != 102;






-- 9. Create a table customer_totals (CustomerID INT, TotalSales INT). 
-- Fill it with each customer’s total Sales from orders using INSERT INTO ... 
-- SELECT, then delete the rows where TotalSales is below 100.

CREATE TABLE customer_totals(
CustomerID INT PRIMARY KEY NOT NULL,
TotalSales INT
);

INSERT INTO customer_totals(CustomerID, TotalSales) 
SELECT 
	c.CustomerID,
	SUM(o.Sales) as TotalSales
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

SELECT * 
FROM customer_totals;
DROP TABLE customer_totals;

-- 10. Find the product name with the highest total Sales.
SELECT 
	p.Product
FROM Products AS p
INNER JOIN Orders AS o
ON p.ProductID = o.ProductID
ORDER BY o.Sales DESC
LIMIT 1;

-- Show USA customers who have a Score (not NULL), sorted by Score highest first.
SELECT 
*
FROM Customers
WHERE Country = 'USA' AND Score IS NOT NULL;

-- Show orders with OrderStatus = 'Shipped' and Sales between 20 and 60.
SELECT 
*
FROM Orders
WHERE OrderStatus = 'Shipped' AND Sales BETWEEN 20 AND 60;

-- Count the orders where BillAddress is missing, meaning either NULL or an empty string.
SELECT
COUNT(OrderID) as missing_Address
FROM Orders
WHERE BillAddress is null OR BillAddress = '';

-- 4. For each OrderStatus, show the number of orders and the total Sales.

SELECT
OrderStatus,
COUNT(OrderID) AS TotalOrders,
SUM(Sales) AS TotalSales
FROM Orders
GROUP BY OrderStatus;

-- 5. Show each product’s name and the total Quantity ordered, with 0 for products never ordered.

SELECT 
p.Product,
coalesce(SUM(o.Quantity), 0) as Quantity
FROM Products AS p
LEFT JOIN Orders AS o
ON p.ProductID = o.ProductID
GROUP BY p.Product;

-- 6. Show each customer’s FirstName and their latest OrderDate. Customers with no orders should show NULL.

SELECT
DISTINCT FirstName,
OrderDate
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID
ORDER BY OrderDate DESC;

-- 7. Show each Sales-department employee with their manager’s first name (self join).


SELECT 
e.FirstName as EmployeeName,
m.FirstName as ManagerName
FROM Employees AS e
INNER JOIN Employees AS m
ON e.ManagerID = m.EmployeeID AND e.Department = 'Sales';
															
-- 8. Find the CustomerIDs that ordered ProductID 101 but never ordered ProductID 102.

SELECT 
	CustomerID
FROM Orders 
WHERE ProductID = 101 AND ProductID != 102;






-- 9. Create a table customer_totals (CustomerID INT, TotalSales INT). 
-- Fill it with each customer’s total Sales from orders using INSERT INTO ... 
-- SELECT, then delete the rows where TotalSales is below 100.

CREATE TABLE customer_totals(
CustomerID INT PRIMARY KEY NOT NULL,
TotalSales INT
);

INSERT INTO customer_totals(CustomerID, TotalSales) 
SELECT 
	c.CustomerID,
	SUM(o.Sales) as TotalSales
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

SELECT * 
FROM customer_totals;
DROP TABLE customer_totals;

-- 10. Find the product name with the highest total Sales.
SELECT 
	p.Product,
    SUM(o.Sales) as TotalSales
FROM Products AS p
INNER JOIN Orders AS o
ON p.ProductID = o.ProductID
GROUP BY p.Product
ORDER BY SUM(o.Sales) DESC
LIMIT 1;



































