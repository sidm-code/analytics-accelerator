/* ================================================================ *\
|  Author: Sid                                                       |
|  Create date: 18 May 2024                                          |
|  Description: Recapping basic SQL                                  |
|  Link: https://www.udacity.com/course/sql-for-data-analysis--ud198 |
\* ================================================================ */


/* ================================================================ *\
|                            BASIC QUERIES                           |
\* ================================================================ */

-- ==================================================================
-- SELECT, FROM & LIMIT
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
-- ORDER BY
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
-- WHERE
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
-- WHERE with non-numeric data
-- ==================================================================

-- Filter the accounts table for Exxon Mobil
SELECT name,
       website,
       primary_poc
  FROM accounts
 WHERE name = 'Exxon Mobil';

-- ==================================================================
-- Derived columns
-- ==================================================================
