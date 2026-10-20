SELECT * FROM SalesDB.Customers;

-- Show customers from the USA or Germany with a Score above 400.
SELECT 
	FirstName,
    Score
FROM Customers
WHERE Country IN('USA', 'Germany') AND Score > 400;

-- Show total Sales per CustomerID, highest first.
SELECT 
	CustomerID,
	SUM(Sales) AS Total_sales
FROM Orders
GROUP BY CustomerID
ORDER BY Total_sales DESC;

-- Show products that have never been ordered, using a LEFT JOIN.
SELECT 
*
FROM ORDERS;

SELECT 
	p.Product
FROM PRODUCTS AS p
LEFT JOIN Orders AS o
ON p.ProductId = o.ProductID
WHERE o.productId is null;

-- 4. Show OrderID and ShipAddress in upper case, only for orders whose address contains “Lane”.
SELECT 
	OrderID, 
	UPPER(ShipAddress)
FROM Orders
WHERE ShipAddress LIKE '%Lane%';

-- 5. Show products whose name ends with the letter “s”.
SELECT 
	Product
FROM Products
WHERE Product like '%s';

-- Show the FirstName and total Sales of customers whose total Sales is above 100.
SELECT 
	c.FirstName,
	SUM(o.Sales) as Total_Sales
FROM Orders AS o
LEFT JOIN Customers AS c
ON o.CustomerID = c.CustomerID
GROUP BY c.FirstName 
HAVING Total_Sales > 100;


-- NUMBER FUNCTIONS
-- ROUND FUNCTIONS

SELECT
3.526,
ROUND(3.526, 2),
ROUND(3.526, 1),
ROUND(3.526, 0);

-- ABS()
SELECT 
-2,
ABS(-2),
ABS(2);

use SalesDb;

-- 
SELECT 
OrderDate,
ShipDate,
CreationTime,
TIME(NOW()) AS Today -- EXTRACTION OF DATE, YEAR, MONTH, TIME, MINUTE, SECOND, HOUR
FROM Orders;


-- EXTRACT YEAR FROM CREATION TIME
SELECT 
CreationTime,
YEAR(CreationTime) AS Year_of_creation,
MONTH(CreationTime) AS MONTH_of_creation,
DAY(CreationTime) AS day_of_creation,
HOUR(CreationTime) AS HOUR_of_creation,
WEEK(CreationTime) AS WEEK_of_creation,
-- EXTRACTION MORE
DATE_FORMAT(CreationTime, '%D') AS DAY,
DATE_FORMAT(CreationTime, '%M') AS MONTH,
DATE_FORMAT(CreationTime, '%Y') AS YEAR
FROM Orders;


SELECT
DATE_FORMAT(CreationTime, '%M') AS MONTH,
COUNT(*)
FROM Orders
GROUP BY MONTH;

-- END OF THE MONTH
SELECT 
CreationTime,
LAST_DAY(CreationTime) AS END_OF_MONTH
FROM Orders;

SELECT *
FROM ORDERS;

SELECT 
DATE_FORMAT(CreationTime, '%D ') AS YEAR_OF_ORDER,
COUNT(ORDERId)
FROM Orders
GROUP BY YEAR_OF_ORDER;

-- SHOW ALL ORDERS WHICH WERE PLACED IN THE MONTH OF FEBURARY

SELECT 
	*
FROM Orders
WHERE MONTH(CreationTime) = 2;


SELECT 
	DATE_FORMAT(CreationTime, '%M') feb_orders,
    COUNT(*) AS number_of_orders
FROM Orders
GROUP BY feb_orders
HAVING feb_orders like 'f%';

 
 
 
 
 
 
 






















