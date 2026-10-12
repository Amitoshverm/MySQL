SELECT * FROM SalesDB.Customers;
use SalesDB;
SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Orders;
SELECT * FROM Products;

-- get customers firstname lastname and the sales 

SELECT 
	o.OrderId,
	o.Sales,
    c.FirstName as 'CustomerFirstName',
    c.LastName as 'CustomerLastName',
    p.Product AS 'ProductName',
    e.FirstName AS 'EmployeeFirstName',
    e.LastName AS 'EmployeeLastName'
FROM Orders AS o
LEFT JOIN Customers AS c
ON o.CustomerId = c.CustomerId
LEFT JOIN Products AS p 
ON o.ProductId = p.ProductId
LEFT JOIN Employees AS e
ON o.SalesPersonID = e.EmployeeID;

-- Practice questions 50 --
-- A --
-- 1. Show all columns from customers.
SELECT 
*
FROM Customers;

-- 2. Show FirstName, LastName, Country from customers, renamed to First, Last, Nation.
SELECT 
	FirstName as 'First',
	LastName as 'Last',
	Country as Nation
FROM Customers;

-- 3. Show the distinct Country values in customers.
SELECT DISTINCT 
	Country
FROM Customers;

-- 4. Show the distinct OrderStatus values in orders.-- 
SELECT 
	DISTINCT OrderStatus
FROM Orders;

-- 5. List all employees sorted by Salary, highest first.-- 
SELECT 
*
FROM Employees
ORDER BY Salary DESC;

-- 6. Show the 3 most recent orders by OrderDate.-- 
SELECT 
*
FROM Orders
ORDER BY OrderDate DESC
LIMIT 3;

-- 7. Show the 2 cheapest products.-- 
SELECT 
*
FROM Products
ORDER BY Price ASC
LIMIT 2;

-- 8. Show each employee’s FirstName, Salary, and a column AnnualBonus equal to 10% of salary.-- 
SELECT 
	FirstName,
	Salary,
	(Salary/10) as AnnualBonus
FROM Employees;

-- 9. Show OrderID, Quantity, Sales, and a column UnitPrice (Sales / Quantity). What does order 10 give you?-- 
SELECT 
	OrderId,
	Quantity,
	(Sales/Quantity) as UnitPrice
FROM Orders;

-- 10. Show the distinct combinations of Department and Gender in employees, sorted by Department.-- 
SELECT 
	DISTINCT Department, Gender
FROM Employees
ORDER BY Department;

-- B -- 
-- Show customers who are not from Germany.
















