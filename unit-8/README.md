# Unit 8 — String Functions & Data Cleaning

## Objective

The objective of this unit was to practice SQL string functions and basic data-cleaning techniques using the `employees` table from the `sql_hr` database.

The main functions practiced were `TRIM()`, `LOWER()`, `UPPER()`, `CONCAT()`, `SUBSTRING()`, and `REPLACE()`. A duplicate check was also performed, followed by the creation of a cleaned employee table.

## Employee Data

The existing employee data was first displayed to understand the information stored in the table.

```sql
USE sql_hr;

SELECT *
FROM employees;

## TRIM

The TRIM() function was used to remove unnecessary spaces from employee first and last names.
USE sql_hr;

SELECT
    employee_id,
    first_name,
    TRIM(first_name) AS cleaned_first_name,
    last_name,
    TRIM(last_name) AS cleaned_last_name
FROM employees;

##LOWER and UPPER

The LOWER() and UPPER() functions were used to standardize text formatting.
USE sql_hr;

SELECT
    employee_id,
    first_name,
    LOWER(first_name) AS lowercase_name,
    UPPER(last_name) AS uppercase_name
FROM employees;

##CONCAT

The CONCAT() function was used to combine the employee's first name and last name into a single full-name field.
USE sql_hr;

SELECT
    employee_id,
    first_name,
    last_name,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

##SUBSTRING

The SUBSTRING() function was used to extract the first three characters from each employee's first name.
USE sql_hr;

SELECT
    employee_id,
    first_name,
    SUBSTRING(first_name, 1, 3) AS first_3_characters
FROM employees;

##REPLACE

The REPLACE() function was used to demonstrate how specific characters can be replaced within a text value.
USE sql_hr;

SELECT
    employee_id,
    first_name,
    REPLACE(first_name, 'a', '@') AS replaced_name
FROM employees;

##Duplicate Check

A duplicate check was performed to identify first-name and last-name combinations that appeared more than once.
USE sql_hr;

SELECT
    first_name,
    last_name,
    COUNT(*) AS duplicate_count
FROM employees
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

##Create Cleaned Employee Table

A new employees_cleaned table was created using multiple string functions to standardize the employee data.
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

##Verify Cleaned Data

The final cleaned table was displayed to verify the results.
SELECT *
FROM employees_cleaned;

##Summary

This unit demonstrated how SQL string functions can be used for data cleaning and text manipulation.

Function	Purpose
TRIM()	Removes unnecessary spaces
LOWER()	Converts text to lowercase
UPPER()	Converts text to uppercase
CONCAT()	Combines multiple text values
SUBSTRING()	Extracts part of a string
REPLACE()	Replaces specific characters or text

A duplicate check was also performed, and a separate employees_cleaned table was created to store the cleaned and standardized employee information.
