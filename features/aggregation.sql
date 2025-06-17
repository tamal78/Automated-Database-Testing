USE classicmodels;

-- Query 1: Total number of customers per country
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country
ORDER BY total_customers DESC;

-- Query 2: Average payment amount by each customer
SELECT customerNumber, AVG(amount) AS avg_payment
FROM payments
GROUP BY customerNumber
ORDER BY avg_payment DESC;

-- Query 3: Total sales (amount) per employee (sales rep)
SELECT e.employeeNumber, e.firstName, e.lastName, SUM(p.amount) AS total_sales
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY e.employeeNumber, e.firstName, e.lastName
ORDER BY total_sales DESC;

-- Query 4: Number of products in each product line
SELECT productLine, COUNT(*) AS total_products
FROM products
GROUP BY productLine
ORDER BY total_products DESC;

-- Query 5: Monthly sales (total amount) for the year 2004
SELECT MONTH(paymentDate) AS month, SUM(amount) AS total_monthly_sales
FROM payments
WHERE YEAR(paymentDate) = 2004
GROUP BY MONTH(paymentDate)
ORDER BY month;
