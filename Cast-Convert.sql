-- CONVERT

SELECT CreationTime,
CAST(CreationTime AS DATE) as DATE,
CAST(CreationTime AS TIME ) as TIme
FROM Orders;