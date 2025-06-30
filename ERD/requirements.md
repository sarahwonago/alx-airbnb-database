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

