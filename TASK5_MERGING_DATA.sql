SELECT * FROM customers;
SELECT * FROM OrderTable;



-- INNER JOIN
SELECT
    c.CustomerID,
    c.FirstName,
    o.OrderID,
    o.sales
FROM customers AS c
INNER JOIN OrderTable AS o
ON c.CustomerID = o.CustomerID;

-- LEFT JOIN
SELECT
    c.CustomerID,
    c.FirstName,
    o.OrderID,
    o.sales
FROM customers AS c
LEFT JOIN OrderTable AS o
ON c.CustomerID = o.CustomerID;

-- RIGHT JOIN
SELECT
    c.CustomerID,
    c.FirstName,
    o.OrderID,
	o.CustomerID,
    o.sales
FROM customers AS c
RIGHT JOIN OrderTable AS o
ON c.CustomerID = o.CustomerID;

-- FULL JOIN
SELECT
    c.CustomerID,
    c.FirstName,
    o.OrderID,
	o.CustomerID,
    o.sales
FROM customers AS c
FULL JOIN OrderTable AS o
ON c.CustomerID = o.CustomerID;

