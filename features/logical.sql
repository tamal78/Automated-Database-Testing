USE classicmodels;

-- Query 1: Customers from USA AND with credit limit over 50,000
SELECT customerNumber, customerName, country, creditLimit
FROM customers
WHERE country = 'USA' AND creditLimit > 50000;

-- Query 2: Customers from USA OR Canada
SELECT customerNumber, customerName, country
FROM customers
WHERE country = 'USA' OR country = 'Canada';

-- Query 3: Customers NOT from the USA
SELECT customerNumber, customerName, country
FROM customers
WHERE NOT country = 'USA';

-- Query 4: Orders with status 'Shipped' AND required date before 2005-01-01
SELECT orderNumber, orderDate, requiredDate, status
FROM orders
WHERE status = 'Shipped' AND requiredDate < '2005-01-01';

-- Query 5: Products priced between 50 and 100 OR with quantityInStock > 500
SELECT productCode, productName, buyPrice, quantityInStock
FROM products
WHERE (buyPrice BETWEEN 50 AND 100) OR quantityInStock > 500;

-- Query 6: Employees in office 1 OR 4 AND with job title 'Sales Rep'
SELECT employeeNumber, firstName, lastName, officeCode, jobTitle
FROM employees
WHERE (officeCode = '1' OR officeCode = '4') AND jobTitle = 'Sales Rep';

-- Query 7: Customers from Germany, France, or Italy AND with credit limit < 50000
SELECT customerName, country, creditLimit
FROM customers
WHERE country IN ('Germany', 'France', 'Italy') AND creditLimit < 50000;

-- Query 8: Orders that are either 'Cancelled' or required before 2003 AND status is not 'Shipped'
SELECT orderNumber, orderDate, requiredDate, status
FROM orders
WHERE (status = 'Cancelled' OR requiredDate < '2003-01-01')
  AND status != 'Shipped';

