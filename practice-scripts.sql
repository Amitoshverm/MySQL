use MyDatabase;

SELECT 
	first_name as name, 
	country, 
	score
FROM customers;


SELECT 
	first_name as name, 
	country, 
	score
FROM customers
WHERE score > 700;

SELECT 
	first_name as name, 
	country, 
	score
FROM customers
WHERE country like "U%k";

SELECT * FROM customers;
SELECT 
	first_name as name, 
	country, 
	score
FROM customers 
WHERE score != 0;

SELECT 
	first_name as name, 
	country, 
	score
FROM customers
WHERE country = "germany";


SELECT 
	*
FROM customers
ORDER BY country asc, score desc;

SELECT 
	country, 
    sum(score) as total_score
FROM customers
GROUP BY country;



SELECT 
country,
sum(score) AS total_score,
count(id) AS total_customer
FROM customers
GROUP BY country;


-- SELECT 
-- 	distinct country
-- FROM customers;
-- -- GROUP BY country; 


SELECT 
	country,
	sum(score) as total_score
FROM customers
GROUP BY country
HAVING total_score > 800;

SELECT 
	country,
	sum(score) as total_score
FROM customers
WHERE score > 400
GROUP BY country
HAVING total_score > 800;

SELECT 
	country,
    avg(score) as avg_score
FROM customers
WHERE score != 0
GROUP BY country 
HAVING avg_score > 500
ORDER BY avg_score desc;









SELECT 
country,
AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;


SELECT 
DISTINCT country
FROM customers;

-- SELECT TOP 3 *
-- FROM customers;
-- TOP is not supported in mysql we use LIMIT at the end with ORDER BY 

SELECT 
* 
FROM customers
ORDER BY score asc
LIMIT 2;

use MyDatabase;
SELECT 
*
FROM orders 
ORDER BY order_date desc
LIMIT 2;

SELECT 
* 
FROM customers;

SELECT 
*
FROM orders;

SELECT 
*
FROM customers c 
join orders o 
ON c.id = o.customer_id;

SELECT 
	id,
	first_name, 
	country,
'New Customer' as customer_type
FROM customers;


-- DDL commands -- 

CREATE TABLE persons(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	birth_data DATE,
	phone_number VARCHAR(15) 
);

SELECT 
*
FROM persons;

ALTER TABLE persons
DROP COLUMN phone_number;

ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL;


DROP TABLE persons;

-- DML Commands -- 
SELECT * FROM customers;

INSERT INTO customers(id, first_name, country, score)
VALUES(6, "Sam", "USA", null),
	(7, "Ron", null, null);
    
INSERT INTO customers(id, first_name, country, score)
VALUES(8, "Ram", "India", 900),
	(9, "Illa", "France", 300);


CREATE TABLE persons (
id INT PRIMARY KEY,
person_name VARCHAR(50) NOT NULL,
birth_date DATE,
phone_number VARCHAR(15)
);

INSERT INTO persons(id, person_name, birth_date, phone_number)
SELECT 
id,
first_name,
null,
"UNKNOWN"
FROM customers;

select * from customers where id = 9;

UPDATE customers
SET score = 0
WHERE id = 6;

UPDATE customers
SET score = 0, country = "UK"
WHERE id = 9;

UPDATE customers
SET score = 0
WHERE score is null;

-- DELETE -- 
select * from persons;

DELETE FROM persons
where id > 5;

DELETE FROM customers
WHERE id > 5;

SELECT * FROM persons;

TRUNCATE TABLE persons;


-- QUESTIONS -- 

-- Show all customers whose first_name starts with the letter “A”.-- 
SELECT 
*
FROM customers
WHERE first_name like "a%";

-- List the 5 most recent orders, sorted by order_date descending.-- 
SELECT 
	order_id, 
	customer_id,
	order_date
FROM orders
ORDER BY order_date DESC
LIMIT 5;


-- Show all customers from Germany.-- 
SELECT 
	*
FROM customers
WHERE country like "Germany";


-- Show customers with a score greater than 400, sorted from highest to lowest.-- 
SELECT 
	*
FROM customers
WHERE score > 400
ORDER BY score DESC;

-- Find the customer with the highest score (use ORDER BY and LIMIT).-- 
SELECT 
	first_name,
	score
FROM customers
ORDER BY score DESC
LIMIT 1;

-- Count how many customers there are in each country.-- 
SELECT 
	country,
	COUNT(id) as total_customers
FROM customers
GROUP BY country;

-- Find the average score per country, but only for countries where the average is above 400.-- 
SELECT 
	country,
	AVG(score) as avg_score
FROM customers
GROUP BY country
HAVING avg(score) > 400;

-- Show customers whose first_name starts with “M”.-- 
SELECT 
	first_name
FROM customers
WHERE first_name like "m%";

-- Show customers whose score is not 0, and add a column score_after_bonus that adds 50 to the score (this practices aliases).
SELECT 
	*,
    (score + 50) as score_after_bonus
FROM customers
WHERE score != 0;

-- Show orders placed between 2021-03-01 and 2021-07-31.
SELECT 
*
FROM orders
WHERE order_date BETWEEN "2021-03-01" and "2021-07-31";

