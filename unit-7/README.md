# Unit 7 — INSERT, UPDATE & DELETE

## Overview

This unit demonstrates how to modify data in MySQL using `INSERT`, `UPDATE`, and `DELETE`.

**Database:** `store`  
**Table:** `customers`

## Operations Performed

### INSERT
Added a test customer to the `customers` table.

```sql
INSERT INTO customers
    (first_name, last_name, birth_date, phone, address, city, state, points)
VALUES
    ('Test', 'Customer', '2000-01-01', '090-1234-5678',
     '123 Test Street', 'Tokyo', 'TK', 100);

### UPDATE

Updated the test customer's points from `100` to `500`.

```sql
UPDATE customers


### DELETE
```markdown
### DELETE

Deleted the test customer.

```sql
DELETE FROM customers
WHERE customer_id = 11;


### RESTORE
```markdown
### Restore

A backup table was created before the test customer was inserted, so customer 11 was not included in the backup. Therefore, the deleted customer was manually recreated with the original data.
SET points = 500
WHERE customer_id = 11;

## Backup

A temporary backup was created using:

```sql
CREATE TABLE customers_backup AS
SELECT * FROM customers;


### KEY CONCEPTS
```markdown
## Key Concepts

- `INSERT` — Add new records
- `UPDATE` — Modify existing records
- `DELETE` — Remove records
- Backup and data restoration
- Data verification using `SELECT`

## Conclusion

This unit demonstrates the basic SQL operations required to insert, update, delete, and restore data while emphasizing the importance of backups and verification.
