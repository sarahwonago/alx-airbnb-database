
-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('11111111-1111-1111-1111-111111111111', 'Grace', 'Mwangi', 'grace.mwangi@gmail.com', 'hashed_password_1', '0712345678', 'guest'),
  ('22222222-2222-2222-2222-222222222222', 'Daniel', 'Kimani', 'daniel.kimani@airhost.com', 'hashed_password_2', '0723456789', 'host'),
  ('33333333-3333-3333-3333-333333333333', 'Linda', 'Otieno', 'linda.otieno@yahoo.com', 'hashed_password_3', '0734567890', 'guest');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Karura Forest Retreat', 'Private two-bedroom eco-lodge near Karura Forest, ideal for nature lovers.', 'Nairobi, Kenya', 9500.00),
  ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '22222222-2222-2222-2222-222222222222', 'Diani Beachfront Villa', 'Luxurious villa with ocean view, pool, and private beach access.', 'Diani Beach, Kenya', 15500.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('b1111111-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-12-20', '2025-12-25', 47500.00, 'confirmed'),
  ('b2222222-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', '2025-08-10', '2025-08-15', 77500.00, 'pending');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('p1111111-pppp-pppp-pppp-ppppppppppp1', 'b1111111-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 47500.00, 'paypal');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('r1111111-rrrr-rrrr-rrrr-rrrrrrrrrrr1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 5, 'Fantastic forest getaway! Clean, quiet, and serene.'),
  ('r2222222-rrrr-rrrr-rrrr-rrrrrrrrrrr2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 4, 'Beautiful view and friendly host, but WiFi was a bit spotty.');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('m1111111-mmmm-mmmm-mmmm-mmmmmmmmmmm1', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Daniel, is the retreat pet-friendly?'),
  ('m2222222-mmmm-mmmm-mmmm-mmmmmmmmmmm2', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Grace, yes, we welcome pets with prior notice.');

