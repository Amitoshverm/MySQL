-- Case

SELECT 
	ORDERID, PRODUCTID, CUSTOMERID,SALES,
    CASE
		WHEN SALES > 50 THEN 'HIGH'
		WHEN SALES > 30 THEN 'MID'
		ELSE 'LOW'
	END AS high_low
FROM ORDERS;



SELECT 
*
FROM ORDERS;

SELECT 
	ORDERID, 
    PRODUCTID, 
    CUSTOMERID,
    SALES,
    CASE
		WHEN SALES > 50 THEN 'HIGH'
        WHEN SALES > 20 THEN 'MID'
        ELSE 'LOW'
	END AS 'CATEGORY'
FROM ORDERS
ORDER BY SALES DESC;
-- Rules with CASE Statements, when doing THEN return data types must be same accross WHEN AND ELSE 

SELECT 
	*
FROM CUSTOMERS;

USE MYDATABASE;
SELECT 
	*
FROM CUSTOMERS;


SELECT 
	*
FROM ORDERS;
USE SALESDB;


SELECT
	*
FROM EMPLOYEES;

SELECT 
	EmployeeID,
    CONCAT_WS(' ', FirstName, LastName) AS FullName,
    CASE
		WHEN Gender = 'M' THEN 'Male'
        ELSE 'Female'
	END
FROM EMPLOYEES;



SELECT 
	EmployeeID,
    CONCAT(COALESCE(FirstName, ''),' ', COALESCE(LastName, '')) AS FullName,
    GENDER,
    CASE
		WHEN Gender = 'F' THEN 'Female'
        WHEN Gender = 'M' THEN 'Male'
        ELSE 'NOT AVAIALBLE'
	END AS full_gender
FROM EMPLOYEES;


-- select customers details with their country code
SELECT 
	DISTINCT Country
FROM Customers;
SELECT 
	*,
	CASE 
		WHEN country = 'Germany' THEN 'DE'
		WHEN country = 'USA' THEN 'US'
        ELSE 'N/A'
	END AS Country_code
FROM CUSTOMERS;

-- lets reformat the Case query Quick form of case statement

SELECT 
	*,
	CASE country
		WHEN 'Germany' THEN 'DE'
		WHEN 'USA' THEN 'US'
        ELSE 'N/A'
	END AS Country_code
FROM CUSTOMERS;

-- Handling nulls with Case Statements
-- GET AVG SCORES AND TREAT NULLS AS 0

SELECT 
	*,
    CASE
		WHEN SCORE IS NULL THEN 0
        ELSE SCORE
	END AS CleanScore,
    
    AVG(
		CASE
			WHEN SCORE IS NULL THEN 0
			ELSE SCORE
		END 
        ) OVER() AS CleanAVGScore,
    AVG(Score) OVER() AS Avg_score
FROM Customers;

 -- conditional aggrigation 
 -- Count how many times customers had orders which has sales more than 30

SELECT 
	CustomerID,
		SUM(CASE
			WHEN Sales > 30 THEN 1
			ELSE 0
		END) AS Order_With_High_Sales,
    COUNT(*) AS TOTAL_ORDER
FROM orders
GROUP BY CustomerID;

-- CASE STATEMENTS
-- USE CASE: 
-- 1. Categorising data 
-- 2. Mapping values
-- 4. Handling nulls
-- 5. Conditional aggregation









