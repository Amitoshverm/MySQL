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
-- 1. Show customers who are not from Germany. -- 
SELECT 
*
FROM Customers
WHERE Country != 'Germany';

-- 2. Show orders with Sales greater than 30.-- 
SELECT 
*
FROM Orders
WHERE Sales > 30;

-- 3. Show employees in the Sales department with Salary of 75000 or more.-- 
SELECT 
*
FROM Employees
WHERE Department = 'Sales' AND Salary >= 75000;

-- 4. Show customers who are from Germany or have a Score above 800.--  
SELECT 
*
FROM Customers
WHERE Country = 'Germany' OR Score > 800;

-- 5. Show orders that are 'Shipped' and have Quantity greater than 1.
SELECT 
*
FROM Orders
WHERE OrderStatus = 'Shipped' AND Quantity > 1;

-- 6. Show orders placed in February 2025, using BETWEEN.
SELECT 
*
FROM Orders
WHERE OrderDate BETWEEN '2025-02-01' AND '2025-02-28';

SELECT 
*
FROM Orders
WHERE OrderDate >= '2025-02-01' AND OrderDate <= '2025-02-28';

-- 7. Show employees born between 1980-01-01 and 1989-12-31.
SELECT 
*
FROM Employees 
WHERE BirthDate BETWEEN '1980-01-01' AND '1989-12-31';

-- 8. Show orders for ProductID in (101, 104). Then show the ones not in that list.
SELECT 
*
FROM Orders
WHERE ProductID IN (101, 104);

SELECT 
*
FROM Orders
WHERE ProductID NOT IN (101, 104);

-- 9. Show customers whose FirstName starts with “M”, then customers whose FirstName has exactly 4 letters (hint: _).
SELECT 
*
FROM Customers
WHERE FirstName like 'M%';

SELECT 
*
FROM Customers
WHERE LENGTH(FirstName) = 4;

-- 10. Show orders whose ShipAddress contains “Lane” or “Court”.--
SELECT 
* 
FROM Orders
WHERE ShipAddress LIKE '%LANE%' OR ShipAddress LIKE  '%Court%';

-- C. NULL handling
-- Show customers who have no LastName.
SELECT 
*
FROM Customers
WHERE LastName is null;

-- Show customers who have a Score (not NULL).
SELECT 
*
FROM Customers
WHERE Score is not null;

-- Count orders where BillAddress IS NULL, then count where BillAddress = ''. Why do the numbers differ?
SELECT 
COUNT(*) AS null_BillAddress
FROM Orders
WHERE BillAddress is null;

SELECT 
COUNT(*) AS null_BillAddress
FROM Orders
WHERE BillAddress = '';

-- Show FirstName and Score from customers, displaying 0 instead of NULL (hint: COALESCE).
SELECT 
	FirstName,
	coalesce(Score, 0)
FROM Customers;

-- Run WHERE Score <= 500 on customers. Does Anna appear? Explain why.
SELECT
*
FROM Customers
WHERE Score <= 500;
-- Because Anna has score of null

-- D. Aggregates, GROUP BY, HAVING
-- Find the total Sales and the number of orders.

SELECT
	SUM(Sales) as total_Sales, 
	SUM(OrderId) AS Total_number_of_orders
FROM Orders;

-- Find the average, minimum, and maximum Sales.
SELECT 
	AVG(Sales) as avg_sales,
    MIN(Sales) as min_sales,
    MAX(Sales) as max_sales
FROM Orders;

-- Count customers in each Country.
SELECT 
	Country,
	Count(CustomerID) as total_customer
FROM Customers
GROUP BY Country;

-- Find total Sales per CustomerID in orders, highest first.
SELECT 
	CustomerID,
	SUM(Sales) as Total_sales
FROM Orders
GROUP BY CustomerID
ORDER BY SUM(Sales) DESC;

-- Find total Quantity per OrderStatus.
SELECT 
	OrderStatus,
	SUM(Quantity) as total_quantity
FROM Orders
GROUP BY OrderStatus;

-- Find the average Salary per Department.
SELECT 
	Department,
	AVG(Salary) as avg_salary
FROM Employees
GROUP BY Department;
select * from Employees;

-- Find the ProductIDs that appear in more than 2 orders.

SELECT 
	ProductID,
	COUNT(ProductID) AS Appeareance
FROM Orders
GROUP BY ProductID
HAVING COUNT(ProductId) >= 2;

-- Run COUNT(*), COUNT(Score), and COUNT(LastName) on customers in one query. Why do the results differ?
SELECT 
	COUNT(*),
	COUNT(Score),
	COUNT(LastName)
FROM Customers;
-- what i think is * counts the total number of primary id, score counted which had values not nulls, same for lastname as well ignoring nulls

