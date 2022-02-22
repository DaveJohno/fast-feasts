CREATE DATABASE fast_feasts_db;


CREATE TABLE users(id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT, email TEXT );


ALTER TABLE users ADD COLUMN password_digest TEXT;