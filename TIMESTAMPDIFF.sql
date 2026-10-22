-- Date ADD And Subtract 
-- add or subtract from date (months, day, year)

SELECT 
	CreationTime,
    DATE_ADD(CreationTime, INTERVAL 3 YEAR) AS three_years_later,
    DATE_ADD(CreationTime, INTERVAL 20 DAY) AS twenty_days_later,
    DATE_ADD(CreationTime, INTERVAL 3 MONTH) AS three_months_later,
    DATE_SUB(CreationTime, INTERVAL 3 YEAR) AS three_years_before,
    DATE_SUB(CreationTime, INTERVAL 20 DAY) AS three_days_before,
    DATE_SUB(CreationTime, INTERVAL 3 MONTH) AS three_months_before
FROM Orders;



-- DATEDIFF()
SELECT 
	TIMESTAMPDIFF(YEAR, BirthDate, NOW())
FROM EMPLOYEES;