-- E. DDL and DML
-- Create a table shipped_orders with OrderID, ProductID, CustomerID, Sales, 
-- then use INSERT INTO ... SELECT to copy in only the shipped orders.
select * from orders;
CREATE TABLE shipped_orders(
	OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    CustomerID INT NOT NULL,
    Sales INT
);

INSERT INTO shipped_orders(OrderID, ProductID, CustomerID, Sales)
SELECT 
	OrderID, 
    ProductID, 
    CustomerID, 
    Sales
FROM Orders 
WHERE OrderStatus = 'Shipped';

SELECT * FROM shipped_orders;

-- In shipped_orders, increase Sales by 10% for ProductID 101.
UPDATE shipped_orders
SET Sales = (Sales / 10 ) + Sales
WHERE ProductID = 101;

-- In shipped_orders, delete rows where Sales is below 20.
DELETE 
FROM shipped_orders
WHERE Sales < 20;

-- Use ALTER TABLE to add a Notes VARCHAR(100) column to shipped_orders.
ALTER TABLE shipped_orders
ADD COLUMN Notes VARCHAR(100);

-- Insert a new customer (6, ‘Peter’, ‘Hall’, ‘UK’, 0) using INSERT INTO ... VALUES.
SELECT * FROM Customers;
INSERT INTO Customers(CustomerID, FirstName, LastName, Country, Score)
VALUES(6, 'Peter', 'Hall', 'UK', 0);

-- Create high_earners (EmployeeID, FirstName, Salary), fill it with employees earning 65000 or more, 
-- then TRUNCATE it, then DROP it. Explain what each step did.
CREATE TABLE high_earners(
	EmployeeID INT,
    FirstName VARCHAR(20),
    Salary INT
);
-- created table high_earners with column names and datatypes 

INSERT INTO high_earners(EmployeeID, FirstName, Salary)
SELECT 
	EmployeeID, 
	FirstName, 
	Salary
FROM Employees
WHERE Salary >= 65000;
-- then inserted the data from employees table which had equal to or more than 65000 salaries

-- Show OrderID, FirstName, and Sales for every order (INNER JOIN orders and customers).
SELECT 
	o.OrderID, 
    c.FirstName, 
    o.Sales
FROM Orders o 
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID;

-- Show all customers with their OrderID, keeping customers who have no orders.
SELECT 
c.*,
o.OrderID
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID;


-- Find customers who have never placed an order (left anti join).
SELECT 
c.*
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerId
WHERE o.OrderId is null;


-- Find products that have never been ordered.
SELECT 
	p.Product,
    COUNT(Quantity) as Quantity
FROM Products p 
LEFT JOIN Orders o 
ON p.ProductID = o.ProductId
GROUP BY Product
HAVING Quantity = 0;

-- Show each order with its product name and category, sorted by Sales.
SELECT
	o.*,
	p.Product AS ProductName,
	p.category
FROM orders AS o
LEFT JOIN Products AS p
ON o.ProductID = p.ProductID
ORDER BY Sales;

-- Show each customer’s FirstName and total Sales, including customers with no orders (show 0 for them).
SELECT 
	c.FirstName,
    coalesce(SUM(Sales) , 0) AS Total_Sales
FROM Customers AS c
LEFT JOIN Orders AS o 
ON c.CustomerID = o.CustomerID
GROUP BY FirstName;

-- Show each order with the first name of the salesperson (SalesPersonID matches EmployeeID).
SELECT 
o.*,
e.FirstName
FROM Orders AS o
LEFT JOIN Employees AS e
ON o.SalesPersonID = e.EmployeeID;

-- Stretch (self join): show each employee with their manager’s first name. Frank must still appear.
SELECT 
e.*,
m.FirstName AS manager
FROM Employees AS e
LEFT JOIN Employees m
ON e.ManagerID = m.EmployeeID;



-- Find total Sales per product Category, only for categories above 100.
SELECT 
	p.Category,
	SUM(o.Sales) AS TotalSales
FROM Products AS p
INNER JOIN Orders AS o
ON p.ProductID = o.ProductID
GROUP BY p.Category
HAVING SUM(o.Sales) > 100;









-- Show all USA customers with their delivered orders only, keeping USA customers who have none. 
-- Try it with the condition in WHERE, then in ON, and compare.

SELECT 
c.*,
o.OrderId
FROM Customers AS c
left JOIN Orders AS o
ON c.CustomerId = o.CustomerId
WHERE c.Country = 'USA' AND o.OrderStatus = 'Delivered';


-- Find the salesperson (first name) with the highest total Sales.
SELECT 
e.FirstName,
SUM(o.sales) AS TotalSales
FROM Employees AS e
INNER JOIN Orders AS o
ON e.EmployeeID = o.SalesPersonID
GROUP BY FirstName
ORDER BY TotalSales DESC
LIMIT 1;