-- In case there is already a bank_homework database, drop it
DROP DATABASE IF EXISTS bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;

-- Connect to the bank_homework databases
\c bank_homework


-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  created_at DATE,
  amount NUMERIC NOT NULL,
  payer_name TEXT NOT NULL,
  recipient_name TEXT NOT NULL,
  description TEXT);

-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments ADD zipcode INTEGER;

-- Insert 20 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description) VALUES
  ('2010-10-10', 10000, 'Apple', 'Diarmuid', 'Salary'),
  ('2010-10-10', 10000, 'Google', 'Andrew', 'Salary'),
  ('2010-10-10', 10000, 'Facebook', 'Sinead', 'Salary'),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', ''),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', ''),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', 'Food'),
  ('2014-06-17', 50, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 1, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 1, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 1, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', 'Food'),
  ('2010-10-10', 50, 'Diarmuid', 'Sinead', 'Food');


-- You receive notice that the payment with id of 9 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments SET amount = amount + 10 WHERE id = 9;

-- Delete all payments with an amount under $2
DELETE FROM payments WHERE amount < 2;

-- Select all entries from the payments table
SELECT * FROM payments;

-- In a single query, output all payments ordered from the largest to the smallest
SELECT * FROM payments ORDER BY amount DESC;

-- In a single query, output the names of all distinct recipients
SELECT DISTINCT recipient_name FROM payments;

-- In a single query, select all payments created in the past week
SELECT * FROM payments WHERE created_at > '2014-06-11';

-- In a single query, select all payments with a blank description
SELECT * FROM payments WHERE description = '';

-- In a single query, select all payments matching the name of one of the payers (choose any single one)
SELECT * FROM payments WHERE payer_name = 'Diarmuid';
