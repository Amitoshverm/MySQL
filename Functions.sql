SELECT * FROM MyDatabase.customers;
use MyDatabase;

-- string functions
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
FROM Customers
