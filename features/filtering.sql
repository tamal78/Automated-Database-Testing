USE classicmodels;

-- Query 1: Filter products with price greater than average using subquery
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice > (SELECT AVG(buyPrice) FROM products)
ORDER BY buyPrice DESC;

-- Query 2: Filter customers by country with LIKE operator
SELECT customerNumber, customerName, country
FROM customers
WHERE country LIKE 'U%'  -- Countries starting with 'U'
ORDER BY country, customerName;

-- Query 3: Filter orders with date range using BETWEEN
SELECT orderNumber, customerNumber, orderDate, status
FROM orders
WHERE orderDate BETWEEN '2003-01-01' AND '2003-03-31'
ORDER BY orderDate;

-- Query 4: Filter employees using multiple conditions with AND/OR
SELECT employeeNumber, firstName, lastName, jobTitle
FROM employees
WHERE (jobTitle = 'Sales Rep' AND officeCode IN ('1', '3'))
   OR (jobTitle = 'VP Sales')
ORDER BY jobTitle, lastName;

-- Query 5: Filter customers with NULL values using IS NULL
SELECT customerNumber, customerName, state
FROM customers
WHERE state IS NULL
ORDER BY customerName;

-- Query 6: Filter top-selling products using LIMIT
SELECT p.productCode, p.productName, 
       SUM(od.quantityOrdered * od.priceEach) AS totalSales
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode
ORDER BY totalSales DESC
LIMIT 10;

-- Query 7: Filter orders with complex conditions using EXISTS
SELECT o.orderNumber, o.orderDate, c.customerName
FROM orders o
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE EXISTS (
    SELECT 1 
    FROM orderdetails od 
    WHERE od.orderNumber = o.orderNumber 
    AND od.priceEach > 100
)
ORDER BY o.orderDate DESC;

-- Query 8: Filter records using CASE expression
SELECT p.productCode, p.productName, p.buyPrice,
       CASE 
           WHEN p.buyPrice < 50 THEN 'Low'
           WHEN p.buyPrice BETWEEN 50 AND 100 THEN 'Medium'
           ELSE 'High'
       END AS priceCategory
FROM products p
WHERE p.quantityInStock > 5000
ORDER BY p.buyPrice;

-- Query 9: Filter groups using HAVING clause
SELECT productLine, COUNT(*) AS productCount, AVG(buyPrice) AS avgPrice
FROM products
GROUP BY productLine
HAVING COUNT(*) > 5 AND AVG(buyPrice) > 50
ORDER BY productCount DESC;

-- Query 10: Filter using set operations with IN
SELECT customerNumber, customerName
FROM customers
WHERE customerNumber IN (
    SELECT DISTINCT customerNumber
    FROM orders
    WHERE YEAR(orderDate) = 2004
)
AND customerNumber NOT IN (
    SELECT DISTINCT customerNumber
    FROM orders
    WHERE YEAR(orderDate) = 2003
)
ORDER BY customerName;
