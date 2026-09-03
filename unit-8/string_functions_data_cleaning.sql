USE sql_hr;

SELECT *
FROM employees;

USE sql_hr;

SELECT
    employee_id,
    first_name,
    TRIM(first_name) AS cleaned_first_name,
    last_name,
    TRIM(last_name) AS cleaned_last_name
FROM employees;

USE sql_hr;

SELECT
    employee_id,
    first_name,
    LOWER(first_name) AS lowercase_name,
    UPPER(last_name) AS uppercase_name
FROM employees;

USE sql_hr;

SELECT
    employee_id,
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

USE sql_hr;

SELECT
    employee_id,
    first_name,
    SUBSTRING(first_name, 1, 3) AS first_3_characters
FROM employees;

USE sql_hr;

SELECT
    employee_id,
    first_name,
    REPLACE(first_name, 'a', '@') AS replaced_name
FROM employees;

USE sql_hr;

SELECT
    first_name,
    last_name,
    COUNT(*) AS duplicate_count
FROM employees
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

USE sql_hr;

DROP TABLE IF EXISTS employees_cleaned;

CREATE TABLE employees_cleaned AS
SELECT
    employee_id,
    LOWER(TRIM(first_name)) AS first_name_cleaned,
    UPPER(TRIM(last_name)) AS last_name_cleaned,
    REPLACE(TRIM(job_title), '  ', ' ') AS job_title_cleaned,
    salary,
    reports_to,
    office_id,
    CONCAT(
        LOWER(TRIM(first_name)),
        ' ',
        UPPER(TRIM(last_name))
    ) AS full_name,
    SUBSTRING(LOWER(TRIM(first_name)), 1, 3) AS name_code
FROM employees;
SELECT *
FROM employees_cleaned;