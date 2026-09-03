# Unit 3 — Filtering Data with WHERE

## Overview

This unit focuses on filtering data in SQL using the `WHERE` clause.  
The queries were performed on the `store` database using the `customers` table from the SQL Course Materials.

## Objectives

- Use the `WHERE` clause to filter records.
- Combine conditions using `AND` and `OR`.
- Filter values within a range using `BETWEEN`.
- Filter against multiple possible values using `IN`.
- Search text patterns using `LIKE`.
- Handle missing values using `IS NULL`.

## Database and Table

**Database:** `store`

**Table:** `customers`

Important columns used:

| Column | Data Type | Description |
|---|---|---|
| `customer_id` | INT | Unique customer ID |
| `first_name` | VARCHAR | Customer's first name |
| `last_name` | VARCHAR | Customer's last name |
| `birth_date` | DATE | Customer's date of birth |
| `phone` | VARCHAR | Customer's phone number |
| `address` | VARCHAR | Customer's address |
| `city` | VARCHAR | Customer's city |
| `state` | CHAR | Customer's state |
| `points` | INT | Customer reward points |

##SQL Files:
 Filtering Data with WHERE.sql

## SQL Concepts Practiced

### 1. WHERE

Filtered customers based on a specific state.

```sql
SELECT *
FROM customers
WHERE state = 'VA';
