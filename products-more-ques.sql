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
-- 1. Show all columns from customers.











