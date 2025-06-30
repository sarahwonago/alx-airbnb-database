## 🛠️ Project Overview

This is the database design for our Airbnb-style project.

## 📊 Database Schema

The database schema is visualized using [dbdiagram.io](https://dbdiagram.io/).

👉 [Click here to view the ER Diagram](https://dbdiagram.io/d/AirbnbDBSchema-68628306f413ba3508878480)

It includes Users, Properties, Bookings, Payments, Reviews, and Messages.



## Relationship
[User]
 - user_id (PK)
 - email (UNIQUE)
 - ...
    |
    |<---(host_id)
    |
[Property]----<--(property_id)----[Booking]----(booking_id)---> [Payment]
    |                                 |
    |<-------------------------------/
    |
    |<----(property_id)----[Review]

[User]----(user_id)---->[Booking]
[User]----(user_id)---->[Review]
[User]----(sender_id)-->[Message]<--(recipient_id)----[User]

