-- Unit 2: SELECT Statements & Basic Queries
-- Database: store
-- Dataset: customers

USE store;

-- 1. Select all columns
SELECT *
FROM customers;

-- 2. Select specific columns
SELECT first_name, last_name, city
FROM customers;

-- 3. Use DISTINCT
SELECT DISTINCT state
FROM customers;

-- 4. Use LIMIT
SELECT *
FROM customers
LIMIT 5;

-- 5. Sort results using ORDER BY
SELECT *
FROM customers
ORDER BY points DESC;