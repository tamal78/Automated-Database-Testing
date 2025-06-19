USE classicmodels;

-- Query 1: Products priced between 50 and 100
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice BETWEEN 50 AND 100;

-- Query 2: Customers with credit limits between 40,000 and 80,000
SELECT customerNumber, customerName, creditLimit
FROM customers
WHERE creditLimit BETWEEN 40000 AND 80000;

-- Query 3: Orders placed between 2003-01-01 and 2003-12-31
SELECT orderNumber, orderDate, status
FROM orders
WHERE orderDate BETWEEN '2003-01-01' AND '2003-12-31';

-- Query 4: Payments made between 1000 and 5000
SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount BETWEEN 1000 AND 5000;

-- Query 5: Customers whose names fall alphabetically between 'A' and 'G'
SELECT customerNumber, customerName
FROM customers
WHERE customerName BETWEEN 'A' AND 'G';

-- Query 6: Employees hired between two given employeeNumbers
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE employeeNumber BETWEEN 1002 AND 1050;

-- Query 7: Products NOT priced between 25 and 75
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice NOT BETWEEN 25 AND 75;

-- Query 8: Orders required between two given dates but not yet shipped
SELECT orderNumber, requiredDate, shippedDate
FROM orders
WHERE requiredDate BETWEEN '2004-01-01' AND '2004-12-31'
  AND shippedDate IS NULL;

