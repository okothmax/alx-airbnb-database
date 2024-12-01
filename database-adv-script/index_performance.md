## Identity of  High-Usage Columns
# User Table:

`user_id:` Used for joining with other tables like Booking, Review, and Message.
`email:` Frequently used for lookups or in WHERE clauses.
`role:` Often used in filtering conditions.

# Booking Table:

`booking_id:` Often used for lookups, and could be involved in WHERE or JOIN clauses.
`user_id:` Used to link to the User table.
`property_id:` Used to join with the Property table.
`status:` Frequently used in filtering (e.g., for pending, confirmed, or canceled bookings).
`start_date, end_date:` Used for filtering, sorting, and range queries (e.g., by date).

# Property Table:

`property_id:` Often used in JOIN operations and WHERE clauses.
`host_id:` Used to join with the User table.
`location:` Could be used for searching or sorting properties by location.
`pricepernight:` Often used in ORDER BY or WHERE clauses for price filtering.

## Measuring Query Performance Using EXPLAIN or ANALYZE
To evaluate the performance improvements of these indexes, we can use EXPLAIN or ANALYZE to measure the query execution plans before and after adding indexes.

Before Adding Indexes:

For example, to measure the performance of a query that retrieves bookings for a user with a specific status:

```sql
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
```

This will give us information on how the database plans to execute the query and how much time it takes without the indexes in place.

After Adding Indexes:

After creating the indexes, run the same query again with EXPLAIN ANALYZE:

```sql
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
```

Comparing the results of both executions. The query plan should now indicate that the database uses the newly created indexes, reducing the need for full table scans and improving performance (e.g., faster response times).