CREATE DATABASE fast_feasts_db;


CREATE TABLE users(id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT,phone INT, email TEXT);


ALTER TABLE users ADD COLUMN password_digest TEXT;


CREATE TABLE booking(id SERIAL PRIMARY KEY, user_id TEXT, booking_name TEXT,date DATE, time TIME, meals TEXT);