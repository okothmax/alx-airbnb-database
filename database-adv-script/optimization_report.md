```sql
EXPLAIN ANALYZE
SELECT 
    B.booking_id,
    B.start_date,
    B.end_date,
    B.total_price,
    U.user_id,
    U.first_name,
    U.last_name,
    U.email,
    P.property_id,
    P.name AS property_name,
    P.location AS property_location,
    P.pricepernight,
    Pay.payment_id,
    Pay.amount AS payment_amount,
    Pay.payment_date,
    Pay.payment_method
FROM 
    Booking B
INNER JOIN 
    User U ON B.user_id = U.user_id
INNER JOIN 
    Property P ON B.property_id = P.property_id
INNER JOIN 
    Payment Pay ON B.booking_id = Pay.booking_id;
```

```sql
-- Refactored Query: Retrieve bookings with user, property, and payment details
SELECT 
    B.booking_id,
    B.start_date,
    B.end_date,
    B.total_price,
    U.user_id,
    U.first_name,
    U.last_name,
    U.email,
    P.property_id,
    P.name AS property_name,
    P.location AS property_location,
    P.pricepernight,
    Pay.payment_id,
    Pay.amount AS payment_amount,
    Pay.payment_date,
    Pay.payment_method
FROM 
    Booking B
INNER JOIN 
    User U ON B.user_id = U.user_id
INNER JOIN 
    Property P ON B.property_id = P.property_id
LEFT JOIN 
    Payment Pay ON B.booking_id = Pay.booking_id
WHERE
    B.start_date >= CURRENT_DATE  -- Filter to only show future bookings
ORDER BY 
    B.start_date;  -- Order by start date for better query sorting performance
```