# Airbnb Database Schema

This repository contains the SQL schema for the Airbnb-style application database. The schema is designed following database normalization principles up to the **Third Normal Form (3NF)**.

## Directory

**`database-script-0x01/`**
- `schema.sql` – Contains the SQL statements to create all necessary tables, constraints, and indexes.
- `README.md` – Provides an overview and documentation of the database schema.

## Database Overview
The database consists of the following main entities:

1. **User** – Stores guest, host, and admin account details.
2. **Property** – Information about listed properties.
3. **Booking** – Records of guest bookings.
4. **Payment** – Tracks payment details per booking.
5. **Review** – Allows users to leave ratings and comments.
6. **Message** – Facilitates user-to-user communication.

## Features
- UUIDs as primary keys for global uniqueness
- Proper use of `FOREIGN KEY` constraints
- Enum constraints for fields like role, status, and payment method
- Check constraint to ensure rating is between 1 and 5
- Indexes on frequently queried columns for performance optimization

## Indexing Summary

| Table     | Indexed Columns                         |
|-----------|------------------------------------------|
| User      | `email`                                  |
| Property  | `host_id`                                |
| Booking   | `property_id`, `user_id`                 |
| Payment   | `booking_id`                             |
| Review    | `property_id`, `user_id`                 |
| Message   | `sender_id`, `recipient_id`              |

---


