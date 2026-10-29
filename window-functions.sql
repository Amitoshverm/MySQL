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









    