-- Insert sample users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (UUID(), 'John', 'Doe', 'johndoe@example.com', 'hashedpassword1', '1234567890', 'guest'),
  (UUID(), 'Jane', 'Smith', 'janesmith@example.com', 'hashedpassword2', '0987654321', 'host'),
  (UUID(), 'Alice', 'Johnson', 'alicejohnson@example.com', 'hashedpassword3', '1122334455', 'admin'),
  (UUID(), 'Bob', 'Brown', 'bobbrown@example.com', 'hashedpassword4', '5566778899', 'host');

-- Insert sample properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'janesmith@example.com'), 'Beachfront Villa', 'A beautiful villa by the sea', 'Miami Beach, FL', 250.00),
  (UUID(), (SELECT user_id FROM User WHERE email = 'bobbrown@example.com'), 'Mountain Cabin', 'Cozy cabin in the mountains', 'Aspen, CO', 180.00),
  (UUID(), (SELECT user_id FROM User WHERE email = 'janesmith@example.com'), 'City Apartment', 'Modern apartment in the city center', 'New York, NY', 150.00);

-- Insert sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Beachfront Villa'), (SELECT user_id FROM User WHERE email = 'johndoe@example.com'), '2024-12-01', '2024-12-07', 1750.00, 'confirmed'),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Mountain Cabin'), (SELECT user_id FROM User WHERE email = 'johndoe@example.com'), '2024-12-15', '2024-12-20', 900.00, 'pending'),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'City Apartment'), (SELECT user_id FROM User WHERE email = 'alicejohnson@example.com'), '2024-12-10', '2024-12-12', 450.00, 'confirmed');

-- Insert sample reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Beachfront Villa'), (SELECT user_id FROM User WHERE email = 'alicejohnson@example.com'), 5, 'Great beachfront property!'),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Mountain Cabin'), (SELECT user_id FROM User WHERE email = 'janesmith@example.com'), 4, 'Cozy cabin, but could be better'),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'City Apartment'), (SELECT user_id FROM User WHERE email = 'johndoe@example.com'), 3, 'Decent apartment, nothing special');

  -- Insert sample payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  (UUID(), (SELECT booking_id FROM Booking WHERE status = 'confirmed' AND total_price = 1750.00), 1750.00, '2024-11-20', 'credit_card'),
  (UUID(), (SELECT booking_id FROM Booking WHERE status = 'confirmed' AND total_price = 450.00), 450.00, '2024-11-25', 'paypal');

-- Insert sample messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'johndoe@example.com'), (SELECT user_id FROM User WHERE email = 'janesmith@example.com'), 'Hi, I would like to confirm my booking for the Beachfront Villa from December 1st to December 7th.'),
  (UUID(), (SELECT user_id FROM User WHERE email = 'bobbrown@example.com'), (SELECT user_id FROM User WHERE email = 'johndoe@example.com'), 'Your booking request for the Mountain Cabin has been received. I will confirm shortly!'),
  (UUID(), (SELECT user_id FROM User WHERE email = 'janesmith@example.com'), (SELECT user_id FROM User WHERE email = 'alicejohnson@example.com'), 'Thanks for your review! I hope you enjoyed the City Apartment.');
