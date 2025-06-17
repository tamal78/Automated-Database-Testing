USE classicmodels;

-- Query 1: INNER JOIN: List customer names and their order dates
SELECT c.customerName, o.orderDate
FROM customers c
INNER JOIN orders o ON c.customerNumber = o.customerNumber
LIMIT 10;

-- Query 2: LEFT JOIN: List all customers and any payments they have made
SELECT c.customerName, p.paymentDate, p.amount
FROM customers c
LEFT JOIN payments p ON c.customerNumber = p.customerNumber
LIMIT 10;

-- Query 3: RIGHT JOIN: List payments and associated customers (if any)
SELECT p.paymentDate, p.amount, c.customerName
FROM payments p
RIGHT JOIN customers c ON c.customerNumber = p.customerNumber
LIMIT 10;

-- Query 4: FULL OUTER JOIN (simulated using UNION): Combine all customers and payments
SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount
FROM customers c
LEFT JOIN payments p ON c.customerNumber = p.customerNumber
UNION
SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount
FROM customers c
RIGHT JOIN payments p ON c.customerNumber = p.customerNumber
LIMIT 10;

-- Query 5: JOIN with aggregation: Total payments per customer
SELECT c.customerName, SUM(p.amount) AS total_payments
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerName
LIMIT 10;

-- Query 6: SELF JOIN: List employees and their managers
SELECT e1.firstName AS employee, e2.firstName AS manager
FROM employees e1
JOIN employees e2 ON e1.reportsTo = e2.employeeNumber
LIMIT 10;

-- Query 7: JOIN with condition: List customers from USA who have made payments
SELECT c.customerName, p.amount
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
WHERE c.country = 'USA'
LIMIT 10;

-- Query 8: UNION: Combine customer names and employee names into a single list
SELECT customerName AS name, 'Customer' AS type FROM customers
UNION
SELECT CONCAT(firstName, ' ', lastName), 'Employee' FROM employees
LIMIT 10;

-- Query 9: JOIN: List offices and the employees working in each
SELECT o.city AS office_city, e.firstName, e.lastName
FROM offices o
JOIN employees e ON o.officeCode = e.officeCode
LIMIT 10;

