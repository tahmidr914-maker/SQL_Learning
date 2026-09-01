# Unit 1 — Student Management Database

## Overview

This unit introduces the fundamentals of SQL database creation and data management using MySQL.

In this unit, I created a simple **Student Management Database** containing a `students` table with student information and populated it with 20 fictional student records.

## Learning Objectives

- Create a database using SQL
- Select and use a specific database
- Create a table with appropriate data types
- Define a primary key
- Use `AUTO_INCREMENT`
- Insert multiple records into a table
- Retrieve and verify stored data
- Count records using SQL queries

## Database

**Database Name:** `student_management`
## Links
student_management.sql

## Table Structure

### `students`

| Column | Data Type | Description |
|---|---|---|
| `student_id` | INT | Unique ID for each student |
| `name` | VARCHAR(100) | Student's name |
| `age` | INT | Student's age |
| `major` | VARCHAR(100) | Student's field of study |
| `email` | VARCHAR(100) | Student's email address |

The `student_id` column is the **Primary Key** and uses `AUTO_INCREMENT` to automatically generate unique student IDs.

## SQL Operations

The following SQL operations were performed in this unit:

### 1. Create Database

```sql
CREATE DATABASE student_management;
