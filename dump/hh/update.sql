USE classicmodels;

-- Query 1: Update product prices by increasing the buyPrice by 5% for all products in the 'Classic Cars' product line
UPDATE products
SET buyPrice = buyPrice * 1.05, MSRP = MSRP * 1.05
WHERE productLine = 'Classic Cars';

-- Verify Query 1
SELECT productCode, productName, buyPrice, MSRP 
FROM products 
WHERE productLine = 'Classic Cars';

-- Query 2: Update employee job titles and office locations for employees who currently work as 'Sales Rep'
UPDATE employees
SET jobTitle = 'Senior Sales Representative', officeCode = '1'
WHERE jobTitle = 'Sales Rep' AND officeCode = '2';

-- Verify Query 2
SELECT employeeNumber, firstName, lastName, jobTitle, officeCode 
FROM employees 
WHERE jobTitle = 'Senior Sales Representative' AND officeCode = '1';

-- Query 3: Update customer credit limits by increasing them by 10% for customers with credit limits greater than 100000
UPDATE customers
SET creditLimit = creditLimit * 1.10
WHERE creditLimit > 100000;

-- Verify Query 3
SELECT customerNumber, customerName, creditLimit 
FROM customers 
WHERE creditLimit > 110000;

-- Query 4: Update order status to 'Shipped' and set shipped date for pending orders that are past their required date
UPDATE orders
SET status = 'Shipped', shippedDate = CURDATE()
WHERE status = 'In Process' AND requiredDate < CURDATE();

-- Verify Query 4
SELECT orderNumber, status, requiredDate, shippedDate 
FROM orders 
WHERE status = 'Shipped' AND shippedDate = CURDATE();

-- Query 5: Update product descriptions to include a promotional message for products with low inventory
UPDATE products
SET productDescription = CONCAT(productDescription, ' - Limited stock available, order soon!')
WHERE quantityInStock < 20;

-- Verify Query 5
SELECT productCode, quantityInStock, productDescription 
FROM products 
WHERE quantityInStock < 20;

-- Query 6: Update office details for a specific location
UPDATE offices
SET phone = '+1 650 219 4782', addressLine1 = '100 Market Street', addressLine2 = 'Suite 300'
WHERE officeCode = '1';

-- Verify Query 6
SELECT officeCode, city, phone, addressLine1, addressLine2 
FROM offices 
WHERE officeCode = '1';

-- Query 7: Update order details by applying a discount to specific products
UPDATE orderdetails
SET priceEach = priceEach * 0.9
WHERE productCode IN (
    SELECT productCode 
    FROM products 
    WHERE productLine = 'Vintage Cars' AND quantityInStock > 50
);

-- Verify Query 7
SELECT od.orderNumber, od.productCode, od.priceEach 
FROM orderdetails od
JOIN products p ON od.productCode = p.productCode
WHERE p.productLine = 'Vintage Cars' AND p.quantityInStock > 50;

-- Query 8: Update customer contact information for customers with specific sales representatives
UPDATE customers
SET contactFirstName = 'Updated', contactLastName = 'Contact', phone = '+1 408 555 1234'
WHERE salesRepEmployeeNumber IN (
    SELECT employeeNumber 
    FROM employees 
    WHERE officeCode = '4'
);

-- Verify Query 8
SELECT customerNumber, contactFirstName, contactLastName, phone 
FROM customers 
WHERE phone = '+1 408 555 1234';

