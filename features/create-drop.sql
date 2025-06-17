USE classicmodels;

-- Query 1: Create a new database named testdb
CREATE DATABASE testdb;

-- Query 2: Create a new table named temp_customers in classicmodels
CREATE TABLE temp_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    credit_limit DECIMAL(10,2)
);

-- Query 3: Create an index on the city column of temp_customers
CREATE INDEX idx_city ON temp_customers(city);

-- Query 4: Create a view that lists high credit customers from temp_customers
CREATE VIEW high_credit_customers AS
SELECT customer_id, customer_name, credit_limit
FROM temp_customers
WHERE credit_limit > 10000;

-- Query 5: Drop the view high_credit_customers
DROP VIEW IF EXISTS high_credit_customers;

-- Query 6: Drop the index idx_city
DROP INDEX idx_city ON temp_customers;

-- Query 7: Drop the table temp_customers
DROP TABLE IF EXISTS temp_customers;

-- Query 8: Drop the database testdb
DROP DATABASE IF EXISTS testdb;

