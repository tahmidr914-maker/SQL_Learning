# Unit 2: SELECT Statements & Basic Queries

## Overview

This unit focuses on using SQL `SELECT` statements to retrieve and organize data from a customer dataset.

The queries were performed using the `store` database and its `customers` table.

## Objectives

- Retrieve all columns from a table
- Retrieve specific columns
- Remove duplicate results using `DISTINCT`
- Limit the number of returned rows using `LIMIT`
- Sort query results using `ORDER BY`

## Database

**Database:** `store`

**Table:** `customers`

The `customers` table contains information such as:

- Customer ID
- First name
- Last name
- Birth date
- Phone
- Address
- City
- State
- Points

## SQL Queries Practiced

### 1. Select All Columns

```sql
SELECT *
FROM customers;

## SQL Files:
SELECT Statements & Basic Queries.sql
