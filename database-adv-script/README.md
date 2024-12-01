### SQL Joins Example
This repository contains SQL queries designed to master the use of different types of joins: INNER JOIN, LEFT JOIN, and FULL OUTER JOIN. These queries help retrieve relevant data from multiple tables in various scenarios.

## Objective
The purpose of this repository is to demonstrate the use of different SQL joins to solve common data retrieval problems. The queries involve retrieving information about users, bookings, properties, and reviews in different scenarios:

Retrieving all bookings and the users who made those bookings.
Retrieving all properties and their reviews, including properties that have no reviews.
Retrieving all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SQL Queries

1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings.

```sql
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM 
    Booking
INNER JOIN 
    User ON Booking.user_id = User.user_id;
```

Explanation:
The INNER JOIN fetches records where a matching user_id exists in both Booking and User tables. This means the query only returns bookings that have an associated user.

2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews.

```sql
SELECT 
    Property.property_id,
    Property.name,
    Property.location,
    Property.pricepernight,
    Review.review_id,
    Review.rating,
    Review.comment
FROM 
    Property
LEFT JOIN 
    Review ON Property.property_id = Review.property_id;
```

Explanation:
The LEFT JOIN ensures all properties are returned, including those without reviews. For properties with no reviews, the Review fields will be NULL.

3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

```sql
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price
FROM 
    User
FULL OUTER JOIN 
    Booking ON User.user_id = Booking.user_id;
```

Explanation:
The FULL OUTER JOIN returns all records from both User and Booking tables. This includes users with no bookings (with NULL booking details) and bookings without linked users (with NULL user details).

## Usage
To use these queries:

Copy the SQL code for the join type you need.
Execute the queries on a relational database that contains tables like User, Booking, Property, and Review.
Adjust the column names and table names as needed to match your database schema.
These queries are designed to help you master SQL joins for data retrieval across multiple related tables.