-- Find the total sales and the number of orders, in one query. -- 
SELECT 
SUM(sales) as total_sales,
COUNT(order_id) AS orders 
FROM orders;

-- Show the order with the highest sales, and the orders with sales of 15 or more, sorted by order_date.
SELECT 
*
FROM orders
WHERE sales >= 15
ORDER BY order_date ASC;

-- Create a table german_customers with the same columns as customers, then use INSERT INTO ... SELECT to copy in only the German customers.

CREATE TABLE german_customers(
	id INT PRIMARY KEY,
	first_name VARCHAR(15) NOT NULL,
	country VARCHAR(20),
	score INT
);

select * from customers where country = 'Germany';

INSERT INTO german_customers(id, first_name, country, score)
SELECT 
	id,
	first_name,
	country,
	score
	FROM customers
WHERE country = 'Germany';

-- UPDATE the score of customers with a score of 0 to 10, then check with SELECT.
-- UPDATE customers
-- SET score = 0, country = "UK"
-- WHERE id = 9;

UPDATE german_customers
SET score = 10
WHERE id = 4;

-- DELETE one row from german_customers using WHERE, then TRUNCATE the table.
DELETE FROM german_customers
where id = 1;

TRUNCATE TABLE german_customers;


-- Customer 2’s first_name looks like it has a leading space ( John). 
-- Try SELECT * FROM customers WHERE first_name = 'John'; 
-- and see if it returns nothing, then fix it with TRIM(first_name).

select * from customers where first_name = 'John';

UPDATE customers
SET first_name = 'John'
WHERE id = 2;

SELECT 
*
FROM customers
WHERE country <> 'Germany';

SELECT 
*
FROM customers
WHERE score >= 500;


-- AND -- 
SELECT 
*
FROM customers
WHERE score > 500 AND country = 'USA';

-- OR -- 
SELECT 
*
FROM customers
WHERE country = 'USA' OR score > 500;

-- NOT -- 
SELECT 
*
FROM customers
WHERE NOT score < 500;


-- BETWEEN -- 
SELECT 
*
FROM customers
WHERE score BETWEEN 100 AND 500;   

-- IN and NOT IN -- 
-- this is preferred more as its clean -- 
SELECT 
*
FROM customers
WHERE country IN ('USA', 'Germany');

SELECT 
*
FROM customers
WHERE country = 'USA' OR country = 'Germany';


SELECT 
*
FROM customers
WHERE country NOT IN ('USA', 'Germany');


-- LIKE -- 
SELECT 
* 
FROM customers
WHERE first_name LIKE 'M%';

SELECT 
*
FROM customers
WHERE first_name like '%n';

SELECT 
*
FROM customers
WHERE first_name LIKE '%r%';

SELECT 
*
FROM customers
WHERE first_name LIKE '__r%';

SELECT 
* 
FROM customers
WHERE score BETWEEN 400 AND 800;

SELECT 
* 
FROM customers
WHERE score >= 400 AND score <= 800;

SELECT 
*
FROM orders 
WHERE order_date BETWEEN '2021-04-01' AND '2021-08-31';

SELECT 
*
FROM orders 
WHERE order_date >= '2021-04-01' AND order_date <= '2021-08-31';


SELECT 
*
FROM customers
WHERE first_name like '%n';

SELECT 
*
FROM customers
WHERE first_name like '_r%';

SELECT 
*
FROM customers
WHERE country NOT IN('USA', 'Germany');

-- Combine everything in one query: customers from Germany or USA, 
-- with a score between 300 and 600, whose first_name doesn’t start with “P”.

SELECT 
*
FROM customers
WHERE country IN ('USA', 'Germany') 
AND score BETWEEN 300 AND 600 
AND first_name NOT LIKE 'P%';


-- Joins-- -- 
SELECT 
*
FROM customers;

SELECT 
*
FROM orders;

SELECT 
*
FROM customers
INNER JOIN orders
ON id = customer_id;

SELECT 
*
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;

SELECT 
*
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id;

-- SELECT 
-- *
-- FROM customers AS c --> This can be done in Postgres, SQL server and orcale
-- FULL JOIN orders AS o 
-- ON c.id = o.customer_id;

-- This is how we do full join in mysql 
SELECT
id,
first_name,
order_id,
sales
FROM customers AS c
LEFT JOIN orders as o 
ON c.id = o.customer_id
UNION
SELECT
	id,
	first_name,
	order_id,
	sales
FROM customers AS c
RIGHT JOIN orders as o 
ON c.id = o.customer_id;


-- Anti joins –- Left join

SELECT 
	id,
	first_name,
	order_id,
    customer_id,
	sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id is null;

SELECT 
	*
FROM orders AS o 
LEFT JOIN customers AS c
ON o.customer_id = c.id
WHERE c.id is null;



-- FULL ANTI JOIN -- 
SELECT
id,
first_name,
order_id,
sales
FROM customers AS c
LEFT JOIN orders as o 
ON c.id = o.customer_id
WHERE o.customer_id is null
UNION
SELECT
	id,
	first_name,
	order_id,
	sales
FROM customers AS c
RIGHT JOIN orders as o 
ON c.id = o.customer_id
WHERE c.id is null;

SELECT 
*
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;


SELECT 
*
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id is not null;












