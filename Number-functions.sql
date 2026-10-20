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



