USE store;

-- Create a backup before making changes
CREATE TABLE customers_backup AS
SELECT * FROM customers;


-- 1. INSERT: Add a new customer
INSERT INTO customers
    (first_name, last_name, birth_date, phone, address, city, state, points)
VALUES
    ('Test', 'Customer', '2000-01-01', '090-1234-5678',
     '123 Test Street', 'Tokyo', 'TK', 100);


-- Verify INSERT
SELECT *
FROM customers
WHERE customer_id = 11;


-- 2. UPDATE: Change the customer's points
UPDATE customers
SET points = 500
WHERE customer_id = 11;


-- Verify UPDATE
SELECT *
FROM customers
WHERE customer_id = 11;


-- 3. DELETE: Delete the test customer
DELETE FROM customers
WHERE customer_id = 11;


-- Verify DELETE
SELECT *
FROM customers
WHERE customer_id = 11;


-- 4. RESTORE: Restore the test customer
INSERT INTO customers
    (customer_id, first_name, last_name, birth_date, phone,
     address, city, state, points)
VALUES
    (11, 'Test', 'Customer', '2000-01-01', '090-1234-5678',
     '123 Test Street', 'Tokyo', 'TK', 100);


-- Verify restored customer
SELECT *
FROM customers
WHERE customer_id = 11;


-- Final verification
SELECT COUNT(*) AS customer_count
FROM customers;


-- Remove the temporary backup table
DROP TABLE customers_backup;