/* ================================================================ *\
   Author: Sid
   Create date: 18 May 2024
   Description: Recapping basic SQL
   Course: https://www.udacity.com/course/sql-for-data-analysis--ud198
\* ================================================================ */



/* ================================================================ *\
                            BASIC QUERIES
\* ================================================================ */

----------------------------------------------------------------------
-- SELECT, FROM & LIMIT
----------------------------------------------------------------------

-- Selecting all and limiting the results
SELECT *
  FROM orders
 LIMIT 10;

-- Selecting specific columns
SELECT occurred_at,
       account_id,
       channel
  FROM web_events
 LIMIT 15;

----------------------------------------------------------------------
-- ORDER BY
----------------------------------------------------------------------

-- The 10 earliest orders in the orders table
SELECT id,
       occurred_at,
       total_amt_usd
  FROM orders
 ORDER BY occurred_at
 LIMIT 10;

-- Top 5 orders in terms of largest total_amt_usd
SELECT id,
       account_id,
       total_amt_usd
  FROM orders
 ORDER BY total_amt_usd DESC
 LIMIT 5;

-- Lowest 20 orders in terms of smallest total_amt_usd
SELECT id,
       account_id,
       total_amt_usd
  FROM orders
 ORDER BY total_amt_usd
 LIMIT 20;

-- Display the order ID, account ID, and total dollar amount for all orders, sorted first by account ID (ascending), then by total dollar amount (descending)
SELECT id,
account_id,
total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;

-- Now write a query that again displays order ID, account ID, and total dollar amount for each order, but this time sorted first by total dollar amount (in descending order), 
-- and then by account ID (in ascending order)
SELECT id,
account_id,
total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;

----------------------------------------------------------------------
-- WHERE
----------------------------------------------------------------------

-- Pull the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.
SELECT *
  FROM orders
 WHERE gloss_amt_usd >= 1000
 LIMIT 5;

-- Pull the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
SELECT *
  FROM orders
 WHERE total_amt_usd < 500
 LIMIT 10;

