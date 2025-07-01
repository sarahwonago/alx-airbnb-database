-- DROP original Booking table (for setup/demo purposes only)
DROP TABLE IF EXISTS Booking CASCADE;

-- Create the parent partitioned Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Create child partitions by month (Q1 of 2025)
CREATE TABLE Booking_2025_01 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE TABLE Booking_2025_02 PARTITION OF Booking
    FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

CREATE TABLE Booking_2025_03 PARTITION OF Booking
    FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');

-- Optional: Add indexes to child partitions if needed
CREATE INDEX idx_booking_2025_02_user_id ON Booking_2025_02(user_id);
CREATE INDEX idx_booking_2025_02_property_id ON Booking_2025_02(property_id);

-- Test partitioned query performance
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2025-02-01' AND '2025-02-28';

