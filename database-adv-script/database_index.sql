-- Create an index on user_id in the User table for fast JOIN operations
CREATE INDEX idx_user_user_id ON User(user_id);

-- Create an index on email in the User table for faster lookups
CREATE INDEX idx_user_email ON User(email);

-- Create an index on role in the User table for filtering by role
CREATE INDEX idx_user_role ON User(role);

-- Create an index on booking_id in the Booking table for faster lookups
CREATE INDEX idx_booking_booking_id ON Booking(booking_id);

-- Create an index on user_id in the Booking table for JOIN operations with User
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Create an index on property_id in the Booking table for JOIN operations with Property
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Create an index on status in the Booking table for faster filtering by status
CREATE INDEX idx_booking_status ON Booking(status);

-- Create an index on start_date in the Booking table for range queries by date
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Create an index on end_date in the Booking table for range queries by date
CREATE INDEX idx_booking_end_date ON Booking(end_date);

-- Create an index on property_id in the Property table for fast JOIN operations
CREATE INDEX idx_property_property_id ON Property(property_id);

-- Create an index on host_id in the Property table for fast JOIN operations with User
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Create an index on location in the Property table for fast searches and sorting
CREATE INDEX idx_property_location ON Property(location);

-- Create an index on pricepernight in the Property table for sorting and filtering by price
CREATE INDEX idx_property_pricepernight ON Property(pricepernight);


EXPLAIN ANALYZE 
SELECT 
    B.booking_id, 
    B.start_date, 
    B.end_date, 
    B.status 
FROM 
    Booking B 
WHERE 
    B.status = 'confirmed' AND B.user_id = 123;

EXPLAIN ANALYZE 
SELECT 
    B.booking_id, 
    B.start_date, 
    B.end_date, 
    B.status 
FROM 
    Booking B 
WHERE 
    B.status = 'confirmed' AND B.user_id = 123;