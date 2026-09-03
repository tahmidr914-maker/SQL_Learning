USE store;

-- Query 1: Filter customers by state
SELECT *
FROM customers
WHERE state = 'VA';

-- Query 2: Filter using AND
SELECT *
FROM customers
WHERE state = 'VA'
  AND points > 1000;

-- Query 3: Filter using OR
SELECT *
FROM customers
WHERE state = 'VA'
   OR state = 'CA';
   
   -- Query 4: Filter customers by points range
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;
   
   -- Query 5: Filter customers from selected states
SELECT *
FROM customers
WHERE state IN ('VA', 'CA', 'FL');

-- Query 6: Find customers whose last name starts with 'B'
SELECT *
FROM customers
WHERE last_name LIKE 'B%';

-- Query 7: Find customers without a phone number
SELECT *
FROM customers
WHERE phone IS NULL;
