/*
Problem: 1321. Restaurant Growth
Link: https://leetcode.com/problems/restaurant-growth/
Difficulty: Medium
Concepts: Window Functions (SUM() OVER), Moving Average, ROWS BETWEEN

Description:
You are the restaurant owner and you want to analyze a possible expansion.
Compute the moving average of how much customers paid in a 7-day window 
(current day + 6 days before). 
Return result ordered by visited_on in ascending order.
*/

-- My Solution (The Modern Window Function Way):
WITH DailySums AS (
    SELECT 
        visited_on, 
        SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
)
SELECT 
    visited_on,
    amount,
    average_amount
FROM (
    SELECT 
        visited_on,
        SUM(daily_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        ROUND(AVG(daily_amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount,
        DENSE_RANK() OVER(ORDER BY visited_on) AS day_num
    FROM DailySums
) AS MovingStats
WHERE day_num >= 7;

/*
Notes:
- DailySums (CTE): First, we group by day so we have one total per date.
- ROWS BETWEEN 6 PRECEDING AND CURRENT ROW: This is the magic! It tells SQL 
  to look back exactly 6 rows to calculate the sum and average.
- DENSE_RANK() / day_num: We only want to show results starting from the 7th day 
  (because we don't have enough data for a full "7-day window" before that).
*/