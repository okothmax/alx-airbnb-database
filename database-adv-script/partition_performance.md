## Report on Improvements
Report: Performance Improvements After Implementing Partitioning

# Query Execution Time:

Before partitioning, querying the Booking table for a specific date range involved a full table scan, resulting in slower query performance.
After partitioning, the query execution time is significantly reduced as the database engine can now scan only the relevant partition (e.g., Booking_2023 for bookings in May 2023).
Resource Usage:

Partitioning helps reduce the workload on the database server, as fewer rows are scanned per query.
This optimization reduces I/O and CPU usage, especially when dealing with a large number of records.

# Improved Query Performance:

Queries that filter by date range (e.g., start_date) are much faster after partitioning. The database engine can skip irrelevant partitions, reducing the overall query time.
For instance, searching for bookings in May 2023 will only scan the Booking_2023 partition, instead of the entire Booking table.

# Maintenance and Data Management:

Partitioning also helps in easier data management. For instance, old data (e.g., bookings older than 5 years) can be easily archived or dropped by removing entire partitions, which is much more efficient than deleting rows one by one.