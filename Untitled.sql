use SalesDB;
SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM Products;

-- SET OPERATORS -- 
-- Rules to use 
-- 1. matching column datatype
-- 2. same number of column 
-- 3. 1st Query controls the naming of the output, so create alias in first query 
-- 4. Ordering also matters. So Map correct columns. 
-- 5. ORDER BY can be used once 
use SalesDB;
SELECT 
    FirstName,
    LastName
FROM Customers

UNION

SELECT 
	FirstName,
    LastName
FROM Employees;


SELECT 
    FirstName,
    LastName
FROM Customers

UNION ALL

SELECT 
	FirstName,
    LastName
FROM Employees;


-- FIND EMPLOYEES WHICH ARE NOT CUSTOMER AT SAME TIME 
SELECT 
    FirstName,
    LastName
FROM Employees
EXCEPT
SELECT 
	FirstName,
    LastName
FROM Customers;

-- FIND EMPLOYEES WHO ARE ALSO CUSTOMER
SELECT 
    FirstName,
    LastName
FROM Employees
INTERSECT
SELECT 
	FirstName,
    LastName
FROM Customers;

-- QUESTIONS: 
-- Make one list of FirstName and LastName from Customers and Employees, 
-- with duplicates removed. Predict the row count before you run it.
SELECT 
	FirstName,
    LastName
FROM Customers
UNION
SELECT 
	FirstName,
    LastName
FROM Employees;

-- Repeat Q1 with UNION ALL. How many more rows do you get, and which people are repeated?
SELECT 
	FirstName,
    LastName
FROM Customers
UNION ALL
SELECT 
	FirstName,
    LastName
FROM Employees;
-- MARRY is repeated 

-- Add a literal column Type ('Customer' or 'Employee') to each side of the UNION in Q1. Does the row count change? Why?
SELECT 'Customer' AS Type, FirstName, LastName
FROM Customers
UNION
SELECT 'Employee' AS Type, FirstName, LastName
FROM Employees;

-- Combine all ProductIDs from Products and Orders using UNION, then UNION ALL. Compare the counts.

SELECT 
	ProductId
FROM Products
UNION 
SELECT 
	ProductId
FROM Orders;

SELECT 
	ProductId
FROM Products
UNION ALL
SELECT 
	ProductId
FROM Orders;

-- Combine CustomerID and OrderDate from Orders where OrderStatus = 'Shipped' with the same columns where OrderStatus = 'Delivered'. 
-- Would UNION and UNION ALL ever differ here? Sort the result by OrderDate.

SELECT 
	CustomerId, 
	OrderDate
FROM Orders
WHERE OrderStatus = 'Shipped'
UNION
SELECT 
	CustomerId, 
	OrderDate
FROM Orders
WHERE OrderStatus = 'Delivered'
ORDER BY OrderDate;

SELECT 
	CustomerId, 
	OrderDate
FROM Orders
WHERE OrderStatus = 'Shipped'
UNION ALL
SELECT 
	CustomerId, 
	OrderDate
FROM Orders
WHERE OrderStatus = 'Delivered'
ORDER BY OrderDate;

-- EXCEPT
-- Find the ProductIDs that are in Products but never in Orders.
SELECT 
	ProductID
FROM Products
EXCEPT
SELECT
	ProductID
FROM Orders;

-- Find the EmployeeIDs that never appear as a SalesPersonID in Orders.
SELECT 
	EmployeeID
FROM Employees
EXCEPT
SELECT 
	SalesPersonID
FROM Orders;

-- Find customer FirstNames that are not employee FirstNames.
SELECT 
	FirstName
FROM Customers
EXCEPT
SELECT 
	FirstName
FROM Employees;

-- Run Orders EXCEPT Products on ProductID (the reverse of Q6). What do you get, and what does that tell you?
SELECT 
	ProductID
FROM Orders
EXCEPT
SELECT 
	ProductID
FROM Products;
-- its blank 

-- INTERSECT
-- Find the CustomerIDs that appear in both Customers and Orders.
SELECT 
	CustomerID
FROM Customers
INTERSECT
SELECT 
	CustomerID
FROM Orders;

-- Find first names that appear in both Customers and Employees.
SELECT 
	FirstName
FROM Customers
INTERSECT
SELECT 
	FirstName
FROM Employees;

SELECT 
	FirstName, LastName
FROM Customers
INTERSECT
SELECT 
	FirstName, LastName
FROM Employees;
-- yes marry matches, because she exists in both 

-- Find the CustomerIDs that have orders but never a 'Delivered' one (hint: EXCEPT).
SELECT 
	CustomerID
FROM Orders
EXCEPT
SELECT
	CustomerID
FROM Orders
WHERE OrderStatus = 'Delivered';
	

-- Find the CustomerIDs that have both a 'Delivered' order and a 'Shipped' order (hint: INTERSECT).
SELECT 
	CustomerID
FROM Orders
WHERE OrderStatus = 'Delivered'
INTERSECT
SELECT 
	CustomerID
FROM Orders
WHERE OrderStatus = 'Shipped';

-- -- Find the CustomerIDs that have orders but never a 'Delivered' one (hint: EXCEPT).
SELECT 
	a.CustomerID
FROM Orders AS a
LEFT JOIN Orders AS B
ON a.CustomerID = b.CustomerID
WHERE OrderStatus = 'Shipped';















