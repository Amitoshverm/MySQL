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






