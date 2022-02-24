CREATE DATABASE fast_feasts_db;


CREATE TABLE users(id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT,phone INT, email TEXT);


ALTER TABLE users ADD COLUMN password_digest TEXT;


CREATE TABLE booking(id SERIAL PRIMARY KEY, user_id TEXT, booking_name TEXT,date DATE, time TIME, meals TEXT);

CREATE TABLE order_items(id SERIAL PRIMARY KEY, order_id TEXT, user_id TEXT, meal TEXT, price INT, cooking_instructions TEXT);


INSERT INTO order_items(order_id , user_id , meal , price , cooking_instructions) VALUES (6, 1, 'chips', 6, 'cooked extra long'), (6, 1, 'Sandwich', 10, 'No Tom');