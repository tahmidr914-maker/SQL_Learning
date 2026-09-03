# Unit 6 – SQL JOINs

## Overview

This unit focuses on using SQL JOINs to combine data from multiple tables in the `store` database.

The exercises demonstrate how different JOIN types work and how related tables can be connected using matching keys.

## JOINs Covered

### 1. INNER JOIN

The INNER JOIN returns records where matching values exist in both tables.

In this exercise, the `customers` and `orders` tables are joined using `customer_id`.

### 2. LEFT JOIN

The LEFT JOIN returns all records from the left table and matching records from the right table.

Customers without orders are also included, with `NULL` values for the order information.

### 3. RIGHT JOIN

The RIGHT JOIN returns all records from the right table and matching records from the left table.

In this exercise, all orders are retained while matching customer information is displayed when available.

### 4. SELF JOIN

A SELF JOIN joins a table to itself.

The `orders` table is joined to itself using `customer_id` to identify different orders belonging to the same customer.

### 5. Multi-Table JOIN

The multi-table JOIN combines information from:

- `customers`
- `orders`
- `order_items`
- `products`

These tables are connected through their related primary and foreign keys to produce a detailed view of customers, orders, products, quantities, and prices.

## SQL Files:
JOINS.sql

## Database

The exercises use the `store` database.

```sql
USE store;

