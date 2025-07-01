# Airbnb Database – Query Optimization Report

## Objective
Refactor a complex query that joins multiple tables to improve query performance using `EXPLAIN ANALYZE` and indexing.

---

## Initial Query
Joins `Booking`, `User`, `Property`, and `Payment` to fetch complete booking details.

```sql
SELECT ...
FROM Booking b
JOIN User u ON ...
JOIN Property p ON ...
LEFT JOIN Payment pay ON ...

