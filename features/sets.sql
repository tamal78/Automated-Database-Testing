USE classicmodels;

-- Query 1: UNION - List unique city names from customers and offices
SELECT city FROM customers
UNION
SELECT city FROM offices;

-- Query 2: UNION ALL - List all city names (including duplicates) from customers and offices
SELECT city FROM customers
UNION ALL
SELECT city FROM offices;

-- Query 3: UNION - Combine contact names from customers and employee names (as a single column)
SELECT contactFirstName AS name FROM customers
UNION
SELECT firstName FROM employees;

-- Query 4: UNION ALL - Same as above but with duplicates preserved
SELECT contactFirstName AS name FROM customers
UNION ALL
SELECT firstName FROM employees;

-- Query 5: Simulate INTERSECT using INNER JOIN - Names common to customers and employees
SELECT DISTINCT c.contactFirstName AS name
FROM customers c
INNER JOIN employees e ON c.contactFirstName = e.firstName;

-- Query 6: Simulate EXCEPT using LEFT JOIN - Customer first names that are not employee first names
SELECT DISTINCT c.contactFirstName AS name
FROM customers c
LEFT JOIN employees e ON c.contactFirstName = e.firstName
WHERE e.firstName IS NULL;

-- Query 7: UNION with ORDER BY (must be applied to full result, not individual SELECTs)
(
  SELECT contactFirstName AS name FROM customers
  UNION
  SELECT firstName FROM employees
)
ORDER BY name ASC;

