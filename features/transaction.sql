USE classicmodels;

-- Transaction 1: Insert a new customer and rollback (test case)
START TRANSACTION;
INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, city, country, creditLimit)
VALUES (99999, 'Test Customer Inc.', 'Doe', 'John', '123-456-7890', '123 Test St.', 'Testville', 'USA', 50000.00);

-- Show inserted row
SELECT * FROM customers WHERE customerNumber = 99999;

ROLLBACK;

-- Transaction 2: Insert a new order and its details
START TRANSACTION;
INSERT INTO orders (orderNumber, orderDate, requiredDate, status, customerNumber)
VALUES (11000, '2025-06-15', '2025-06-25', 'In Process', 103);

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (11000, 'S10_1678', 30, 95.70, 1);

-- Show inserted order and its details
SELECT * FROM orders WHERE orderNumber = 11000;
SELECT * FROM orderdetails WHERE orderNumber = 11000;

COMMIT;

-- Transaction 3: Update credit limit of a customer, then rollback
START TRANSACTION;
UPDATE customers
SET creditLimit = creditLimit + 10000
WHERE customerNumber = 112;

-- Show updated customer
SELECT customerNumber, customerName, creditLimit FROM customers WHERE customerNumber = 112;

ROLLBACK;

-- Transaction 4: Delete a payment, rollback if not found
START TRANSACTION;
DELETE FROM payments
WHERE customerNumber = 114 AND checkNumber = 'HQ336336';

-- Show remaining payments for that customer
SELECT * FROM payments WHERE customerNumber = 114;

ROLLBACK;

-- Transaction 5: Update employee job title
START TRANSACTION;
UPDATE employees
SET jobTitle = 'Senior Sales Rep'
WHERE employeeNumber = 1504;

-- Show updated employee
SELECT employeeNumber, firstName, lastName, jobTitle FROM employees WHERE employeeNumber = 1504;

COMMIT;

-- Transaction 6: Add new office and rollback (testing only)
START TRANSACTION;
INSERT INTO offices (officeCode, city, phone, addressLine1, country, postalCode, territory)
VALUES ('9', 'Test City', '+91 1234567890', 'Test Address', 'India', '123456', 'APAC');

-- Show inserted office
SELECT * FROM offices WHERE officeCode = '9';

ROLLBACK;

-- Transaction 7: Update multiple order statuses and commit
START TRANSACTION;
UPDATE orders
SET status = 'Shipped'
WHERE status = 'In Process' AND orderDate < '2025-01-01';

-- Show updated orders
SELECT orderNumber, status FROM orders
WHERE status = 'Shipped' AND orderDate < '2025-01-01';

COMMIT;

-- Transaction 8: Delete a customer and their payments (only if no orders exist)
START TRANSACTION;
DELETE FROM payments WHERE customerNumber = 124;

DELETE FROM customers
WHERE customerNumber = 124
  AND customerNumber NOT IN (SELECT DISTINCT customerNumber FROM orders);

-- Show result of deletion
SELECT * FROM customers WHERE customerNumber = 124;
SELECT * FROM payments WHERE customerNumber = 124;

COMMIT;

