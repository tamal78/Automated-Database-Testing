USE classicmodels;

-- Query 1: Insert a new customer (single-row insert)
INSERT INTO customers (
    customerNumber, customerName, contactLastName, contactFirstName, phone,
    addressLine1, city, country, creditLimit
)
VALUES (
    99991, 'NeoTech Ltd.', 'Anderson', 'Thomas', '123-555-0199',
    '77 Trinity Ave', 'Zion', 'USA', 25000.00
);

SELECT * FROM customers WHERE customerNumber = 99991;

-- Query 2: Insert multiple customers at once
INSERT INTO customers (
    customerNumber, customerName, contactLastName, contactFirstName, phone,
    addressLine1, city, country, creditLimit
)
VALUES 
(99992, 'Matrix Corp.', 'Smith', 'Agent', '321-555-0101', '1 Loop Rd', 'MegaCity', 'USA', 40000.00),
(99993, 'Sentinel Systems', 'Sentinel', 'Unit01', '456-555-0112', 'Deep Sea Base', 'Abyss', 'Unknown', 50000.00);

SELECT * FROM customers WHERE customerNumber IN (99992, 99993);

-- Query 3: Insert into payments with only required columns
INSERT INTO payments (
    customerNumber, checkNumber, paymentDate, amount
)
VALUES (
    103, 'CHK999991', '2025-06-15', 1500.00
);

SELECT * FROM payments WHERE checkNumber = 'CHK999991';

-- Query 4: Insert a product using all columns
INSERT INTO products (
    productCode, productName, productLine, productScale, productVendor,
    productDescription, quantityInStock, buyPrice, MSRP
)
VALUES (
    'NEO_001', 'Neo Gadget', 'Classic Cars', '1:10', 'NeoVendor Inc.',
    'A futuristic gadget from the Matrix.', 100, 199.99, 299.99
);

SELECT * FROM products WHERE productCode = 'NEO_001';

-- Query 5: Insert using default values (if table allows DEFAULTs)
INSERT INTO offices (
    officeCode, city, phone, addressLine1, country, postalCode, territory
)
VALUES (
    '99', 'Nowhere', '999-999-9999', 'Null Street', 'NowhereLand', '000000', 'ZZ'
);

SELECT * FROM offices WHERE officeCode = '99';

-- Query 6: Insert employee with foreign key reference to an office
INSERT INTO employees (
    employeeNumber, lastName, firstName, extension, email, officeCode, jobTitle
)
VALUES (
    1999, 'Reeves', 'Keanu', 'x9999', 'keanu.reeves@classicmodels.com', '1', 'The One'
);

SELECT * FROM employees WHERE employeeNumber = 1999;

-- Query 7: Insert an order and matching order detail
INSERT INTO orders (
    orderNumber, orderDate, requiredDate, status, customerNumber
)
VALUES (
    99991, '2025-06-15', '2025-06-25', 'In Process', 103
);

INSERT INTO orderdetails (
    orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber
)
VALUES (
    99991, 'S10_1678', 20, 100.00, 1
);

SELECT * FROM orders WHERE orderNumber = 99991;
SELECT * FROM orderdetails WHERE orderNumber = 99991;

