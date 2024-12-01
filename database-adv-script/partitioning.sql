-- Query fetching bookings for a specific date range, unoptimized
EXPLAIN ANALYZE
SELECT 
    booking_id, 
    user_id, 
    property_id, 
    start_date, 
    end_date, 
    total_price
FROM 
    Booking
WHERE 
    start_date BETWEEN '2023-05-01' AND '2023-05-31';

    
-- Partitioning the Booking table based on the start_date column

-- Step 1: Creating the parent table for partitioning
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (start_date > '2000-01-01') -- Example constraint for valid start dates
) PARTITION BY RANGE (start_date);

-- Step 2: Creating partitions for different date ranges. These can be monthly, quarterly, or yearly depending on dataset size.
-- Example: Creating partitions for the year 2023 and beyond

CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');


-- Step 3: Adding indexes on the partitioned tables to optimize query performance
CREATE INDEX idx_booking_start_date_2023 ON Booking_2023(start_date);
CREATE INDEX idx_booking_start_date_2024 ON Booking_2024(start_date);
CREATE INDEX idx_booking_start_date_2025 ON Booking_2025(start_date);


-- Query fetching bookings for a specific date range, optimized with partitioning
EXPLAIN ANALYZE
SELECT 
    booking_id, 
    user_id, 
    property_id, 
    start_date, 
    end_date, 
    total_price
FROM 
    Booking
WHERE 
    start_date BETWEEN '2023-05-01' AND '2023-05-31';


