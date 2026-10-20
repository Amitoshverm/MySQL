SELECT * FROM MyDatabase.customers;
use MyDatabase;

-- string functions (MANIPULATION)
--  CONCAT()
SELECT
CONCAT(first_name, ' ', Country) as combined_name
FROM Customers; 

-- UPPER() AND LOWER()
SELECT 
UPPER(first_name) as FirstName,
LOWER(Country) as country
FROM Customers;


-- TRIM()
-- HOW TO KNOW IF MY STRING HAS SPACES(TRAILING OR LEADING) 
SELECT 
first_name
FROM Customers
WHERE first_name != TRIM(first_name);

SELECT 
first_name,
LENGTH(first_name) AS beforeTrim,
LENGTH(TRIM(first_name)) AS AfterTrim
FROM Customers;


-- REPLACE(original value, 'what to replace', 'the replacement')

SELECT 
'09-09-1998' AS DOB_OLD,
REPLACE('09-09-1998', '-', '/') AS DOB_NEW;

SELECT * FROM ORDERS;


-- CALCULATION
-- LENGTH()

SELECT 
first_name,
LENGTH(first_name) as chars
FROM customers;

-- STRING EXTRACTION
-- LEFT() & RIGHT()

-- extract first 2 letter of first name from customers
-- do the same thing for right as well 
SELECT 
first_name,
LEFT(TRIM(first_name), 2),
RIGHT (TRIM(first_name), 2)
FROM customers;

USE SalesDB;

-- Show each customer’s full name as FullName (FirstName and LastName with a space between). What happens for Mary? Then fix it.
select * from customers;

SELECT 
CONCAT(FirstName, ' ', coalesce(LastName, '')) AS FULL_NAME
FROM Customers;


-- Show each customer’s FirstName in upper case and Country in lower case.
SELECT 
UPPER(FirstName) AS FIRSTNAME,
LOWER(Country) AS country
FROM Customers;

-- Show each customer’s FirstName and its length, longest name first.
SELECT 
FirstName, 
LENGTH(FirstName) AS len_firstName
FROM Customers
ORDER BY LENGTH(FirstName) DESC;

-- Show each product’s name with its first 3 letters and its last 2 letters as separate columns.
SELECT
LEFT(Product, 3) first_three,
RIGHT(Product, 2) last_two
FROM PRODUCTS;

-- Show OrderID and ShipAddress with 'Court' replaced by 'Ct'.
SELECT 
OrderID,
REPLACE(ShipAddress, 'Court', 'Ct') courtAsCt
FROM Orders;

-- Show OrderID and the house number from ShipAddress, meaning the text before the first space. 
-- What do you get for the orders with no address?

SELECT 
*
FROM ORDERS;


-- Show each customer’s initials, like JG for Jossef Goldberg. Mary has no last name, so decide how to handle her.
SELECT 
CONCAT(coalesce(LEFT(FirstName, 1), ''),'', coalesce(LEFT(LastName, 1), '')) AS customer_initials
FROM Customers;

-- Show each employee’s email as lower-case firstname.lastname@company.com. 
-- Mary has no last name, so make her email mary@company.com instead of NULL.
SELECT 
	CONCAT(
    coalesce(LOWER(FirstName), ''), 
	'.', 
	coalesce(LOWER(LastName), ''), '@company.com'
    ) as emp_email
FROM Employees;

-- Show OrderID and the length of BillAddress. What do you get for NULL rows compared with blank ('') rows, and why?

SELECT 
LENGTH(BillAddress)
FROM Orders;
-- at null position i get nulls and at blanks i get 0

-- Count the customers per first letter of FirstName, and sort the result by the letter.-- 
SELECT  
	
	(LEFT(FirstName, 1)) AS FirstLetter,
    COUNT(LEFT(FirstName, 1)) 
FROM Customers
GROUP BY (LEFT(FirstName, 1))
ORDER BY FirstLetter;

-- SUBSTRING()
-- REMOVE FIRST LETTER FROM FIRSTNAME

SELECT 
	FirstName,
	SUBSTRING(FirstName, 2, LENGTH(FirstName))
FROM Customers;

USE MyDatabase;
SELECT 
	First_name,
	SUBSTRING(TRIM(First_name), 2, LENGTH(First_name))
FROM Customers;



















