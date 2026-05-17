-- Current Date & Time
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

-- Extract Year Month Day
SELECT
YEAR(order_date),
MONTH(order_date),
DAY(order_date)
FROM orders;

-- Extract using EXTRACT
SELECT
EXTRACT(YEAR FROM order_date),
EXTRACT(MONTH FROM order_date),
EXTRACT(DAY FROM order_date)
FROM orders;

-- Month Name and Day Name
SELECT
MONTHNAME(order_date),
DAYNAME(order_date)
FROM orders;

-- Weekday and DayOfWeek
SELECT
WEEKDAY(order_date),
DAYOFWEEK(order_date)
FROM orders;

-- Identify Weekends
SELECT order_id, order_date
FROM orders
WHERE DAYNAME(order_date) IN ('Saturday', 'Sunday');

-- Identify Weekdays
SELECT order_id, order_date
FROM orders
WHERE DAYOFWEEK(order_date) BETWEEN 2 AND 6;

-- Add 5 Days
SELECT
order_date,
DATE_ADD(order_date, INTERVAL 5 DAY)
FROM orders;

-- Subtract 3 Days
SELECT
order_date,
DATE_SUB(order_date, INTERVAL 3 DAY)
FROM orders;

-- Add 1 Month
SELECT
DATE_ADD(order_date, INTERVAL 1 MONTH)
FROM orders;

-- Add 1 Year
SELECT
DATE_ADD(order_date, INTERVAL 1 YEAR)
FROM orders;

-- DATEDIFF
SELECT
order_id,
DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders;

-- TIMESTAMPDIFF
SELECT
TIMESTAMPDIFF(DAY, order_date, delivery_date) AS days_diff
FROM orders;

-- Last Day of Month
SELECT LAST_DAY(order_date)
FROM orders;

-- First Day of Month
SELECT
DATE_SUB(order_date, INTERVAL DAY(order_date)-1 DAY)
FROM orders;

-- Date Format
SELECT
DATE_FORMAT(order_date, '%d-%m-%Y')
FROM orders;

SELECT
DATE_FORMAT(order_date, '%M %d, %Y')
FROM orders;

-- STR_TO_DATE
SELECT
STR_TO_DATE('15-01-2024', '%d-%m-%Y');

-- Timestamp Formatting
SELECT
DATE_FORMAT(order_timestamp, '%d-%m-%Y %H:%i:%s')
FROM orders;

-- Filter by January
SELECT *
FROM orders
WHERE MONTH(order_date) = 1;

-- Filter by February
SELECT *
FROM orders
WHERE MONTHNAME(order_date) = 'February';

-- Financial Year
SELECT order_date,
CASE
WHEN MONTH(order_date) >= 4
THEN CONCAT(YEAR(order_date), '-', YEAR(order_date)+1)
ELSE CONCAT(YEAR(order_date)-1, '-', YEAR(order_date))
END AS financial_year
FROM orders;

-- Orders in Last 7 Days
SELECT *
FROM orders
WHERE order_date >= CURDATE() - INTERVAL 7 DAY;

-- Orders Placed Today
SELECT *
FROM orders
WHERE DATE(order_timestamp) = CURDATE();
