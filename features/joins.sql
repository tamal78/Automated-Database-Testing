USE classicmodels;

-- Query 1: INNER JOIN - List employees and their office city and country
SELECT e.employeeNumber, e.firstName, e.lastName, o.city, o.country
FROM employees e
INNER JOIN offices o ON e.officeCode = o.officeCode;

-- Query 2: LEFT JOIN - List all customers and any orders they may have
SELECT c.customerNumber, c.customerName, o.orderNumber, o.orderDate
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
ORDER BY c.customerNumber;

-- Query 3: RIGHT JOIN - List all orders and any associated customer information
SELECT o.orderNumber, o.orderDate, c.customerName, c.country
FROM orders o
RIGHT JOIN customers c ON o.customerNumber = c.customerNumber
ORDER BY o.orderNumber;

-- Query 4: INNER JOIN with WHERE filter - Employees in USA offices
SELECT e.firstName, e.lastName, o.city, o.country
FROM employees e
INNER JOIN offices o ON e.officeCode = o.officeCode
WHERE o.country = 'USA';

-- Query 5: LEFT JOIN with NULL check - Customers who have never placed an order
SELECT c.customerNumber, c.customerName
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL;

-- Query 6: RIGHT JOIN - Orders not linked to any customer (demonstration case)
SELECT o.orderNumber, o.orderDate, c.customerNumber
FROM orders o
RIGHT JOIN customers c ON o.customerNumber = c.customerNumber
WHERE o.orderNumber IS NULL;

