# Airbnb Database Normalization to 3NF

## Objective
Apply normalization principles to ensure the database is in **Third Normal Form (3NF)**. This document outlines the normalization steps and confirms that the schema is 3NF compliant.

---

## First Normal Form (1NF)
**Rule**: No repeating groups or arrays; atomic values only.

All tables use atomic columns with no repeating groups.

---

## Second Normal Form (2NF)
**Rule**: Must be in 1NF and have no partial dependencies.

All tables have single-column primary keys (UUIDs), so partial dependencies do not apply.

---

## Third Normal Form (3NF)
**Rule**: Must be in 2NF, and all non-key attributes must depend **only** on the primary key (no transitive dependencies).

### Analysis Per Table

### User
- All attributes depend on `user_id`
- 3NF compliant

#### Property
- All attributes depend on `property_id`
- 3NF compliant

#### Booking
- All attributes depend on `booking_id`
- 3NF compliant

#### Payment
- Attributes depend on `payment_id`, even `amount` is acceptable due to potential refunds/partial payments
- 3NF compliant

#### Review
- Attributes depend on `review_id`
- 3NF compliant

#### Message
- Attributes depend on `message_id`
- 3NF compliant

---

## Final Schema

### User

| Column         | Type                     | Constraints                        |
|----------------|--------------------------|------------------------------------|
| user_id        | UUID                     | PK, Indexed                        |
| first_name     | VARCHAR                  | NOT NULL                           |
| last_name      | VARCHAR                  | NOT NULL                           |
| email          | VARCHAR                  | UNIQUE, NOT NULL, Indexed          |
| password_hash  | VARCHAR                  | NOT NULL                           |
| phone_number   | VARCHAR                  | NULL                               |
| role           | ENUM(guest, host, admin) | NOT NULL                           |
| created_at     | TIMESTAMP                | DEFAULT CURRENT_TIMESTAMP          |

---

### Property

| Column         | Type         | Constraints                            |
|----------------|--------------|----------------------------------------|
| property_id    | UUID         | PK, Indexed                            |
| host_id        | UUID         | FK → User(user_id), NOT NULL           |
| name           | VARCHAR      | NOT NULL                               |
| description    | TEXT         | NOT NULL                               |
| location       | VARCHAR      | NOT NULL                               |
| pricepernight  | DECIMAL      | NOT NULL                               |
| created_at     | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP              |
| updated_at     | TIMESTAMP    | ON UPDATE CURRENT_TIMESTAMP            |

---

### Booking

| Column         | Type                              | Constraints                          |
|----------------|-----------------------------------|--------------------------------------|
| booking_id     | UUID                              | PK, Indexed                          |
| property_id    | UUID                              | FK → Property(property_id), NOT NULL |
| user_id        | UUID                              | FK → User(user_id), NOT NULL         |
| start_date     | DATE                              | NOT NULL                             |
| end_date       | DATE                              | NOT NULL                             |
| total_price    | DECIMAL                           | NOT NULL                             |
| status         | ENUM(pending, confirmed, canceled)| NOT NULL                             |
| created_at     | TIMESTAMP                         | DEFAULT CURRENT_TIMESTAMP            |

---

### Payment

| Column         | Type                     | Constraints                           |
|----------------|--------------------------|----------------------------------------|
| payment_id     | UUID                     | PK, Indexed                            |
| booking_id     | UUID                     | FK → Booking(booking_id), NOT NULL     |
| amount         | DECIMAL                  | NOT NULL                               |
| payment_date   | TIMESTAMP                | DEFAULT CURRENT_TIMESTAMP              |
| payment_method | ENUM(credit_card, paypal, stripe) | NOT NULL                       |

---

### Review

| Column         | Type      | Constraints                                      |
|----------------|-----------|--------------------------------------------------|
| review_id      | UUID      | PK, Indexed                                      |
| property_id    | UUID      | FK → Property(property_id), NOT NULL             |
| user_id        | UUID      | FK → User(user_id), NOT NULL                     |
| rating         | INTEGER   | NOT NULL, CHECK (rating BETWEEN 1 AND 5)         |
| comment        | TEXT      | NOT NULL                                         |
| created_at     | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP                        |

---

### Message

| Column         | Type      | Constraints                             |
|----------------|-----------|-----------------------------------------|
| message_id     | UUID      | PK, Indexed                             |
| sender_id      | UUID      | FK → User(user_id), NOT NULL            |
| recipient_id   | UUID      | FK → User(user_id), NOT NULL            |
| message_body   | TEXT      | NOT NULL                                |
| sent_at        | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP               |

---

## Indexing Summary

| Table     | Indexed Fields                         |
|-----------|-----------------------------------------|
| User      | user_id (PK), email                     |
| Property  | property_id (PK), host_id               |
| Booking   | booking_id (PK), property_id, user_id   |
| Payment   | payment_id (PK), booking_id             |
| Review    | review_id (PK), property_id, user_id    |
| Message   | message_id (PK), sender_id, recipient_id|

---
