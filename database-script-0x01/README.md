### AirBnB Database Schema
This repository contains the SQL schema for the AirBnB platform's database, defining the structure of the core entities and their relationships. The schema is designed to manage users, properties, bookings, payments, reviews, and messages, following relational database best practices.

## 1. User
Represents the users of the platform (guests, hosts, admins).

- user_id (UUID, Primary Key): Unique identifier for each user.
- first_name (VARCHAR, NOT NULL): User's first name.
- last_name (VARCHAR, NOT NULL): User's last name.
- email (VARCHAR, UNIQUE, NOT NULL): User's email address (must be unique).
- password_hash (VARCHAR, NOT NULL): Hashed password for security.
- phone_number (VARCHAR, NULL): Optional user phone number.
- role (ENUM: 'guest', 'host', 'admin', NOT NULL): Role of the user.
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Timestamp of when the user was created.

## 2. Property
Represents the properties listed by hosts.

- property_id (UUID, Primary Key): Unique identifier for each property.
- host_id (UUID, Foreign Key): References user_id from User (host of the property).
- name (VARCHAR, NOT NULL): Name of the property.
- description (TEXT, NOT NULL): Detailed description of the property.
- location (VARCHAR, NOT NULL): Location of the property.
- pricepernight (DECIMAL, NOT NULL): Price per night for the property.
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Timestamp of when the property was created.
- updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP): Timestamp of the last update to the property.

## 3. Booking
Represents a booking made by a user for a specific property.

- booking_id (UUID, Primary Key): Unique identifier for each booking.
- property_id (UUID, Foreign Key): References property_id from Property.
- user_id (UUID, Foreign Key): References user_id from User.
- start_date (DATE, NOT NULL): Start date of the booking.
- end_date (DATE, NOT NULL): End date of the booking.
- total_price (DECIMAL, NOT NULL): Total price of the booking.
- status (ENUM: 'pending', 'confirmed', 'canceled', NOT NULL): Current status of the booking.
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Timestamp of when the booking was made.

## 4. Payment
Represents the payment associated with a booking.

- payment_id (UUID, Primary Key): Unique identifier for each payment.
- booking_id (UUID, Foreign Key): References booking_id from Booking.
- amount (DECIMAL, NOT NULL): Amount of the payment.
- payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Timestamp when the payment was made.
- payment_method (ENUM: 'credit_card', 'paypal', 'stripe', NOT NULL): Method used for payment.

## 5. Review
Represents a review left by a user for a property.

- review_id (UUID, Primary Key): Unique identifier for each review.
- property_id (UUID, Foreign Key): References property_id from Property.
- user_id (UUID, Foreign Key): References user_id from User.
- rating (INTEGER, CHECK: 1-5, NOT NULL): Rating given by the user (between 1 and 5).
- comment (TEXT, NOT NULL): Comment left by the user.
- created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Timestamp when the review was posted.

## 6. Message
Represents a message sent between users (e.g., between a guest and host).

- message_id (UUID, Primary Key): Unique identifier for each message.
- sender_id (UUID, Foreign Key): References user_id from User (sender of the message).
- recipient_id (UUID, Foreign Key): References user_id from User (recipient of the message).
- message_body (TEXT, NOT NULL): Content of the message.
- sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Timestamp when the message was sent.

## SQL Schema
The SQL schema is provided in the form of CREATE TABLE statements. It includes the following:

Table definitions for User, Property, Booking, Payment, Review, and Message.
Primary Keys and Foreign Keys to define relationships between entities.
Unique Constraints on the email field in the User table.
Check Constraints on the rating field in the Review table.
Enum Constraints on fields like role, status, and payment_method.
Indexes on fields like email, property_id, booking_id, and payment_id to optimize query performance.

## Constraints and Relationships
User Table:
Unique constraint on the email column.
Each User can have many Bookings, Reviews, and Messages.
Property Table:
- Foreign key constraint on host_id (relating to the User table).
- Each Property can have many Bookings and Reviews.
Booking Table:
- Foreign key constraints on property_id and user_id.
- A booking can have one associated Payment.
Payment Table:
- Foreign key constraint on booking_id.
Review Table:
- Foreign key constraints on property_id and user_id.
Message Table:
- Foreign key constraints on sender_id and recipient_id.

## Indexing
Indexes are created for the following columns to improve query performance:

email in the User table.
property_id in both the Property and Booking tables.
booking_id in both the Booking and Payment tables.
review_id in the Review table.
message_id in the Message table.
These indexes allow for faster searches, lookups, and joins across related tables.

## Usage
To use the schema:

Copy the SQL schema provided in this repository.
Execute the SQL statements in your database management system (DBMS) to create the tables and apply the constraints.
Populate the tables with data related to users, properties, bookings, payments, reviews, and messages as per your application's requirements.