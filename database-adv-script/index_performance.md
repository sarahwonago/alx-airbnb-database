# Airbnb Database – Index Performance Report

## Objective
Evaluate the impact of indexing on query performance in the Airbnb Clone database schema.

---

## Indexed Columns

| Table     | Column(s)                     | Reason for Indexing                      |
|-----------|-------------------------------|-------------------------------------------|
| `User`    | `email`, `role`               | Used in login queries and filters         |
| `Property`| `location`, `host_id`         | Used in search and JOINs                  |
| `Booking` | `user_id`, `property_id`, `status`, `start_date`, `end_date` | Used in JOINs and filtering bookings |
| `Review`  | `property_id`, `created_at`   | Used in property reviews display          |
| `Message` | `sender_id`, `recipient_id`   | Used in inbox and outbox message fetch    |

---

## Performance Comparison

### Query Before Indexing:
```sql
SELECT * FROM Booking WHERE user_id = 'uuid-123' AND status = 'confirmed';
```
#### Result

### Query After Indexing
```
EXPLAIN SELECT * FROM Booking WHERE user_id = 'uuid-123' AND status = 'confirmed';
```
#### Result
