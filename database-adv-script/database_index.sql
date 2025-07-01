-- Indexes for the User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Indexes for the Property table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Indexes for the Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);

-- Index for ordering reviews by property and creation date
CREATE INDEX idx_review_property_created_at ON Review(property_id, created_at);

-- Index for optimizing JOINs and filters in messages
CREATE INDEX idx_message_sender ON Message(sender_id);
CREATE INDEX idx_message_recipient ON Message(recipient_id);
