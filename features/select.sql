USE classicmodels;

-- Query 1: Select all columns from the employees table
SELECT * FROM employees;

-- Query 2: Select all products with price greater than 100, ordered by price descending
SELECT * FROM products
WHERE buyPrice > 100
ORDER BY buyPrice DESC;

-- Query 3: Select the first 10 customers (TOP equivalent using LIMIT)
SELECT * FROM customers
ORDER BY customerNumber
LIMIT 10;

-- Query 4: Select distinct cities from which customers are located
SELECT DISTINCT city FROM customers;

-- Query 5: Select all orders placed in 2005 and create a temporary table (SELECT INTO equivalent)
CREATE TEMPORARY TABLE orders_2005
SELECT * FROM orders
WHERE YEAR(orderDate) = 2005;

-- Query 6: Select customer names and rename the column using alias
SELECT customerName AS name FROM customers;
