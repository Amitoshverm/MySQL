SELECT 
	Category,
    COUNT(*) AS total_products
FROM PRODUCTS
GROUP BY Category;

SELECT 
*
FROM ORDERS;

SELECT 
	p.Product,
    P.ProductId,
    SUM(o.Sales)
FROM Orders AS o
INNER JOIN Products AS p
ON o.ProductID = p.ProductID
GROUP BY p.Product, p.productID; 


SELECT 
	PRODUCTID,
	SUM(SALES) AS TOTALSALES
FROM ORDERS
GROUP BY PRODUCTID;
	
    
    
-- Find the total sales of each Product, Additionally provide details such as orderId, orderDate 
SELECT
	OrderId,
	ProductID,
    SUM(Sales) OVER(PARTITION BY ProductID) AS Total_sales_by_products,
    OrderDate
FROM ORDERS;
    
select * from orders;    

SELECT 
	p.Product,
    SUM(COALESCE(o.Sales, 0)) -- OVER(PARTITION BY p.ProductId)
FROM Products AS p
LEFT JOIN Orders AS o
ON p.ProductID = o.ProductID
GROUP BY p.Product;

-- Find total sales accross all orders, with additional information such as orderId and orderDate
SELECT 
	OrderID,
    OrderDate,
    SUM(Sales) OVER() AS Total_Sales
FROM ORDERS;

--  Find total sales for each product, with additional information such as orderId and orderDate
SELECT 
	OrderID, 
    OrderDate,
    ProductID,
    SUM(Sales) OVER(PARTITION BY ProductID) AS TotalSales
FROM Orders;

-- Now i want sales infomation at different granulles 
SELECT 
	OrderID, 
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER() AS TotalSales,
    SUM(Sales) OVER(PARTITION BY ProductID) AS TotalSalesPerProduct,
    SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) AS Sales_By_Product_OrderStatus
FROM Orders;


-- RANK each order based on their sales from highest to lowest 
-- additionally provide details such as orderID, orderDate
SELECT 
	OrderID,
    OrderDate,
    Sales,
    RANK() OVER (ORDER BY Sales DESC) AS Rank_Sales
FROM Orders;

SELECT * FROM CUSTOMERS;
SELECT 
	CONCAT_WS(' ', FirstName, LastName) as FullName,
    Country,
    Score,
    RANK() OVER(PARTITION BY Country ORDER BY SCORE DESC) AS Country_Rank
FROM CUSTOMERS;


SELECT 
	OrderId,
    ORderDate,
    OrderStatus,
    Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY ORderDate 
	ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS TotalSalesByDateS
FROM Orders;

-- Total number of orders for each product 

SELECT 
	OrderID,
	ProductID,
	COUNT(*) OVER(PARTITION BY ProductId)
FROM Orders;


SELECT
	OrderId,
    OrderDate,
    CustomerID,
	COUNT(*) OVER() AS total_orders,
	COUNT(*) OVER(PARTITION BY CustomerID) AS total_orders
FROM Orders;


SELECT
	*,
    COUNT(*) OVER() AS TOTALCUSTOMERS,
	COUNT(Score) OVER() AS TotalScores
FROM Customers;


-- Check duplicate orders
SELECT 
*
FROM (
	SELECT
		OrderID,
		COUNT(*) OVER(PARTITION BY OrderID) AS CheckPK
	FROM OrdersArchive
)
t WHERE CheckPK > 1;













    