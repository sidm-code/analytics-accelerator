/* ================================================================ *\
|  Author: Sid                                                       |
|  Create date: 18 May 2024                                          |
|  Description: Recapping basic SQL                                  |
|  Link: https://www.udacity.com/course/sql-for-data-analysis--ud198 |
\* ================================================================ */

/* ================================================================ *\
|                         TABLE OF CONTENTS                          |
|====================================================================|
| 1. BASIC QUERIES                                                   |
|    1.1 SELECT, FROM & LIMIT                                        |
|    1.2 ORDER BY                                                    |
|    1.3 WHERE                                                       |
|    1.4 WHERE (NON NUMERIC)                                         |
|    1.5 DERIVED COLUMNS                                             |
|    1.6 LIKE                                                        |
|====================================================================|
\* ================================================================ */

/* ================================================================ *\
|                            BASIC QUERIES                           |
\* ================================================================ */

-- ==================================================================
-- 1.1 SELECT, FROM & LIMIT
-- ==================================================================

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

-- ==================================================================
-- 1.2 ORDER BY
-- ==================================================================

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

-- Sorting by account ID (ascending) and total dollar amount (descending)
SELECT id,
account_id,
total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;

-- Sorting by total dollar amount (descending) and account ID (ascending)
SELECT id,
account_id,
total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;

-- ==================================================================
-- 1.3 WHERE
-- ==================================================================

-- Pull the first 5 rows with gloss_amt_usd >= 1000
SELECT *
  FROM orders
 WHERE gloss_amt_usd >= 1000
 LIMIT 5;

-- Pull the first 10 rows with total_amt_usd < 500
SELECT *
  FROM orders
 WHERE total_amt_usd < 500
 LIMIT 10;

-- ==================================================================
-- 1.4 WHERE (NON-NUMERIC)
-- ==================================================================

-- Filter the accounts table for Exxon Mobil
SELECT name,
       website,
       primary_poc
  FROM accounts
 WHERE name = 'Exxon Mobil';

-- ==================================================================
-- 1.5 DERIVED COLUMNS
-- ==================================================================

-- Find the unit price for standard paper for each order.
SELECT id, account_id, standard_amt_usd/standard_qty AS standard_unit_price
  FROM orders
 LIMIT 10;

-- Find the percentage of revenue that comes from poster paper for each order. 
SELECT id, account_id, poster_amt_usd / (standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS poster_perc_revenue
  FROM orders
 LIMIT 10;

-- ==================================================================
-- 1.6 LIKE
-- ==================================================================

-- Find all the companies whose names start with 'C'
SELECT *
  FROM accounts
 WHERE name LIKE 'C%';

-- Find all companies whose names contain the string 'one'
SELECT *
  FROM accounts
 WHERE name LIKE '%one%';

-- Find all companies whose names end with 's'
SELECT *
  FROM accounts
 WHERE name LIKE '%s';

