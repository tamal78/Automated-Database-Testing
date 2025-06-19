USE classicmodels;

-- Query 1: List customers sorted by name (ascending)
SELECT customerNumber, customerName, country
FROM customers
ORDER BY customerName ASC;

-- Query 2: List customers sorted by country in descending order
SELECT customerNumber, customerName, country
FROM customers
ORDER BY country DESC;

-- Query 3: List products sorted by buyPrice from high to low
SELECT productCode, productName, buyPrice
FROM products
ORDER BY buyPrice DESC;

-- Query 4: Orders sorted by status (alphabetically), then by orderDate (oldest to newest)
SELECT orderNumber, status, orderDate
FROM orders
ORDER BY status ASC, orderDate ASC;

-- Query 5: Payments sorted by customer number and then by amount (largest first)
SELECT customerNumber, checkNumber, amount
FROM payments
ORDER BY customerNumber ASC, amount DESC;

-- Query 6: Sort employees by job title, then by last name
SELECT employeeNumber, lastName, firstName, jobTitle
FROM employees
ORDER BY jobTitle ASC, lastName ASC;

-- Query 7: Sort products by markup (MSRP - buyPrice), descending
SELECT productCode, productName, MSRP, buyPrice,
       (MSRP - buyPrice) AS markup
FROM products
ORDER BY markup DESC;

-- Query 8: Top 5 most expensive products (ORDER BY with LIMIT)
SELECT productCode, productName, buyPrice
FROM products
ORDER BY buyPrice DESC
LIMIT 5;

-- Query 9: Customers sorted by length of their name
SELECT customerNumber, customerName
FROM customers
ORDER BY LENGTH(customerName) DESC;

-- Query 10: Sort by an alias (computed column)
SELECT orderNumber,
       SUM(quantityOrdered * priceEach) AS totalOrderValue
FROM orderdetails
GROUP BY orderNumber
ORDER BY totalOrderValue DESC;

