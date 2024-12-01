## 1NF
- In your diagram, each entity (such as User, Property, Booking, etc.) has atomic attributes, and there’s a primary key for each entity. For example, in the User table, fields like first_name, last_name, and email contain indivisible values, satisfying 1NF.

## 2NF
- The User table has a simple primary key (user_id), and all other attributes like first_name, last_name, email, etc., depend on user_id. There’s no partial dependency, as everything in the User table is fully dependent on user_id.
- The Property table has a simple primary key (property_id), and all other attributes like name, description, and price_per_night depend directly on property_id.

## 3NF
- User Table: All non-key attributes (first_name, last_name, email, etc.) depend directly on user_id, the primary key. There are no dependencies between non-key attributes.
- Property Table: All non-key attributes (name, description, price_per_night, etc.) depend directly on property_id. There are no dependencies between non-key attributes.
- Booking Table: All attributes such as date_in, date_out, and total_price depend directly on booking_id. There are no transitive dependencies.
- Message Table: The attributes like message_body, sender_id, recipient_id, etc., depend directly on message_id, with no transitive dependencies.
- Review Table: Similarly, attributes like rating, comment, and date_posted depend directly on review_id.
- Payment Table: The attributes like status, date_paid, and amount depend directly on payment_id.