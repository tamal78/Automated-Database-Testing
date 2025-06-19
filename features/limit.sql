USE classicmodels;

-- Query 1: Get the first 10 customers
SELECT customerNumber, customerName, country
FROM customers
ORDER BY customerNumber
LIMIT 10;

-- Query 2: Get the 5 most recent orders
SELECT orderNumber, orderDate, status
FROM orders
ORDER BY orderDate DESC
LIMIT 5;

-- Query 3: Get the top 3 most expensive products
SELECT productCode, productName, buyPrice
FROM products
ORDER BY buyPrice DESC
LIMIT 3;

-- Query 4: Skip the first 5 rows and get the next 5 (pagination)
SELECT customerNumber, customerName
FROM customers
ORDER BY customerNumber
LIMIT 5 OFFSET 5;

-- Query 5: Page 3 of customers with 10 per page (OFFSET = (page-1)*limit)
SELECT customerNumber, customerName
FROM customers
ORDER BY customerNumber
LIMIT 10 OFFSET 20;

-- Query 6: Use LIMIT with JOIN - get 5 employee-office pairs
SELECT e.employeeNumber, e.firstName, e.lastName, o.city
FROM employees e
JOIN offices o ON e.officeCode = o.officeCode
ORDER BY e.employeeNumber
LIMIT 5;

-- Query 7: LIMIT with WHERE condition - top 3 customers in USA
SELECT customerName, country, creditLimit
FROM customers
WHERE country = 'USA'
ORDER BY creditLimit DESC
LIMIT 3;

-- Query 8: LIMIT 1 - Get the customer with the highest credit limit
SELECT customerNumber, customerName, creditLimit
FROM customers
ORDER BY creditLimit DESC
LIMIT 1;

