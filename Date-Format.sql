-- FORMAT DATE AND TIME VALUE
SELECT * FROM Orders;
USE SalesDB;
SELECT 
	DATE_FORMAT(CreationTime, '%d-%m-%Y') 
FROM Orders;

-- SHOW CREATION TIME AS : Day Wed Jan Q1 12:36:33 PM 
SELECT 
CreationTime,
CONCAT('Day ',  
DATE_FORMAT(CreationTime, '%a %b '), ' Q',
QUARTER(CreationTime), ' ', 
DATE_FORMAT(CreationTime, '%h:%i %p')) AS new_formated_date
FROM Orders;

-- More aggration specific 

SELECT 
DATE_FORMAT(CreationTime, '%M %y') AS AGG,
COUNT(*) AS Number_of_orders
FROM Orders
GROUP BY AGG;





