USE classicmodels;

-- Query 1: COUNT - Total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- Query 2: COUNT with condition - Number of orders with status 'Shipped'
SELECT COUNT(*) AS shipped_orders FROM orders WHERE status = 'Shipped';

-- Query 3: SUM - Total amount paid by a specific customer
SELECT SUM(amount) AS total_paid
FROM payments
WHERE customerNumber = 103;

-- Query 4: AVG - Average credit limit of all customers
SELECT AVG(creditLimit) AS average_credit_limit FROM customers;

-- Query 5: MIN - Minimum product price in the catalog
SELECT MIN(buyPrice) AS lowest_price FROM products;

-- Query 6: MAX - Maximum payment ever received
SELECT MAX(amount) AS highest_payment FROM payments;

-- Query 7: COUNT + GROUP BY - Number of customers in each country
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC;

-- Query 8: SUM + GROUP BY - Total order amount per order (calculated from orderdetails)
SELECT orderNumber, SUM(quantityOrdered * priceEach) AS total_order_amount
FROM orderdetails
GROUP BY orderNumber
ORDER BY total_order_amount DESC;

-- Query 9: AVG + GROUP BY - Average payment amount per customer
SELECT customerNumber, AVG(amount) AS average_payment
FROM payments
GROUP BY customerNumber
ORDER BY average_payment DESC;

-- Query 10: MIN/MAX + GROUP BY - Earliest and latest order dates per customer
SELECT customerNumber,
       MIN(orderDate) AS first_order,
       MAX(orderDate) AS last_order
FROM orders
GROUP BY customerNumber;

