-- Find the total number of bookings made by each user using the COUNT function and GROUP BY clause.
SELECT 
    user_id,
    COUNT(booking_id) AS total_bookings
FROM 
    Booking
GROUP BY 
    user_id;


-- Rank properties based on the total number of bookings they have received using the ROW_NUMBER or RANK window function.
SELECT 
    property_id,
    name,
    location,
    COUNT(booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(booking_id) DESC) AS booking_rank
FROM 
    Property P
LEFT JOIN 
    Booking B ON P.property_id = B.property_id
GROUP BY 
    property_id, name, location
ORDER BY 
    booking_rank;
