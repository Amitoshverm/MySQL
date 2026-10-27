-- BASICS 
-- COUNT(*), AVG(), SUM(), MIN(), MAX()
SELECT 
	COUNT(CustomerID) as total_customers
FROM Customers;


SELECT 
	AVG(COALESCE(Score, 0)) AS AVG_score
FROM Customers;

SELECT 
	SUM(SCORE) AS TOTAL_SCORE
FROM Customers;

SELECT 
	MIN(Score) as min_score
FROM Customers;
SELECT 
	MAX(Score) as min_score
FROM Customers;

SELECT 
	MAX(SCORE) AS BEST_SCORE,
    MIN(SCORE) AS LEAST_SCORE,
    AVG(COALESCE(Score, 0)) AS AVG_SCORE,
    SUM(SCORE) AS TOTAL_SCORE,
    COUNT(*) AS TOTAL_CUSTOMERS
FROM Customers;










