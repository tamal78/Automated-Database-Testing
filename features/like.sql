USE classicmodels;

-- Query 1: Customers whose names start with 'A'
SELECT customerNumber, customerName
FROM customers
WHERE customerName LIKE 'A%';

-- Query 2: Customers whose names end with 'Inc.'
SELECT customerNumber, customerName
FROM customers
WHERE customerName LIKE '%Inc.';

-- Query 3: Customers whose names contain 'Corp'
SELECT customerNumber, customerName
FROM customers
WHERE customerName LIKE '%Corp%';

-- Query 4: Customers whose contact first name starts with 'Mi'
SELECT customerName, contactFirstName
FROM customers
WHERE contactFirstName LIKE 'Mi%';

-- Query 5: Products that start with 'S10'
SELECT productCode, productName
FROM products
WHERE productCode LIKE 'S10%';

-- Query 6: Employees whose last names contain 'son'
SELECT employeeNumber, firstName, lastName
FROM employees
WHERE lastName LIKE '%son%';

-- Query 7: Products with names containing a space followed by a capital letter
SELECT productCode, productName
FROM products
WHERE productName LIKE '% %A%' OR productName LIKE '% %B%' OR productName LIKE '% %C%';

-- Query 8: Customers whose name is exactly 6 characters long
SELECT customerName
FROM customers
WHERE customerName LIKE '______';  -- six underscores for six characters

-- Query 9: Customers whose names do not contain 'Tech'
SELECT customerNumber, customerName
FROM customers
WHERE customerName NOT LIKE '%Tech%';

-- Query 10: Case-insensitive match (LIKE is case-insensitive in MySQL by default)
SELECT customerNumber, customerName
FROM customers
WHERE customerName LIKE 'classic%';

