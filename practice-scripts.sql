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














